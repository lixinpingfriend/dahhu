

#import <Foundation/Foundation.h>
#import "HttpdnsDegradationDelegate.h"

@interface HttpDnsService: NSObject

@property (nonatomic, assign) int accountID;

@property (nonatomic, weak, setter=setDelegateForDegradationFilter:) id<HttpDNSDegradationDelegate> delegate;

@property (nonatomic, assign) NSTimeInterval timeoutInterval;

+ (instancetype)sharedInstance;

- (void)setPreResolveHosts:(NSArray *)hosts;

- (NSString *)getIpByHostAsync:(NSString *)host;

- (NSArray *)getIpsByHostAsync:(NSString *)host;

- (NSString *)getIpByHostAsyncInURLFormat:(NSString *)host;

- (void)setHTTPSRequestEnabled:(BOOL)enable;

- (void)setExpiredIPEnabled:(BOOL)enable;

- (void)setLogEnabled:(BOOL)enable;

- (void)setPreResolveAfterNetworkChanged:(BOOL)enable;

@end
