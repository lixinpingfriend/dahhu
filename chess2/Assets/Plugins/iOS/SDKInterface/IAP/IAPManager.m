







#import "IAPManager.h"


@implementation IAPManager

//Loading layer
CAReplicatorLayer *replicatorLayer;

-(void) attachObserver{
    NSLog(@"AttachObserver");
    [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
}

-(BOOL) CanMakePayment{
    return [SKPaymentQueue canMakePayments];
}

-(void) requestProductData:(NSString *)productIdentifiers{
    NSArray *idArray = [productIdentifiers componentsSeparatedByString:@"\t"];
    NSSet *idSet = [NSSet setWithArray:idArray];
    [self sendRequest:idSet];
}

-(void)sendRequest:(NSSet *)idSet{
    SKProductsRequest *request = [[SKProductsRequest alloc] initWithProductIdentifiers:idSet];
    request.delegate = self;
    [request start];
}

-(void)productsRequest:(SKProductsRequest *)request didReceiveResponse:(SKProductsResponse *)response{
    NSArray *products = response.products;
    
    for (SKProduct *p in products) {
        // UnitySendMessage("Main", "ShowProductList", [[self productInfo:p] UTF8String]);
    }
    
    for(NSString *invalidProductId in response.invalidProductIdentifiers){
        NSLog(@"Invalid product id:%@",invalidProductId);
    }
    
    [request autorelease];
}

-(void)buyRequest:(NSString *)productIdentifier{
    [self showLoading];
    SKPayment *payment = [SKPayment paymentWithProductIdentifier:productIdentifier];
    [[SKPaymentQueue defaultQueue] addPayment:payment];
}

-(NSString *)productInfo:(SKProduct *)product{
    NSArray *info = [NSArray arrayWithObjects:product.localizedTitle,product.localizedDescription,product.price,product.productIdentifier, nil];
    
    return [info componentsJoinedByString:@"\t"];
}

-(NSString *)transactionInfo:(SKPaymentTransaction *)transaction{
    
    return [self encode:(uint8_t *)transaction.transactionReceipt.bytes length:transaction.transactionReceipt.length];
    
    //return [[NSString alloc] initWithData:transaction.transactionReceipt encoding:NSASCIIStringEncoding];
}

-(NSString *)encode:(const uint8_t *)input length:(NSInteger) length{
    static char table[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=";
    
    NSMutableData *data = [NSMutableData dataWithLength:((length+2)/3)*4];
    uint8_t *output = (uint8_t *)data.mutableBytes;
    
    for(NSInteger i=0; i<length; i+=3){
        NSInteger value = 0;
        for (NSInteger j= i; j<(i+3); j++) {
            value<<=8;
            
            if(j<length){
                value |=(0xff & input[j]);
            }
        }
        
        NSInteger index = (i/3)*4;
        output[index + 0] = table[(value>>18) & 0x3f];
        output[index + 1] = table[(value>>12) & 0x3f];
        output[index + 2] = (i+1)<length ? table[(value>>6) & 0x3f] : '=';
        output[index + 3] = (i+2)<length ? table[(value>>0) & 0x3f] : '=';
    }
    
    return [[NSString alloc] initWithData:data encoding:NSASCIIStringEncoding];
}

-(void) provideContent:(SKPaymentTransaction *)transaction{
    NSDictionary * callData = [NSDictionary dictionaryWithObjectsAndKeys:
                               @"onAppstorePaySucess",@"eventName",
                               @"",@"data",
                               nil];
    UnitySendMessage("GameSDKCallback", "OnSdkCallbackCall", [[self dictionaryToJson:callData] UTF8String]);
}

- (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

-(void)paymentQueue:(SKPaymentQueue *)queue updatedTransactions:(NSArray *)transactions{
    for (SKPaymentTransaction *transaction in transactions) {
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchased:
                [self hideLoading];
                [self completeTransaction:transaction];
                break;
            case SKPaymentTransactionStateFailed:
                [self hideLoading];
                [self failedTransaction:transaction];
                break;
            case SKPaymentTransactionStateRestored:
                [self restoreTransaction:transaction];
                break;
            default:
                break;
        }
    }
}

-(void) completeTransaction:(SKPaymentTransaction *)transaction{
    NSLog(@"Comblete transaction : %@",transaction.transactionIdentifier);
    [self provideContent:transaction];
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
}

-(void) failedTransaction:(SKPaymentTransaction *)transaction{
    NSLog(@"Failed transaction : %@",transaction.transactionIdentifier);
    
    if (transaction.error.code != SKErrorPaymentCancelled) {
        NSLog(@"!Cancelled");
    }
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
}

-(void) restoreTransaction:(SKPaymentTransaction *)transaction{
    NSLog(@"Restore transaction : %@",transaction.transactionIdentifier);
    [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
}


-(void)showLoading{
    if(replicatorLayer == nil){
        CGRect rx = [ UIScreen mainScreen ].bounds;
        CGPoint centerPoint = CGPointMake(rx.size.width/2, rx.size.height/2);
        //UIView *myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, rx.size.width, rx.size.height)];
        //myView.userInteractionEnabled = YES;
        replicatorLayer = [CAReplicatorLayer layer];
        replicatorLayer.bounds          = CGRectMake(0, 0, rx.size.width, rx.size.height);
        replicatorLayer.cornerRadius    = 10.0;
        replicatorLayer.position        =  centerPoint;
        replicatorLayer.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.6].CGColor;
        
        UIViewController *viewCtr = UnityGetGLViewController();
        viewCtr.view.userInteractionEnabled = NO;
        [viewCtr.view.layer addSublayer:replicatorLayer];
        
        CALayer *dotLayer        = [CALayer layer];
        dotLayer.bounds          = CGRectMake(0, 0, 10, 10);
        dotLayer.position        = CGPointMake(centerPoint.x+25, replicatorLayer.frame.size.height/2 );
        dotLayer.backgroundColor = [UIColor colorWithRed:1 green:0.9 blue:0.5 alpha:1].CGColor;
        dotLayer.cornerRadius    = 5;
        [replicatorLayer addSublayer:dotLayer];
        
        CGFloat count                     =  10.0;
        replicatorLayer.instanceCount     = count;
        replicatorLayer.instanceDelay = 0.5/count;
        dotLayer.transform = CATransform3DMakeScale(0, 0, 0);
        CGFloat angel                     = 2* M_PI/count;
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(angel, 0, 0, 0.5);
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        animation.duration    = 0.5;
        animation.fromValue   = @1;
        animation.toValue     = @0;
        animation.repeatCount = MAXFLOAT;
        [dotLayer addAnimation:animation forKey:nil];
    }
}

-(void)hideLoading{
    if(replicatorLayer != nil){
        [replicatorLayer removeFromSuperlayer];
        UIViewController *viewCtr = UnityGetGLViewController();
        viewCtr.view.userInteractionEnabled = YES;
        replicatorLayer = nil;
    }
}

//是否是无网络状态进入的游戏，true:飞行模式等无网状态进入 false：wifi 蜂窝等状态进入
- (bool)isNoneNetworkConnect {
    // 创建零地址，0.0.0.0的地址表示查询本机的网络连接状态
    struct sockaddr_in zeroAddress;//sockaddr_in是与sockaddr等价的数据结构
    bzero(&zeroAddress, sizeof(zeroAddress));
    zeroAddress.sin_len = sizeof(zeroAddress);
    zeroAddress.sin_family = AF_INET;//sin_family是地址家族，一般都是“AF_xxx”的形式。通常大多用的是都是AF_INET,代表TCP/IP协议族
    
    SCNetworkReachabilityRef defaultRouteReachability = SCNetworkReachabilityCreateWithAddress(NULL, (struct sockaddr *)&zeroAddress); //创建测试连接的引用：
    SCNetworkReachabilityFlags flags;
    
    bool didRetrieveFlags = SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags);
    CFRelease(defaultRouteReachability);
    return (didRetrieveFlags && flags == 0);
}

//wifi： 如果获取到的info不为nil，则当前是wifi情况下没有网络连接。
- (NSDictionary *)fetchSSIDInfo {
    NSArray *ifs = (NSArray *)CFBridgingRelease(CNCopySupportedInterfaces());
    if (!ifs) {
        return nil;
    }
    
    NSDictionary *info = nil;
    for (NSString *ifnam in ifs) {
        info = (__bridge_transfer NSDictionary *)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info && [info count]) { break; }
    }
    return info;
}

