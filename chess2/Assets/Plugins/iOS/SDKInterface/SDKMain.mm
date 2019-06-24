
#import "SDKMain.h"
#import "SDKForWechat.h"
#import "SDKForXianLiao.h"
#import "SDKForLiaoBei.h"
#import "MWApi.h"
#import "sys/utsname.h"
#import "Reachability.h"
#import <AlicloudHttpDNS/AlicloudHttpDNS.h>
#import <AlicloudUtils/AlicloudIPv6Adapter.h>
#import <Bugly/Bugly.h>
#import "JPUSHService.h"
#import <UserNotifications/UserNotifications.h>
#import <JMessage/JMessage.h>
#import "ProtoMgr.h"
#import "JMessageMgr.h"
#import "TalkingDataMgr.h"
#import "SugramApiManager.h"
#import <LBSDK/LBSDK.h>



// 加了这句话后就有回调函数了
IMPL_APP_CONTROLLER_SUBCLASS (SDKMain)

@interface SDKMain() <AMapLocationManagerDelegate, JPUSHRegisterDelegate>
@property (nonatomic, strong) Reachability * internetReachablity;
@property (nonatomic, strong) AMapLocationManager *locationManager;

@property (nonatomic, copy) AMapLocatingCompletionBlock completionBlock;
@end



@implementation SDKMain

static SDKMain * instance = nil;
static NSString * netWorkStatus = nil;
static HttpDnsService *httpdns;
static NSString * jpushStatus = @"1";//是否进行 极光推送的标识

+(SDKMain *) SharedInstance
{
    if (instance == nil)
    {
        instance = [[SDKMain alloc] init];
    }
    
    return instance;
}

-(id)init
{
    self = [super init];
    
    
    return self;
}

-(void) initLocationManager {
    self.locationManager = [[AMapLocationManager alloc] init];
    
    [self.locationManager setDelegate:self];
    
    //设置期望定位精度(千米就行)
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyKilometer];
    
    //设置不允许系统暂停定位
    [self.locationManager setPausesLocationUpdatesAutomatically:NO];
    
    //设置允许在后台定位
    [self.locationManager setAllowsBackgroundLocationUpdates:NO];
    
    //设置定位超时时间
    [self.locationManager setLocationTimeout:12];
    
    //设置逆地理超时时间
    [self.locationManager setReGeocodeTimeout:7];
    [self initCompleteBlock];
    
    // [self getHeadResponse];
}

//获取一个baidu head 用作弹出网络允许通知
-(void)getHeadResponse{
    NSURL *url = [NSURL URLWithString:@"http://www.baidu.com/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"HEAD";
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSLog(@"文件长度-%lld",response.expectedContentLength);
    }];
}

///*
// * 降级过滤器，您可以自己定义HTTPDNS降级机制
// */
//- (BOOL)shouldDegradeHTTPDNS:(NSString *)hostName {
//    NSLog(@"Enters Degradation filter.");
//    // 根据HTTPDNS使用说明，存在网络代理情况下需降级为Local DNS
//    if ([NetworkManager configureProxies]) {
//        NSLog(@"Proxy was set. Degrade!");
//        return YES;
//    }
//
//    return NO;
//}

- (void) reachabilityChanged:(NSNotification *)note
{
    Reachability* curReach = [note object];
    [self updateInterfaceWithReachability:curReach];
}



- (NSString*)getNetWorkStatus
{
    //NSLog(@"%s",[self.netWorkStatus UTF8String]);
    return netWorkStatus;
}

