#import "UnityAppController.h"
#import <UIKit/UIKit.h>
#import "WXApi.h"
#import <AMapLocationKit/AMapLocationKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import "ConfigInfo.h"
#import <MAMapKit/MAMapKit.h>
//#import "APOpenAPI.h"

@interface SDKMain : UnityAppController
{
    
}

+(SDKMain *) SharedInstance;
-(void) JpushStopPush:(const char *)param;
-(const char*) getIpsByHttpDNS:(const char *)url;
-(NSString*) getNetWorkStatus;
-(void) BeginLocation:(BOOL)isRegeocode;
- (double) CaculateDistance:(double)latitude1 : (double)longitude1 : (double)latitude2 : (double)longitude2;
-(NSDictionary *)JsonToDic:(const char *)json;
-(NSString*)dictionaryToJson:(NSDictionary *)dic;
-(NSData*)GetImageData:(NSDictionary *)dic;
-(NSData*)GetThumbImageData:(NSDictionary *)dic;
@end