//获取运营商信息
-(NSString *)fetchMobileInfo {
    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init];
    return  info.currentRadioAccessTechnology;
}

-(int)startValidateNetworkAuthorization{
    CTCellularData *cellularData = [[CTCellularData alloc]init];
    CTCellularDataRestrictedState state = cellularData.restrictedState;
    switch (state) {
        case kCTCellularDataRestricted:
            //网络处于关闭状态
            NSLog(@"Restricrted");
            break;
        case kCTCellularDataNotRestricted:
            //网络处于 蜂窝或者wifi状态
            NSLog(@"Not Restricted");
            return 1;
        case kCTCellularDataRestrictedStateUnknown:
            //未知状态
            NSLog(@"Unknown");
            break;
        default:
            break;
    }
    return 0;
}

-(bool)isUserCloseNetWork{
    
    NSMutableDictionary *checkData = (NSMutableDictionary *)[self load:CHECK_NET];
    
    NSLog(@"%@",[checkData objectForKey:CHECK_NET]);
    
    if([[checkData objectForKey:CHECK_NET]  isEqual: @"checkd"]){
        return false;
    }
    
    NSString *version = [UIDevice currentDevice].systemVersion;
    if (version.doubleValue <= 10.0) // iOS系统版本 >= 8.0
        return false;
    if([self isNoneNetworkConnect]){
        NSLog(@"飞行模式进入游戏");
        return false;
    }
    
    NSDictionary *wifi            = [self fetchSSIDInfo];
    NSString     *tele            = [self fetchMobileInfo];
    bool         isHaveWifiConect = wifi == nil;
    bool         isHaveTeleConect = tele == nil;
    bool         isHaveNetWork    = [self startValidateNetworkAuthorization] == 1;
    
    NSMutableDictionary *saveData = [NSMutableDictionary dictionary];
    [saveData setObject:@"checked" forKey:CHECK_NET];
    [self save:CHECK_NET data:saveData];
    
    return (isHaveWifiConect || isHaveTeleConect) && !isHaveNetWork;
}