- (void)initCompleteBlock
{
    self.completionBlock = ^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error)
    {
        if (error != nil)
        {
            //定位错误：此时location和regeocode没有返回值，不进行annotation的添加
            NSLog(@"定位错误:{%ld - %@};", error.code, error.localizedDescription);
            NSNumber *errorCode = [NSNumber numberWithInt:error.code];
            NSString *errorInfo = [NSString stringWithFormat:@"%@", error.localizedDescription];
            NSDictionary * locationData = [NSDictionary dictionaryWithObjectsAndKeys:
                                           errorCode, @"errorCode",
                                           errorInfo, @"errorInfo",
                                           nil];
            UnitySendMessage("GameSDKCallback", "OnGetLocationResult", [[self dictionaryToJson:locationData] UTF8String]);
            return;
        }
        
        //修改label显示内容
        if (regeocode)
        {
            NSString* address = [NSString stringWithFormat:@"%@", regeocode.formattedAddress];
            NSNumber *latitudeNum = [NSNumber numberWithDouble:location.coordinate.latitude];
            NSString *latitude = [latitudeNum stringValue];
            NSNumber *longitudeNum = [NSNumber numberWithDouble:location.coordinate.longitude];
            NSString *longitude = [longitudeNum stringValue];
            NSNumber *errorCode = [NSNumber numberWithInt:0];
            NSDictionary * locationData =
            [NSDictionary dictionaryWithObjectsAndKeys:
             errorCode, @"errorCode",
             address,@"address",
             latitude,@"latitude",
             longitude,@"longitude",
             regeocode.country,@"country",
             regeocode.province,@"province",
             regeocode.city,@"city",
             regeocode.district,@"district",
             regeocode.citycode,@"citycode",
             regeocode.adcode,@"adcode",
             regeocode.street,@"street",
             regeocode.number,@"number",
             regeocode.POIName,@"POIName",
             regeocode.AOIName,@"AOIName",
             nil];
            UnitySendMessage("GameSDKCallback", "OnGetLocationResult", [[self dictionaryToJson:locationData] UTF8String]);
        }
        else
        {
            NSNumber *latitudeNum = [NSNumber numberWithDouble:location.coordinate.latitude];
            NSString *latitude = [latitudeNum stringValue];
            NSNumber *longitudeNum = [NSNumber numberWithDouble:location.coordinate.longitude];
            NSString *longitude = [longitudeNum stringValue];
            NSNumber *errorCode = [NSNumber numberWithInt:0];
            NSDictionary * locationData =
            [NSDictionary dictionaryWithObjectsAndKeys:
             errorCode, @"errorCode",
             latitude,@"latitude",
             longitude,@"longitude",
             nil];
            UnitySendMessage("GameSDKCallback", "OnGetLocationResult", [[self dictionaryToJson:locationData] UTF8String]);
        }
    };
}

- (void) BeginLocation:(BOOL)isRegeocode
{
    if (self.locationManager == nil) {
        [self initLocationManager];
    }
    
    if(isRegeocode)
        [self.locationManager requestLocationWithReGeocode:YES completionBlock:self.completionBlock];
    else
        [self.locationManager requestLocationWithReGeocode:NO completionBlock:self.completionBlock];
}

- (double) CaculateDistance:(double)latitude1 : (double)longitude1 : (double)latitude2 : (double)longitude2
{
    double distance = -1;
    //1.将两个经纬度点转成投影点
    MAMapPoint point1 = MAMapPointForCoordinate(CLLocationCoordinate2DMake(latitude1,longitude1));
    MAMapPoint point2 = MAMapPointForCoordinate(CLLocationCoordinate2DMake(latitude2,longitude2));
    //2.计算距离
    distance = MAMetersBetweenMapPoints(point1,point2);
    return distance;
}

- (void)updateInterfaceWithReachability:(Reachability *)reachability
{
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    netWorkStatus = [NSString stringWithFormat: @"%d", netStatus];
//    NSLog(@"UpdateInterfaceWithReachability：%d",netStatus);
    //    switch(netStatus)
//    {
//        case NotReachable:
//            NSLog(@"%s","*******************  NotReachable");
//            netWorkStatus = @"none";
//            break;
//        case kReachableVia2G:
//            NSLog(@"%s","*******************  kReachableVia2G");
//            netWorkStatus = @"2g";
//            break;
//        case kReachableViaWWAN:
//            NSLog(@"%s","*******************  kReachableViaWWAN");
//            netWorkStatus = @"wwan";
//            break;
//        case kReachableVia3G:
//            NSLog(@"%s","*******************  kReachableVia3G");
//            netWorkStatus = @"3g";
//            break;
//        case kReachableVia4G:
//            NSLog(@"%s","*******************  kReachableVia4G");
//            netWorkStatus = @"4g";
//            NSLog(@"%s",[netWorkStatus UTF8String]);
//            break;
//        case ReachableViaWiFi:
//            NSLog(@"%s","*******************  ReachableViaWiFi");
//            netWorkStatus = @"wifi";
//            break;
//    }
}

-(const char*) getIpsByHttpDNS:(const char *)originalUrl
{
    if ([[AlicloudIPv6Adapter getInstance] isIPv6OnlyNetwork]) {
        return originalUrl;
    }
    NSArray* ip = [httpdns getIpsByHostAsync:[NSString stringWithUTF8String:originalUrl]];
    if (ip) {
        NSString *newUrl = @"";
        for(int i = 0; i < [ip count]; i++){
            if (i != 0) {
                newUrl = [newUrl stringByAppendingString:@","];
            }
            NSString *tmp = [[AlicloudIPv6Adapter getInstance] handleIpv4Address:[ip objectAtIndex:i]];
            newUrl = [newUrl stringByAppendingFormat:@"%@", tmp];
        }
//        NSLog(@"%s", [newUrl UTF8String]);
        return [newUrl UTF8String];
    }
    return originalUrl;
}



