






#import <Foundation/Foundation.h>

@interface ProtoData : NSObject{
    @private
        int _index;
        NSString *_request;
        NSString *_response;
}
@property(nonatomic, strong) NSString *request;
@property(nonatomic, strong) NSString *response;
@property(nonatomic, readonly) int index;
-(id) initWithProperty:(int)initIndex : (NSString *)initRequest : (NSString *)initResponse;
@end
