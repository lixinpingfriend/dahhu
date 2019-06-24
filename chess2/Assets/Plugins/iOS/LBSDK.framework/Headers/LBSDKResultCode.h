//
//  CXSDKHTTPErrorCode.h
//  CXSDKCoreKit
//
//  Created by Dylan Wang on 10/11/2017.
//  Copyright © 2017 Liaobei. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 聊呗回调的结果
 */
typedef NS_ENUM (NSInteger, LBSDKResultCode) {
    LBSDKResultCode_Success = 0,    // 操作成功
    LBSDKResultCode_Cancel,         // 用户取消了操作
    LBSDKResultCode_Unsupport,      // 暂不支持的请求
    LBSDKResultCode_AuthDenied,     // 第三方没有授权权限
    LBSDKResultCode_ShareDenied,    // 第三方没有分享权限
    LBSDKResultCode_IllegalArgument // 参数错误
};
