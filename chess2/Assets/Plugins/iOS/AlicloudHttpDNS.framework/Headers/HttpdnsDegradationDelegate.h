

#ifndef HttpdnsDegradationDelegate_h
#define HttpdnsDegradationDelegate_h

@protocol HttpDNSDegradationDelegate <NSObject>

- (BOOL)shouldDegradeHTTPDNS:(NSString *)hostName;

@end

#endif /* HttpdnsDegradationDelegate_h */
