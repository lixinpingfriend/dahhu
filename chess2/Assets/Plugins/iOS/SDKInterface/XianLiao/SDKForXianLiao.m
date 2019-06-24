//
//  SDKForTABT.m
//  Unity-iPhone
//
//  Created by Apple on 2017/10/16.
//

#import "SDKForXianLiao.h"
#import "sys/utsname.h"
//#import "NSString+Encrypt.h"
//#import "HttpRequest.h"
#import "SugramApiManager.h"
#import "SDKMain.h"
#import "ConfigInfo.h"

@interface SDKForXianLiao ()

@end

@implementation SDKForXianLiao
static SDKForXianLiao * instance = nil;

+(SDKForXianLiao *) SharedInstance
{
    if (instance == nil)
    {
        instance = [[SDKForXianLiao alloc] init];
    }
    
    return instance;
}

/*
 *  以下主要为发送消息代码示例
 */

- (void)registerApp
{
    [SugramApiManager registerApp:XIANLIAO_APPID];
    [SugramApiManager getGameFromSugram:^(NSString *roomToken, NSString *roomId,NSNumber *openId) {
        NSString *gameString = [NSString stringWithFormat:@"roomToken:%@,roomId:%@, openId:%@", roomToken, roomId, openId];
        NSLog(@"%@", gameString);
        NSDictionary * callData = @{
                                    @"roomToken"  : roomToken,
                                    @"action"  : @("GetGameFromSugram"),
                                    @"roomId"  : roomId,
                                    @"openId"  : openId,
                                    };
        NSDictionary *dict = @{
                               @"eventName" : @"onXianLiaoShareResp",
                               @"data"  : [self dictionaryToJson:callData],
                               };
        UnitySendMessage("GameSDKCallback", "OnSdkCallbackCall", [[self dictionaryToJson:dict] UTF8String]);
    }];
}


//  发送文本消息
- (void)shareText:(const char *)json
{
    
    if ([SugramApiManager isInstallSugram]) {
        NSDictionary * dict = [self JsonToDic:json];
        SugramShareTextObject *textObject = [[SugramShareTextObject alloc] init];
        //        textObject.title = [dict objectForKey:@"title"];
        textObject.text = [dict objectForKey:@"text"];
        //        textObject.text = @"分享的内容";
        [SugramApiManager share:textObject fininshBlock:^(SugramShareCallBackType callBackType) {
            NSDictionary * callData = @{
                                        @"errCode"  : @((long)callBackType),
                                        @"action"  : @("ShareText")
                                        };
            NSDictionary *dict = @{
                                   @"eventName" : @"onXianLiaoShareResp",
                                   @"data"  : [self dictionaryToJson:callData],
                                   };
            UnitySendMessage("GameSDKCallback", "OnSdkCallbackCall", [[self dictionaryToJson:dict] UTF8String]);
            NSLog(@"callBackType:%ld", (long)callBackType);
        }];
    }
}


- (void)shareDataImage:(const char *)json
{
    if ([SugramApiManager isInstallSugram]) {
        SugramShareImageObject *imageObject = [[SugramShareImageObject alloc] init];
        
        NSDictionary * dic = [self JsonToDic:json];
        NSData* data = [[SDKMain SharedInstance] GetImageData:dic];
        
        imageObject.imageData = data;
        [SugramApiManager share:imageObject fininshBlock:^(SugramShareCallBackType callBackType) {
            NSLog(@"callBackType:%ld", (long)callBackType);
            NSDictionary * callData = @{
                                        @"errCode"  : @((long)callBackType),
                                        @"action"  : @("ShareDataImage")
                                        };
            NSDictionary *dict = @{
                                   @"eventName" : @"onXianLiaoShareResp",
                                   @"data"  : [self dictionaryToJson:callData],
                                   };
            UnitySendMessage("GameSDKCallback", "OnSdkCallbackCall", [[self dictionaryToJson:dict] UTF8String]);
            NSLog(@"callBackType:%ld", (long)callBackType);
        }];
    }
}


