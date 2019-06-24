







#ifndef AidProtocol_h
#define AidProtocol_h

#define EVENT_REQUEST_STARTED 1000
#define EVENT_REQUEST_SUCCESS 1001
#define EVENT_REQUEST_FAILED 1002
#define EVENT_NETWORK_ERROR 1003

@protocol AidProtocolDelegate <NSObject>
@required
- (void) onAidEventChanged:(NSInteger)eventId
                       aid:(NSString *)aid;
@end

#endif