- (BOOL)application:(UIApplication*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions
{
    instance = self;

    // bugly
    [Bugly startWithAppId:(NSString *)Bugly_APPID];
    [[TalkingDataMgr instance] initSdk];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
//    self.internetReachablity = [Reachability reachabilityForInternetConnection];

    self.internetReachablity = [Reachability reachabilityWithHostName:@"www.baidu.com"];
    [self.internetReachablity startNotifier];
    [self updateInterfaceWithReachability:self.internetReachablity];

//    [self.internetReachablity startNotifier];

    netWorkStatus = nil;

    [AMapServices sharedServices].apiKey = (NSString *)AMapServices_Key;
    BOOL ret = [super application:application didFinishLaunchingWithOptions:launchOptions];
    //MW初始化SDK，必写
    [MWApi registerApp:(NSString *)MW_APIKey];
    [self registerMlink];


    httpdns = [HttpDnsService sharedInstance];
    [httpdns setLogEnabled:FALSE];
    // 设置AccoutID
    [httpdns setAccountID:HTTPDNS_AccountID];
    // 为HTTPDNS服务设置降级机制
    [httpdns setDelegateForDegradationFilter:(id < HttpDNSDegradationDelegate >)self];
    // 允许返回过期的IP
    [httpdns setExpiredIPEnabled:YES];

    [httpdns setPreResolveAfterNetworkChanged:YES];

    //     NSArray *preResolveHosts = @[ @"www.aliyun.com", @"www.taobao.com", @"gw.alicdn.com", @"www.tmall.com", @"dou.bz"];
    // 设置预解析域名列表
    NSArray *array =  [NSArray arrayWithObjects:HTTPDNS_PreResolveHosts count: sizeof(HTTPDNS_PreResolveHosts)/sizeof(HTTPDNS_PreResolveHosts[0])];;
    [httpdns setPreResolveHosts:array];

    [self getHeadResponse];

    [[ProtoMgr instance] initProtoMgr];
    [[JMessageMgr instance] initJMessage:launchOptions :JiGuang_APIKey];

    //---------------------------------------------------------------------------------------------------------------------------------------
    //----------------------------------------------------------------------极光推送代码---------------------------------------------------------------------------
    //-------------------------------------------------------------------------------------------------------------------------------------------------
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 10.0) {
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
        JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
        entity.types = UNAuthorizationOptionAlert | UNAuthorizationOptionBadge | UNAuthorizationOptionSound;
        [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
#endif
    }

#if __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
        // 可以添加自定义 categories
        [JPUSHService registerForRemoteNotificationTypes:(UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert) categories:nil];
    } else {
        // categories 必须为 nil
        [JPUSHService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound |  UIRemoteNotificationTypeAlert) categories:nil];
    }
#else
    // categories 必须为 nil
    [JPUSHService registerForRemoteNotificationTypes:(UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeSound |UIRemoteNotificationTypeAlert) categories:nil];
#endif

    /*
     不使用 IDFA 启动 SDK。
     参数说明：
     appKey: 极光官网控制台应用标识。
     channel: 频道，暂无可填任意。
     apsForProduction: YES: 发布环境；NO: 开发环境。
     */
    [JPUSHService setupWithOption:launchOptions appKey:(NSString *)JiGuang_APIKey channel:@"" apsForProduction:NO];
    //---------------------------------------------------------------------------------------------------------------------------------------
    //-------------------------------------------------------------------------------------------------------------------------------------------------
    //-------------------------------------------------------------------------------------------------------------------------------------------------

    [[SDKForXianLiao SharedInstance] registerApp];
    [[SDKForLiaoBei SharedInstance] registerApp];

    return ret;
}






