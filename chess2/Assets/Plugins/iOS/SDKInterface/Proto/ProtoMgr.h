






#import <Foundation/Foundation.h>
#import "ProtoData.h"
#import "gameEnum.h"
#import "JMessageMgr.h"
#import "TalkingDataMgr.h"

@interface ProtoMgr : NSObject{
    @public
        NSMutableArray *protos;
}
+ (ProtoMgr *) instance;
- (void)recvRquest:(const char *)data;
- (void)sendResponse:(UnityProtos)protoEnum : (NSString *) params;
- (ProtoData *)getProtoByIndex:(int) index;
- (void)initProtoMgr;
@end
