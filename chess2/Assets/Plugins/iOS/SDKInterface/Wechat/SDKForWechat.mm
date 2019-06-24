
#import "SDKForWechat.h"
#import "sys/utsname.h"
#import "MWApi.h"
#import "Reachability.h"
#import "ProtoMgr.h"
#import "SDKMain.h"

@interface SDKForWechat() <WXApiDelegate>
@property (nonatomic, strong) Reachability * internetReachablity;
//@property (nonatomic, strong) AMapLocationManager *locationManager;
//
//@property (nonatomic, copy) AMapLocatingCompletionBlock completionBlock;
@end


@implementation SDKForWechat

static SDKForWechat * instance = nil;

+(SDKForWechat *) SharedInstance
{
    if (instance == nil)
    {
        instance = [[SDKForWechat alloc] init];
    }
    
    return instance;
}

-(id)init
{
    self = [super init];


    return self;
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


// 初始化
-(void)Init:(const char *)appid
{
    NSString * wechatAppId = [NSString stringWithUTF8String:appid];
    [WXApi registerApp:wechatAppId];
}

// 登陆，拉起微信客户端进行授权
-(void) Login
{
    SendAuthReq * req = [[[SendAuthReq alloc] init] autorelease];
    req.scope = @"snsapi_userinfo";
    req.state = @"Login";
    [WXApi sendReq:req];
}

// 登陆结果，失败传@""
-(void)LoginResult:(NSString *)result
{
    UnitySendMessage("GameSDKCallback", "OnLoginWechatResult", [result UTF8String]);
}

//-(void) Recharge:(const char *)json
//{
////    NSDictionary * dict = [self JsonToDic:json];
////
////    NSMutableString *stamp  = [dict objectForKey:@"timestamp"];
////
////    PayReq *req= [[PayReq alloc] init];
////    req.partnerId = [dict objectForKey:@"partnerid"];
////    req.prepayId = [dict objectForKey:@"prepayid"];
////    req.nonceStr = [dict objectForKey:@"noncestr"];
////    req.timeStamp = stamp.intValue;
////    req.package = [dict objectForKey:@"package"];
////    req.sign  = [dict objectForKey:@"sign"];
////    [WXApi sendReq:req];
////
////    NSLog(@"appid=%@\npartid=%@\nprepayid=%@\nnoncestr=%@\ntimestamp=%ld\npackage=%@\nsign=%@",[dict objectForKey:@"appid"],req.partnerId,req.prepayId,req.nonceStr,(long)req.timeStamp,req.package,req.sign );
//}

// 分享网页链接
-(void) ShareUrl:(const char *)json
{
    NSDictionary * dic = [self JsonToDic:json];
    NSString * sceneType = [dic objectForKey:@"sceneType"];
    NSString * title = [dic objectForKey:@"title"];
    NSString * content = [dic objectForKey:@"content"];
    NSString * url = [dic objectForKey:@"url"];
    NSString * thumbPath = [dic objectForKey:@"thumbPath"];
    
    WXMediaMessage * msg = [WXMediaMessage message];
    msg.title = title;
    msg.description = content;
    
    if (thumbPath) {
        msg.thumbData = [[SDKMain SharedInstance] GetThumbImageData:dic];
    } else {
        NSString *thumbnailFile = [NSString stringWithFormat:@"%@/%@.png", [[NSBundle mainBundle] resourcePath], @"AppIcon"];
        UIImage *thumbnail = [UIImage imageWithContentsOfFile:thumbnailFile];
        [msg setThumbImage:thumbnail];
    }
    
    WXWebpageObject * obj = [WXWebpageObject object];
    obj.webpageUrl = url;
    msg.mediaObject = obj;
    WXScene scene = [sceneType isEqualToString:@"0"] ? WXSceneSession : WXSceneTimeline;
    
    [self SendMsgToWX:msg scene:scene];
}

// 分享网页链接
-(void) ShareText:(const char *)json
{
    NSDictionary * dic = [self JsonToDic:json];
    NSString * sceneType = [dic objectForKey:@"sceneType"];
    NSString * content = [dic objectForKey:@"content"];
    WXScene scene = [sceneType isEqualToString:@"0"] ? WXSceneSession : WXSceneTimeline;
    
    SendMessageToWXReq* req = [[[SendMessageToWXReq alloc] init]autorelease];
    req.text = content;
    req.bText = YES;
    req.scene = scene;
    
    [WXApi sendReq:req];
}

// 分享小程序
-(void) ShareMiniProgram:(const char *)json
{
    NSDictionary * dic = [self JsonToDic:json];
    NSString * sceneType = [dic objectForKey:@"sceneType"];
    NSString * title = [dic objectForKey:@"title"];
    NSString * desc = [dic objectForKey:@"desc"];
    NSString * url = [dic objectForKey:@"url"];
    NSString * webpageUrl = [dic objectForKey:@"webpageUrl"];
    NSString * userName = [dic objectForKey:@"userName"];
    NSString * path = [dic objectForKey:@"path"];
    
    WXMiniProgramObject *ext = [WXMiniProgramObject object];
    ext.webpageUrl = webpageUrl;  //兼容低版本的原始连接
    ext.userName = userName;   //小程序的原始ID
    ext.path = path;
    
    NSData* data = [[SDKMain SharedInstance] GetThumbImageData:dic];
    [ext setHdImageData:data];
    
    WXMediaMessage * msg = [WXMediaMessage message];
    msg.title = title;
    msg.description = desc;
    msg.mediaObject = ext;
    msg.thumbData = data;
    WXScene scene = [sceneType isEqualToString:@"0"] ? WXSceneSession : WXSceneTimeline;
    [self SendMsgToWX:msg scene:scene];
}


// 打开小程序
-(void) LaunchMiniProgram:(const char *)json
{
    NSDictionary * dic = [self JsonToDic:json];
    NSString * appId = [dic objectForKey:@"appId"];
    if (appId) {
        [WXApi registerApp:appId];
    }

    NSString * userName = [dic objectForKey:@"userName"];
    NSString * path = [dic objectForKey:@"path"];

    WXLaunchMiniProgramReq *launchMiniProgramReq = [WXLaunchMiniProgramReq object];
    launchMiniProgramReq.userName = userName;  //拉起的小程序的username
    launchMiniProgramReq.path = path;    //拉起小程序页面的可带参路径，不填默认拉起小程序首页
    NSString * type = [dic objectForKey:@"type"];
    if (type) {
        launchMiniProgramReq.miniProgramType = (WXMiniProgramType)[type intValue];
    } else {
        launchMiniProgramReq.miniProgramType = WXMiniProgramTypeRelease;//拉起小程序的类型
    }
    [WXApi sendReq:launchMiniProgramReq];

}

// 分享图片
-(void) ShareImage:(const char *)json
{
    NSDictionary * dic = [self JsonToDic:json];
    NSString * sceneType = [dic objectForKey:@"sceneType"];
    WXScene scene = [sceneType isEqualToString:@"0"] ? WXSceneSession : WXSceneTimeline;

    WXImageObject *object = [WXImageObject object];
    object.imageData = [[SDKMain SharedInstance] GetImageData:dic];

    WXMediaMessage *message = [WXMediaMessage message];
    message.mediaTagName = @"ShareImageMessageToFriends";
    message.thumbData = [[SDKMain SharedInstance] GetThumbImageData:dic];
    message.mediaObject = object;

    SendMessageToWXReq* req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.scene = scene;
    req.message = message;
    [WXApi sendReq:req];
}

// 发送媒体消息至微信
-(void)SendMsgToWX:(WXMediaMessage *)msg scene:(WXScene)scene
{
    SendMessageToWXReq * req = [[SendMessageToWXReq alloc] init];
    req.bText = NO;
    req.message = msg;
    req.scene = scene;

    [WXApi sendReq:req];
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


#pragma mark - 微信回调
-(void) onReq:(BaseReq *)req
{
    NSDictionary * callData;

    if([req isKindOfClass:[ShowMessageFromWXReq class]])
    {
        ShowMessageFromWXReq* temp = (ShowMessageFromWXReq*)req;
        WXMediaMessage *msg = temp.message;
        callData = @{
                     @"action"  : @"ShowMessageFromWXReq",
                     @"title" : msg.title,
                     @"description" : msg.description,
                     @"messageExt" : msg.messageExt,
                     @"mediaTagName" : msg.mediaTagName,
                     @"messageAction" : msg.messageAction,
                     @"type"     : @(req.type)
                     };
    }
    else if([req isKindOfClass:[LaunchFromWXReq class]])
    {
        LaunchFromWXReq* temp = (LaunchFromWXReq*)req;
        WXMediaMessage *msg = temp.message;
        callData = @{
                     @"action"  : @"LaunchFromWXReq",
                     @"title" : msg.title,
                     @"description" : msg.description,
                     @"messageExt" : msg.messageExt,
                     @"mediaTagName" : msg.mediaTagName,
                     @"messageAction" : msg.messageAction,
                     @"type"     : @(req.type)
                     };
    } else {
        callData = @{
                     @"type"     : @(req.type)
                     };
    }


    NSDictionary *dict = @{
                           @"eventName" : @"onSendMessageToWXReq",
                           @"data"  : [self dictionaryToJson:callData],
                           };
    UnitySendMessage("GameSDKCallback", "OnSdkCallbackCall", [[self dictionaryToJson:dict] UTF8String]);
}

-(void) onResp:(BaseResp *)resp
{
    if ([resp isKindOfClass:[SendAuthResp class]])
    {
        SendAuthResp * sp = (SendAuthResp *)resp;
        NSString * code = sp.code;
        NSDictionary *dict = @{ @"result"  : @(sp.errCode),
                                @"errCode"  : @(sp.errCode),
                                @"errStr"   : sp.errStr ?: [NSNull null],
                                @"type"     : @(sp.type),
                                @"token"     : sp.code ?: [NSNull null],
                                @"state"    : sp.state ?: [NSNull null],
                                };
        [self LoginResult:[self dictionaryToJson:dict]];
    }
    else if ([resp isKindOfClass:[SendMessageToWXResp class]])
    {
//        NSLog(@"分享结束");
        SendMessageToWXResp * sp = (SendMessageToWXResp *)resp;
        NSDictionary * callData = @{
                                    @"errCode"  : @(sp.errCode),
                                    @"errStr"   : sp.errStr ? sp.errStr: @"",
                                    @"type"     : @(sp.type)
                                    };
        NSDictionary *dict = @{
                               @"eventName" : @"onSendMessageToWXResp",
                               @"data"  : [self dictionaryToJson:callData],
                               };

        UnitySendMessage("GameSDKCallback", "OnSdkCallbackCall", [[self dictionaryToJson:dict] UTF8String]);
    }
    else if ([resp isKindOfClass:[WXLaunchMiniProgramResp class]])
    {
        WXLaunchMiniProgramResp * sp = (WXLaunchMiniProgramResp *)resp;
        NSDictionary * callData = @{
                                    @"errCode"  : @(sp.errCode),
                                    @"errStr"   : sp.errStr ? sp.errStr: @"",
                                    @"type"     : @(sp.type)
                                    };
        NSDictionary *dict = @{
                               @"eventName" : @"onWXLaunchMiniProgramResp",
                               @"data"  : [self dictionaryToJson:callData],
                               };
        UnitySendMessage("GameSDKCallback", "OnSdkCallbackCall", [[self dictionaryToJson:dict] UTF8String]);
        // 对应JsApi navigateBackApplication中的extraData字段数据
    }
//    else if([resp isKindOfClass:[PayResp class]]){
//
//        switch (resp.errCode) {
//            case WXSuccess:
//                UnitySendMessage("GameSDKCallback", "OnWechatRe", "0");
//                break;
//            default:
//                break;
//        }
//
//        NSDictionary * callData = @{
//                                    @"errCode"  : @(resp.errCode),
//                                    @"errStr"   : resp.errStr ? resp.errStr: @"",
//                                    @"type"     : @(resp.type)
//                                    };
//        NSDictionary *dict = @{
//                               @"eventName" : @"onWechatReResp",
//                               @"data"  : [self dictionaryToJson:callData],
//                               };
//
//        UnitySendMessage("GameSDKCallback", "OnSdkCallbackCall", [[self dictionaryToJson:dict] UTF8String]);
//    }
}


@end