//---------------------------------------------------------------------------------------------------------------------------------------
//----------------------------------------------------------------------极光推送代码---------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------------------

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Required.
    [JPUSHService registerDeviceToken:deviceToken];
    [JMessage registerDeviceToken:deviceToken];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    // Required.
    [JPUSHService handleRemoteNotification:userInfo];
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(NSInteger))completionHandler {
    
    if([UIApplication sharedApplication].applicationState == UIApplicationStateActive)
    {
        return;
    }
    
    NSLog(@"收到通知了收到通知了收到通知了收到通知了收到通知了收到通知了收到通知了收到通知了收到通知了收到通知了收到通知了收到通知了");
    if ([jpushStatus isEqualToString:@"1"]) {
        
        return;
    }
    
    // Required
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"JPushPluginReceiveNotification" object:userInfo];
    
    // 需要执行这个方法，选择是否提醒用户，有 Badge、Sound、Alert 三种类型可以选择设置
    completionHandler(UNNotificationPresentationOptionAlert | UNNotificationPresentationOptionBadge | UNNotificationPresentationOptionSound);
}

// iOS 10 Support
- (void)jpushNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler {
    // Required
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [JPUSHService handleRemoteNotification:userInfo];
    }
    completionHandler();  // 系统要求执行这个方法
}


-(void) JpushStopPush:(const char *)param
{
    NSString * str = [NSString stringWithUTF8String:param];
    jpushStatus = str;
}


//---------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------------------------------------------------------------


/*
 * 降级过滤器，您可以自己定义HTTPDNS降级机制
 */
- (BOOL)shouldDegradeHTTPDNS:(NSString *)hostName {
    NSLog(@"Enters Degradation filter.");
    // 根据HTTPDNS使用说明，存在网络代理情况下需降级为Local DNS
    NSDictionary *proxySettings = CFBridgingRelease(CFNetworkCopySystemProxySettings());
    
    NSArray *proxies = nil;
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://api.m.taobao.com"];
    
    proxies = CFBridgingRelease(CFNetworkCopyProxiesForURL((__bridge CFURLRef)url,
                                                           (__bridge CFDictionaryRef)proxySettings));
    if (proxies.count > 0)
    {
        NSDictionary *settings = [proxies objectAtIndex:0];
        NSString *host = [settings objectForKey:(NSString *)kCFProxyHostNameKey];
        NSString *port = [settings objectForKey:(NSString *)kCFProxyPortNumberKey];
        
        if (host || port)
        {
            return YES;
        }
    }
    
    // 假设您禁止"www.taobao.com"域名通过HTTPDNS进行解析
    if ([hostName isEqualToString:@"www.taobao.com"]) {
        NSLog(@"The host is in blacklist. Degrade!");
        return YES;
    }
    
    return NO;
}

+ (BOOL) configureProxies
{
    NSDictionary *proxySettings = CFBridgingRelease(CFNetworkCopySystemProxySettings());
    
    NSArray *proxies = nil;
    
    NSURL *url = [[NSURL alloc] initWithString:@"http://api.m.taobao.com"];
    
    proxies = CFBridgingRelease(CFNetworkCopyProxiesForURL((__bridge CFURLRef)url,
                                                           (__bridge CFDictionaryRef)proxySettings));
    if (proxies.count > 0)
    {
        NSDictionary *settings = [proxies objectAtIndex:0];
        NSString *host = [settings objectForKey:(NSString *)kCFProxyHostNameKey];
        NSString *port = [settings objectForKey:(NSString *)kCFProxyPortNumberKey];
        
        if (host || port)
        {
            return YES;
        }
    }
    return NO;
}

