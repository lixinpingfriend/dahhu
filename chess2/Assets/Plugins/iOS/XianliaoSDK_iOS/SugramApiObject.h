//
//  SugramApiObject.h
//  SugramApi
//
//  Created by bu88 on 2017/3/15.
//  Copyright © 2017年 HHJ. All rights reserved.
//

#import <UIKit/UIKit.h>

#pragma mark:-----闲聊Api分享和登录的基础部分----
/**
 闲聊分享和登录对象基类
 */
@interface SugramApiObject : NSObject

@property(nonatomic, copy, readonly) NSString *appName;

@end


#pragma mark:-----分享-----
/**
 分享回调的情景
 
 - SugramShareSuccesslType: 分享成功
 - SugramShareCancelType: 分享取消
 - SugramShareErrorType: 分享失败
 - SugramShareUnkonwType: 未知
 */
typedef NS_ENUM(NSInteger, SugramShareCallBackType) {
    SugramShareSuccesslType = 0,
    SugramShareCancelType,
    SugramShareErrorType,
    SugramShareUnkonwType,
};
//分享的回调block
typedef void (^SugramShareCallBackBlock)(SugramShareCallBackType callBackType);


/**
 分享类型
 
 - SugramShareTextObjectType: 文本类型
 - SugramShareImageObjectType: 图片类型
 - SugramShareGameObjectType: 游戏分享
 */
typedef NS_ENUM(NSInteger, SugramShareObjectType) {
    SugramShareTextObjectType = 0,
    SugramShareImageObjectType,
    SugramShareGameObjectType,
};


/**
 闲聊分享基类
 */
@interface SugramShareBaseObject : SugramApiObject
// 分享类型
@property(nonatomic, assign, readonly) SugramShareObjectType type;

@end


/**
 文本类型的分型，文本分享必须传分享内容（如果不传分享内容则无法分享），分享标题是可选的
 */
@interface SugramShareTextObject : SugramShareBaseObject
// 分享标题
@property(nonatomic, copy) NSString *title;
// 分享内容
@property(nonatomic, copy) NSString *text;

@end


/**
 图片类型的分型，文本分享必须传分享图片URL
 */
@interface SugramShareImageObject : SugramShareBaseObject
// 分享图片URL
@property(nonatomic, copy) NSString *imageUrl;
// 分享的图片本身
@property(nonatomic, strong) NSData *imageData;

@end


/**
 游戏分享类型，游戏分享必须传递游戏标题，游戏描述和游戏缩略图
 */
@interface SugramShareGameObject : SugramShareBaseObject
// 游戏标题
@property(nonatomic, copy) NSString *roomToken;
// 游戏描述
@property(nonatomic, copy) NSString *roomId;
// 游戏标题
@property(nonatomic, copy) NSString *title;
// 游戏描述
@property(nonatomic, copy) NSString *text;
// 游戏缩略图URL
@property(nonatomic, copy) NSString *imageUrl;
// 游戏缩略图本身
@property(nonatomic, strong) NSData *imageData;
// 安卓下載地址
@property (nonatomic, copy) NSString *androidDownloadUrl;
// iOS下載地址
@property (nonatomic, copy) NSString *iOSDownloadUrl;

@end


#pragma mark:-----登录-----
/**
 登录的回调场景
 
 - SugramLoginSuccessType: 登录成功
 - SugramLoginCancelType: 登录取消
 - SugramLoginErrorType: 登录错误
 - SugramLoginUnowType: 未知
 */
typedef NS_ENUM(NSInteger, SugramLoginCallBackType) {
    SugramLoginSuccessType = 0,
    SugramLoginCancelType,
    SugramLoginErrorType,
    SugramLoginUnkonwType,
};
//登录的回调block
typedef void (^SugramLoginCallBackBlock)(SugramLoginCallBackType callBackType, NSString *code, NSString *state);


#pragma mark:-----游戏-----
//登录的调用block
typedef void (^SugramGameBlock)(NSString *roomToken, NSString *roomId, NSNumber *openId);