- (void)shareUrlImage:(const char *)json
{
    if ([SugramApiManager isInstallSugram]) {
        NSDictionary * dic = [self JsonToDic:json];
        NSString * imageUrl = [dic objectForKey:@"imageUrl"];
        
        SugramShareImageObject *imageObject = [[SugramShareImageObject alloc] init];
        imageObject.imageUrl = imageUrl;
        //        imageObject.imageUrl = @"https://img.alicdn.com/tps/TB1ADGXPXXXXXcTapXXXXXXXXXX-520-280.jpg";
        
        [SugramApiManager share:imageObject fininshBlock:^(SugramShareCallBackType callBackType) {
            NSDictionary * callData = @{
                                        @"errCode"  : @((long)callBackType),
                                        @"action"  : @("ShareUrlImage")
                                        };
            NSDictionary *dict = @{
                                   @"eventName" : @"onXianLiaoShareResp",
                                   @"data"  : [self dictionaryToJson:callData],
                                   };
            UnitySendMessage("GameSDKCallback", "OnSdkCallbackCall", [[self dictionaryToJson:dict] UTF8String]);
            NSLog(@"callBackType:%ld", (long)callBackType);
        }];
    }
}

- (void)login:(const char *)json
{
    [SugramApiManager loginState:@"sugram_login_state" fininshBlock:^(SugramLoginCallBackType callBackType, NSString *code, NSString *state) {
        NSString *loginString = [NSString stringWithFormat:@"callBackType:%lu, code:%@, state:%@", (unsigned long)callBackType, code, state];
        NSDictionary * callData = @{
                                    @"errCode"  : @((long)callBackType),
                                    @"action"  : @("Login"),
                                    @"code"  : code,
                                    @"state" : state
                                    };
        NSDictionary *dict = @{
                               @"eventName" : @"onXianLiaoShareResp",
                               @"data"  : [self dictionaryToJson:callData],
                               };
        UnitySendMessage("GameSDKCallback", "OnSdkCallbackCall", [[self dictionaryToJson:dict] UTF8String]);
    }];
}


//  发送网页消息
- (void)shareGame:(const char *)json
{
    if([SugramApiManager isInstallSugram]) {
        NSDictionary * dic = [self JsonToDic:json];
        NSString * roomToken = [dic objectForKey:@"roomToken"];
        NSString * roomId = [dic objectForKey:@"roomId"];
        NSString * title = [dic objectForKey:@"title"];
        NSString * text = [dic objectForKey:@"text"];
        NSString * path = [dic objectForKey:@"path"];
        //        NSString * desc = [dic objectForKey:@"desc"];
        
        SugramShareGameObject *game = [[SugramShareGameObject alloc] init];
        game.roomToken = roomToken;
        game.roomId = roomId;
        game.title = title;
        game.text = text;
        //        if (desc) {
        ////            game.description = desc;
        //        }
        
        
        if (path) {
            NSDictionary * dic = [self JsonToDic:json];
            NSData* data = [[SDKMain SharedInstance] GetThumbImageData:dic];
            if (data) {
                game.imageData = data;
            } else {
                return;
            }
        } else {
            NSString * imageUrl = [dic objectForKey:@"imageUrl"];
            game.imageUrl = imageUrl;
        }
        
        
        
        if ([dic objectForKey:@"androidDownLoadUrl"] != NULL) {
            game.androidDownloadUrl = [dic objectForKey:@"androidDownLoadUrl"];
        }
        if ([dic objectForKey:@"iOSDownloadUrl"] != NULL) {
            game.iOSDownloadUrl = [dic objectForKey:@"iOSDownloadUrl"];
        }
        
        [SugramApiManager share:game fininshBlock:^(SugramShareCallBackType callBackType) {
            NSDictionary * callData = @{
                                        @"errCode"  : @((long)callBackType),
                                        @"action"  : @("ShareGame")
                                        };
            NSDictionary *dict = @{
                                   @"eventName" : @"onXianLiaoShareResp",
                                   @"data"  : [self dictionaryToJson:callData],
                                   };
            UnitySendMessage("GameSDKCallback", "OnSdkCallbackCall", [[self dictionaryToJson:dict] UTF8String]);
            NSLog(@"callBackType:%ld", (long)callBackType);
        }];
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