- (NSMutableDictionary *)getKeychainQuery:(NSString *)service {
    return [NSMutableDictionary dictionaryWithObjectsAndKeys:
            (id)kSecClassGenericPassword,(id)kSecClass,
            service, (id)kSecAttrService,
            service, (id)kSecAttrAccount,
            (id)kSecAttrAccessibleAfterFirstUnlock,(id)kSecAttrAccessible,
            nil];
}

- (float)getCurSdCardSize{
    /// 总大小
    float totalsize = 0.0;
    /// 剩余大小
    float freesize = 0.0;
    NSError *error = nil;
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfFileSystemForPath:[paths lastObject] error: &error];
    if (dictionary)
    {
        NSNumber *_free = [dictionary objectForKey:NSFileSystemFreeSize];
        freesize = [_free unsignedLongLongValue]*1.0/(1000);
        
        NSNumber *_total = [dictionary objectForKey:NSFileSystemSize];
        totalsize = [_total unsignedLongLongValue]*1.0/(1000);
    } else
    {
        NSLog(@"Error Obtaining System Memory Info: Domain = %@, Code = %ld", [error domain], (long)[error code]);
    }
    NSLog(@"totalsize = %.2fG, freesize = %.2fMB",totalsize/1000/1000, freesize/1000);
    return freesize/1000;
}

- (void)save:(NSString *)service data:(id)data {
    //Get search dictionary
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Delete old item before add new item
    SecItemDelete((CFDictionaryRef)keychainQuery);
    //Add new object to search dictionary(Attention:the data format)
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(id)kSecValueData];
    //Add item to keychain with the search dictionary
    SecItemAdd((CFDictionaryRef)keychainQuery, NULL);
}

- (id)load:(NSString *)service {
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    //Configure the search setting
    //Since in our simple case we are expecting only a single attribute to be returned (the password) we can set the attribute kSecReturnData to kCFBooleanTrue
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(id)kSecReturnData];
    [keychainQuery setObject:(id)kSecMatchLimitOne forKey:(id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    if (SecItemCopyMatching((CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        ret = [NSKeyedUnarchiver unarchiveObjectWithData:(NSData *)keyData];
    }
    if (keyData)
        CFRelease(keyData);
    return ret;
}

-(bool)isIphoneX{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine
                                            encoding:NSUTF8StringEncoding];
    if([platform isEqualToString:@"iPhone10,3"])
        return true;
    if([platform isEqualToString:@"iPhone10,6"])
        return true;
    return false;
}

// ipx 获取网络信息
-(NSInteger)networktype{
    int networkType = [self ipxStates]->dataNetworkType;
    //NSLog(@"--- net type = %d", networkType);
    return networkType;
}

-(NSInteger)wifiStrenth{
    int strenth = [self ipxStates]->wifiSignalStrengthBars;
    //NSLog(@"--- wifi strenth = %d", strenth);
    return strenth + 1;
}

// ipx 状态信息  包含电池、网络等等
-(stateInfo* )ipxStates{
    Class cls = NSClassFromString(@"UIStatusBarServer");
    SEL selector = NSSelectorFromString(@"getStatusBarData");
    NSMethodSignature *signature = [cls methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = cls;
    invocation.selector = selector;
    [invocation invoke];
    stateInfo * data;
    [invocation getReturnValue:&data];
    return data;
}

@end
