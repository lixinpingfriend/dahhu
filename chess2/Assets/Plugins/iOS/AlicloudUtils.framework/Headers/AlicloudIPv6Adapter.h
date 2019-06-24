



#ifndef AlicloudIPv6Adapter_h
#define AlicloudIPv6Adapter_h
#import <Foundation/Foundation.h>

@interface AlicloudIPv6Adapter : NSObject

+ (instancetype)getInstance;

/**
 *	@brief	判断当前是否为IPv6-Only网络
 *
 *	@return
 */
- (BOOL)isIPv6OnlyNetwork;

/**
 *	@brief	手动刷新IPv6-Only网络的判定
 *
 *	@return
 */
- (BOOL)reResolveIPv6OnlyStatus;

/**
 *	@brief	自动完成对IPv4地址的适配
 *          IPv6-Only网络环境：IPv4 address -> IPv4 Embedded IPv6 address
            例：42.156.220.114 -> 64:ff9b::2a9c:dc72
 *	@param 	addr
 *
 *	@return
 */
- (NSString *)handleIpv4Address:(NSString *)addr;

/**
 *	@brief	判断是否为IPv4地址
 *
 *	@return
 */
- (BOOL)isIPv4Address:(NSString *)addr;

/**
 *	@brief	判断是否为IPv6地址
 *
 *	@return
 */
- (BOOL)isIPv6Address:(NSString *)addr;

@end

#endif /* AlicloudIPv6Adapter_h */
