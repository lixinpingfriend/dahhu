#import "UnityAppController.h"
#import <UIKit/UIKit.h>
#import "WXApi.h"
#import <AMapLocationKit/AMapLocationKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import "ConfigInfo.h"
#import <MAMapKit/MAMapKit.h>

@interface SDKForWechat : NSObject
{
    
}

+(SDKForWechat *) SharedInstance;
-(void)Init:(const char *)appid;
-(void) Login;
-(void) ShareUrl:(const char *)json;
-(void) ShareText:(const char *)json;
-(void) JpushStopPush:(const char *)param;
-(void) ShareImage:(const char *)json;
-(void) ShareMiniProgram:(const char *)json;
-(void) LaunchMiniProgram:(const char *)json;
//-(void) Recharge:(const char *)json;
@end
