//
//  SDKForTABT.m
//  Unity-iPhone
//
//  Created by Apple on 2017/10/16.
//

#import "SDKForLiaoBei.h"
#import "sys/utsname.h"
//#import "HttpRequest.h"
//#import LBS
#import <LBSDK/LBSDK.h>
#import "SDKMain.h"
#import "ConfigInfo.h"
@interface SDKForLiaoBei () <LBSDKApiDelegate>

@end

@implementation SDKForLiaoBei
static SDKForLiaoBei * instance = nil;

+(SDKForLiaoBei *) SharedInstance
{
    if (instance == nil)
    {
        instance = [[SDKForLiaoBei alloc] init];
    }
    
    return instance;
}

/*
 *  以下主要为发送消息代码示例
 */

- (void)registerApp
{
    [LBSDKApi registerClientId:LIAOBEI_APPID];
}


//  发送文本消息
- (void)shareText:(const char *)json
{
    NSDictionary * dict = [self JsonToDic:json];
    LBSDKTextMessage *textObject = [[LBSDKTextMessage alloc] init];
    textObject.text = [dict objectForKey:@"text"];
    
    LBSDKShareReq *shareReq = [[LBSDKShareReq alloc] init];
    shareReq.message = textObject;
    NSString * state = [dict objectForKey:@"state"];
    if (state) {
        shareReq.state = state;
    }
    [LBSDKApi sendShareReq:shareReq];
}


- (void)shareDataImage:(const char *)json
{
    
    NSDictionary * dict = [self JsonToDic:json];
    LBSDKImageMessage *imageMessage = [[LBSDKImageMessage alloc] init];
    NSData* data = [[SDKMain SharedInstance] GetImageData:dict];
    imageMessage.image = [UIImage imageWithData:data scale:1];
    NSString * caption = [dict objectForKey:@"caption"];
    if (caption) {
        imageMessage.caption = caption;
    }

    LBSDKShareReq *shareReq = [[LBSDKShareReq alloc] init];
    shareReq.message = imageMessage;
    NSString * state = [dict objectForKey:@"state"];
    if (state) {
        shareReq.state = state;
    }
    [LBSDKApi sendShareReq:shareReq];
}

// 分享网页链接
-(void) shareUrl:(const char *)json
{
    NSDictionary * dict = [self JsonToDic:json];
    LBSDKLinkMessage *urlMessage = [[LBSDKLinkMessage alloc] init];
    urlMessage.title = [dict objectForKey:@"title"];
    urlMessage.desc = [dict objectForKey:@"desc"];
    urlMessage.url = [dict objectForKey:@"url"];
    
    NSString * thumbPath = [dict objectForKey:@"thumbPath"];
    if (thumbPath) {
        NSData* data = [[SDKMain SharedInstance] GetImageData:dict];
        urlMessage.icon = [UIImage imageWithData:data scale:1];
    } else {
        NSString *thumbnailFile = [NSString stringWithFormat:@"%@/%@.png", [[NSBundle mainBundle] resourcePath], @"AppIcon"];
        UIImage *thumbnail = [UIImage imageWithContentsOfFile:thumbnailFile];
        urlMessage.icon = thumbnail;
    }

    LBSDKShareReq *shareReq = [[LBSDKShareReq alloc] init];
    shareReq.message = urlMessage;
    NSString * state = [dict objectForKey:@"state"];
    if (state) {
        shareReq.state = state;
    }
    [LBSDKApi sendShareReq:shareReq];
}

- (void)shareUrlImage:(const char *)json
{

}

- (void)login:(const char *)json
{
    NSDictionary * dict = [self JsonToDic:json];
    LBSDKAuthReq *authReq = [[LBSDKAuthReq alloc] init];
    NSString * state = [dict objectForKey:@"state"];
    if (state) {
        authReq.state = state;
    }
    [LBSDKApi sendAuthReq:authReq];
}



- (void)shareGame:(const char *)json
{
    
}

-(void) onResp:(LBSDKShareResp *)resp
{
    if ([resp isKindOfClass:[LBSDKAuthResp class]])
    {
        LBSDKAuthResp * sp = (LBSDKAuthResp *)resp;
        NSDictionary * callData = @{
                                    @"errCode"  : [NSString stringWithFormat:@"%d",sp.resultCode],
                                    @"code"  : sp.code,
                                    @"errStr"   : sp.errStr ? sp.errStr: @"",
                                    };
        NSDictionary *dict = @{
                               @"eventName" : @"onLBSDKAuthResp",
                               @"data"  : [self dictionaryToJson:callData],
                              };

        UnitySendMessage("GameSDKCallback", "OnSdkCallbackCall", [[self dictionaryToJson:dict] UTF8String]);
    }
    else
    {
        NSDictionary * callData = @{
                                    @"errCode"  : [NSString stringWithFormat:@"%d",resp.resultCode],
                                    @"errStr"   : resp.errStr ? resp.errStr: @"",
                                    @"state"   : resp.state ? resp.state: @"",
                                    };
        NSDictionary *dict = @{
                               @"eventName" : @"onLBSDKShareResp",
                               @"data"  : [self dictionaryToJson:callData],
                               };
        
        UnitySendMessage("GameSDKCallback", "OnSdkCallbackCall", [[self dictionaryToJson:dict] UTF8String]);
    }

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

@end
