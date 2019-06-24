//
//  LBSDKApi.h
//  CXSDKCoreKit
//
//  Created by Dylan Wang on 10/11/2017.
//  Copyright © 2017 Liaobei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LBSDKApiObject.h"

NS_ASSUME_NONNULL_BEGIN

/**
 聊呗 SDK 的回调
 */
@protocol LBSDKApiDelegate <NSObject>

@optional

/**
 分享之后的回调

 @param resp 分享回调结果
 */
- (void)onShareResp:(LBSDKShareResp *)resp;

/**
 授权之后的回调

 @param resp 授权回调结果
 */
- (void)onAuthResp:(LBSDKAuthResp *)resp;
@end


/**
 聊呗 SDK Api 接口函数
 */
@interface LBSDKApi : NSObject

/**
 向聊呗 SDK 注册 clientId，可通过聊呗后台进行申请获取

 @param clientId 第三方应用申请的 clientId
 */
+ (void)registerClientId:(NSString *)clientId;

/**
 获取 SDK 的版本号
 当前版本 0.9
 @return SDK version
 */
+ (NSString *)getSDKVersion;

/**
 检查聊呗 App 是否安装，

 @return YES： 聊呗已安装； NO: 聊呗未安装。
 */
+ (BOOL)isLiaobeiAppInstalled;

/**
 发送分享请求到聊呗，聊呗处理完成之后返回 回调 onResp

 @param req LBSDKBaseReq
 @return 成功返回 YES，
         失败返回 NO,
         失败的原因有 1. 聊呗未安装。
                    2. 未设置正确的 ClientId
                    3. 消息的格式错误
 */
+ (BOOL)sendShareReq:(LBSDKShareReq *)req;

/**
 发送授权请求到聊呗，聊呗处理完成之后返回 回调 onAuthResp

 @param req LBSDKAuthReq
 @return 成功返回 YES，
         失败返回 NO,
         失败的原因有 1. 聊呗未安装。
                    2. 未设置正确的 ClientId
 */
+ (BOOL)sendAuthReq:(LBSDKAuthReq *)req;

/**
 处理聊呗通过 URL 启动第三方是传递的数据

 需要在 application:openURL:sourceApplication:annotation:或者application:handleOpenURL中调用。
 @param url URL
 @return 成功返回 YES，失败返回 NO
 */
+ (BOOL)handleOpenURL:(NSURL *)url delegate:(id<LBSDKApiDelegate>)delegate;

@end
NS_ASSUME_NONNULL_END

/* 第三方登录流程
 1.第三方应用需先调用 sendAuthReq 向聊呗请求授权，
 2.授权成功后，聊呗会返回第三方应用，回调 onAuthResp 并带回 Code，Code 的有效期为 10 分钟
 3.第三方应用通过 /oauth2/token 可获取 access token 与 openid，注意这步需要用到 Secret ，建议将这步请求放到服务器去做，保证 secret 的安全性
 4.接着便可以通过 /oauth2/userinfo  获取用户的个人信息
 */
