






#import "ProtoData.h"

@interface ProtoData()

@end

@implementation ProtoData
@synthesize index = _index;
@synthesize request = _request;
@synthesize response = _response;

-(id) initWithProperty:(int)initIndex : (NSString *)initRequest : (NSString *)initResponse{
    _index = initIndex;
    _request = initRequest;
    _response = initResponse;
    return self;
}
@end
