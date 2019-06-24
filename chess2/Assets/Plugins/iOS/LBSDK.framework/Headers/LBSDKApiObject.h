//
//  LBSDKApiObject.h
//  CXSDKCoreKit
//
//  Created by Dylan Wang on 10/11/2017.
//  Copyright © 2017 Liaobei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
#pragma mark - request

/**
 第三方发给聊呗的请求类的基类
 */
@interface LBSDKBaseReq: NSObject
/**
 用户自定义标识表示请求的唯一性，将会在 Resp 中带回。
 */
@property (nonatomic, strong, nullable) NSString *state;

@end

/**
 第三方向聊呗发起的认证请求
 */
@interface LBSDKAuthReq: LBSDKBaseReq

/**
 应用授权作用域，拥有多个作用域用逗号（,）分隔，
 例如： "base, userinfo"
 */
@property (nonatomic, strong) NSString *scope;

@end

@class LBSDKMessage;
/**
 第三方向聊呗发起的请求请求
 */
@interface LBSDKShareReq: LBSDKBaseReq

/**
 分享的内容
 */
@property (nonatomic, strong) LBSDKMessage *message;

@end

/**
 消息的基类
 */
@interface LBSDKMessage: NSObject

/**
 验证 message 的合法性

 @return YES: 消息合法；NO： 消息不合法无法分享
 */
- (BOOL)verifyContent;

@end

/**
 文本消息类型
 */
@interface LBSDKTextMessage: LBSDKMessage

/**
 文本内容，不能为空，长度：小于 8000
 */
@property (nonatomic, strong) NSString *text;

@end

/**
 图片消息类型
 */
@interface LBSDKImageMessage: LBSDKMessage

/**
 图片，不能为空。图片大小：
 */
@property (nonatomic, strong) UIImage* image;

/**
 图片说明，可选字段
 */
@property (nonatomic, strong, nullable) NSString *caption;

@end


/**
 链接消息类型
 */
@interface LBSDKLinkMessage: LBSDKMessage

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong, nullable) NSString *desc;
@property (nonatomic, strong, nullable) UIImage *icon;
@property (nonatomic, strong) NSString *url;

@end

#pragma mark - response

/**
 聊呗返回第三方响应的基类
 */
@interface LBSDKBaseResp: NSObject

@property (nonatomic, assign, readonly) NSInteger resultCode;
@property (nonatomic, strong, readonly, nullable) NSString *errStr;
/**
 用户自定义标识表示请求的唯一性，从 Req 传入。
 */
@property (nonatomic, strong, nullable) NSString *state;

@end

/**
 聊呗返回的认证结果
 */
@interface LBSDKAuthResp: LBSDKBaseResp

/**
 用于获取 access_token
 */
@property (nonatomic, assign, readonly, nullable) NSString *code;

@end

/**
 聊呗返回的分享结果
 */
@interface LBSDKShareResp: LBSDKBaseResp
@end

NS_ASSUME_NONNULL_END
