//
//  SDKForTABT.h
//  Unity-iPhone
//
//  Created by Apple on 2017/10/16.
//

#import "UnityAppController.h"
#import <UIKit/UIKit.h>

//#import <Foundation/Foundation.h>

@interface SDKForXianLiao: NSObject{
    
}
//@property (strong, nonatomic) UIWindow *window;

+ (SDKForXianLiao *) SharedInstance;


-(void)registerApp;
-(void)shareText:(const char *)json;
-(void)shareDataImage:(const char *)json;
-(void)shareUrlImage:(const char *)json;
-(void)shareGame:(const char *)json;
-(void)login:(const char *)json;
@end