//新的方法
- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<NSString*, id> *)options
{
    [MWApi routeMLink:url];
    if ([url.host isEqualToString:@"safepay"]) {
        
        return YES;
    } else if([url.absoluteString rangeOfString:@"itentdata="].location != NSNotFound) {
        NSMutableArray* keys    = [NSMutableArray arrayWithCapacity:3];
        NSMutableArray* values    = [NSMutableArray arrayWithCapacity:3];
        NSLog(@"query : %@",[url query]);
        NSArray * pairs=[[url query] componentsSeparatedByString:@"&"];
        NSMutableDictionary *params=[[NSMutableDictionary alloc] init];
        for (NSString *pair in pairs) {
            NSArray *kv=[pair componentsSeparatedByString:@"="];
            if(kv.count==2)
            {
                NSString *val=[[kv objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                [params setObject:val forKey:[kv objectAtIndex:0]];
            }
        }
        NSString *dataStr=[params objectForKey:@"itentdata"];
        if (dataStr != NULL) {
            UnitySendMessage("GameSDKCallback", "OnMWEnterRoom", [dataStr UTF8String]);
        }
        return YES;
    } else {
        if ([SugramApiManager handleOpenURL:url]) {
            return YES;
        }
        if ([LBSDKApi handleOpenURL:url delegate:[SDKForLiaoBei SharedInstance]]) {
            return YES;
        }
        return [WXApi handleOpenURL:url delegate:[SDKForWechat SharedInstance]];
    }
}

//被废弃的方法. 但是在低版本中会用到.建议写上
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    if([url.absoluteString rangeOfString:@"itentdata="].location != NSNotFound) {
        NSMutableArray* keys    = [NSMutableArray arrayWithCapacity:3];
        NSMutableArray* values    = [NSMutableArray arrayWithCapacity:3];
        NSLog(@"query : %@",[url query]);
        NSArray * pairs=[[url query] componentsSeparatedByString:@"&"];
        NSMutableDictionary *params=[[NSMutableDictionary alloc] init];
        for (NSString *pair in pairs) {
            NSArray *kv=[pair componentsSeparatedByString:@"="];
            if(kv.count==2)
            {
                NSString *val=[[kv objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                [params setObject:val forKey:[kv objectAtIndex:0]];
            }
        }
        NSString *dataStr=[params objectForKey:@"itentdata"];
        if (dataStr != NULL) {
            UnitySendMessage("GameSDKCallback", "OnMWEnterRoom", [dataStr UTF8String]);
        }
        return YES;
    } else {
        [MWApi routeMLink:url];
        
        if ([SugramApiManager handleOpenURL:url]) {
            return YES;
        }
        
        if ([LBSDKApi handleOpenURL:url delegate:[SDKForLiaoBei SharedInstance]]) {
            return YES;
        }
        
        return [WXApi handleOpenURL:url delegate:[SDKForWechat SharedInstance]];
    }
}

//被废弃的方法. 但是在低版本中会用到.建议写上
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    [MWApi routeMLink:url];
    if ([SugramApiManager handleOpenURL:url]) {
        return YES;
    }
    if ([LBSDKApi handleOpenURL:url delegate:[SDKForLiaoBei SharedInstance]]) {
        return YES;
    }
    return [WXApi handleOpenURL:url delegate:[SDKForWechat SharedInstance]];
}

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void (^)(NSArray * _Nullable))restorationHandler
{
    if ([userActivity.activityType isEqualToString:NSUserActivityTypeBrowsingWeb]) {
        NSURL *webpageURL = userActivity.webpageURL;
        NSString *host = webpageURL.host;
        
        if ([webpageURL.query rangeOfString:@"itentdata="].location != NSNotFound) {
            NSArray * pairs=[[webpageURL query] componentsSeparatedByString:@"&"];
            NSMutableDictionary *params=[[NSMutableDictionary alloc] init];
            for (NSString *pair in pairs) {
                NSArray *kv=[pair componentsSeparatedByString:@"="];
                if(kv.count==2)
                {
                    NSString *val=[[kv objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
                    [params setObject:val forKey:[kv objectAtIndex:0]];
                }
            }
            NSString *dataStr=[params objectForKey:@"itentdata"];
            if (dataStr != NULL) {
                UnitySendMessage("GameSDKCallback", "OnMWEnterRoom", [dataStr UTF8String]);
            }
            
            //NSString *channelidStr=[params objectForKey:@"channelId"];
            
            //上面已经拿到参数  进行自己的逻辑
            
        }
        else {
            //如果使用了Universal link ，此方法必写
            [MWApi continueUserActivity:userActivity];
        }
    }
    return false;
}

- (void)registerMlink
{
    [MWApi registerMLinkDefaultHandler:^(NSURL * _Nonnull url, NSDictionary * _Nullable params) {
        
    }];
    
    [MWApi registerMLinkHandlerWithKey:@"room" handler:
     ^(NSURL * _Nonnull url, NSDictionary * _Nullable params) {
         //跳转到app展示页，示例如下：
         NSString *parm = params[@"roomid"];
         NSLog(@"%s  : MW Enter RoomID",[parm UTF8String]);
         UnitySendMessage("GameSDKCallback", "OnMWEnterRoom", [parm UTF8String]);
     }];
}




// json转字典
-(NSDictionary *)JsonToDic:(const char *)json
{
    NSString * jsonData = [NSString stringWithUTF8String:json];
    NSData * data = [jsonData dataUsingEncoding:NSUTF8StringEncoding];
    NSError * error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if ([jsonObject isKindOfClass:[NSDictionary class]])
    {
        NSDictionary * dic = (NSDictionary *)jsonObject;
        return dic;
    }
    
    return nil;
}

- (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}


//char* MakeStringCopy (const char* string)
//{
//    if (string == NULL)
//    {
//        return NULL;
//    }
//
//    char* res = (char*)malloc(strlen(string) + 1);
//    strcpy(res, string);
//    return res;
//}

-(NSData*)GetImageData:(NSDictionary *)dic {
    NSString * path = [dic objectForKey:@"path"];
    int compressionQuality = 0.5;
    NSString * compressionQualityStr = [dic objectForKey:@"compressionQuality"];
    if (compressionQualityStr) {
        compressionQuality = [compressionQualityStr intValue];
    }
    int maxImageSize = 1280;
    NSString * maxImageSizeStr = [dic objectForKey:@"maxImageSize"];
    if (maxImageSizeStr) {
        maxImageSize = [maxImageSizeStr intValue];
    }
    

    
    NSData *imagedata = NULL;
    if ([dic objectForKey:@"screenshot"]) {  //如果是截图需要特殊处理
        struct utsname systemInfo;
        uname(&systemInfo);
        NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
        if ([deviceString isEqualToString:@"iPhone4,1"]||[deviceString isEqualToString:@"iPhone5,2"]) { //iphone5，以下不能使用Unity中默认的截图，需要单独实现
            UIWindow *screenWindow = [[UIApplication sharedApplication] keyWindow];
            screenWindow.backgroundColor = [UIColor redColor];
            if (screenWindow.subviews.count > 0) {
                //screenWindow = screenWindow.subviews[0];
            }
            
            NSLog(@"sub ===== %@\n subview ====%@",[screenWindow.layer sublayers],[screenWindow subviews]);
            
            //UIGraphicsBeginImageContext(screenWindow.frame.size);//全屏截图，包括window
            UIGraphicsBeginImageContextWithOptions(screenWindow.frame.size, YES, [UIScreen mainScreen].scale);
            
            [screenWindow drawViewHierarchyInRect:screenWindow.bounds afterScreenUpdates:NO];
            
            //[screenWindow.layer renderInContext:UIGraphicsGetCurrentContext()];
            
            UIImage *viewImage = UIGraphicsGetImageFromCurrentImageContext();
            
            UIGraphicsEndImageContext();
            
            UIImageWriteToSavedPhotosAlbum(viewImage, nil, nil, nil);
            
            imagedata = UIImageJPEGRepresentation(viewImage, 1);
        } else {
            imagedata = [NSData dataWithContentsOfFile:path];
        }
    } else {
        imagedata = [NSData dataWithContentsOfFile:path];
    }
    
    UIImage *image = [UIImage imageWithData:imagedata scale:1];
    
    NSData * data;
    
    float scale = 1;
    
    if (image.size.width > maxImageSize)
    {
        scale = maxImageSize / image.size.width;
    }
    UIImage * shareImg = [self ScaleImage:image toScale:scale];
    data = UIImageJPEGRepresentation(shareImg, compressionQuality);
    
    NSLog(@"GetImageData.length = %l kb", data.length / 1024);
    return data;
}

-(NSData*)GetThumbImageData:(NSDictionary *)dic {
    NSString * thumbPath = [dic objectForKey:@"thumbPath"];
    if (!thumbPath) {
        thumbPath = [dic objectForKey:@"path"];
    }
    NSString * scaledThumbnailWidth = [dic objectForKey:@"scaledThumbnailWidth"];
    int compressionQuality = 0.5;
    NSString * compressionQualityStr = [dic objectForKey:@"thumbCompressionQuality"];
    if (compressionQualityStr) {
        compressionQuality = [compressionQualityStr intValue];
    }
    NSData *imagedata = [NSData dataWithContentsOfFile:thumbPath];
    UIImage *image = [UIImage imageWithData:imagedata scale:1];
    
    float scale = 300 / image.size.width;
    if (scaledThumbnailWidth) {
        scale = [scaledThumbnailWidth intValue] / image.size.width;
    }
    UIImage * shareImg = [self ScaleImage:image toScale:scale];
    NSData *newimagedata =UIImageJPEGRepresentation(shareImg, compressionQuality);
    NSLog(@"GetThumbImageData.length = %l kb", newimagedata.length / 1024);
    return newimagedata;
}

-(UIImage *)ScaleImage:(UIImage *)img toScale:(float)size
{
    CGSize cgsize = CGSizeMake(img.size.width * size, img.size.height * size);
    UIGraphicsBeginImageContext(cgsize);
    [img drawInRect:CGRectMake(0, 0, cgsize.width, cgsize.height)];
    UIImage * scaleImg = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaleImg;
}




@end

