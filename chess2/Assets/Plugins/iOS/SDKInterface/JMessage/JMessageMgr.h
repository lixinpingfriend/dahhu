






#import <Foundation/Foundation.h>
#import <JMessage/JMessage.h>
#import "ProtoMgr.h"
#import "gameEnum.h"

@interface JMessageMgr : NSObject{
    //NSString *JiGuang_APIKey;
}
+ (JMessageMgr *) instance;
- (void)recvRquest:(UnityProtos)proto :(NSDictionary *)params;
- (void)initJMessage:(NSDictionary*)launchOptions :(const NSString *)JiGuang_APIKey;
@end
