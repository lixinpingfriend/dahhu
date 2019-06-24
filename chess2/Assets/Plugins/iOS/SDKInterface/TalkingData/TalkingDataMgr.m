






#import "TalkingDataMgr.h"

@implementation TalkingDataMgr
static TalkingDataMgr * _instance = nil;
+(TalkingDataMgr *) instance
{
    if (_instance == nil)
    {
        _instance = [[TalkingDataMgr alloc] init];
    }
    
    return _instance;
}

//- (void)setLaunchOptions:(NSDictionary*)launchOptions {
//    mLaunchOptions = launchOptions;
//}

- (void)recvRquest:(UnityProtos)proto :(NSDictionary *)params{
    switch (proto)
    {
        case TalkingDataInit:
//            [self initSdk:params];
            break;
        case TalkingDataLogin:
            [self setAccount:params];
            break;
        case TalkingDataEvent:
            [self setEvent:params];
            break;
        default:
            break;
    }
}

- (void)initSdk{
//    NSString *appId = [NSString stringWithFormat:@"%@",appId];
//    NSString *channel = [NSString stringWithFormat:@"%@",channel];
    [TalkingDataGA setVerboseLogDisabled];
    [TalkingDataGA onStart:TalkingData_APPID withChannelId:Channel];
}

- (void)setAccount:(NSDictionary *)params{
    
    NSString *accountId = [NSString stringWithFormat:@"%@",[params objectForKey:@"accountId"]];
    NSString *accountName = [NSString stringWithFormat:@"%@",[params objectForKey:@"accountName"]];
    NSString *gameServer = [NSString stringWithFormat:@"%@",[params objectForKey:@"gameServer"]];
    int accountType = [[params objectForKey:@"accountType"] intValue];
    int gender = [[params objectForKey:@"gender"] intValue];
    
    TDGAAccount *account = [TDGAAccount setAccount:accountId];
    [account setAccountName:accountName];
    [account setAccountType:accountType];
    [account setGender:gender];
    [account setGameServer:gameServer];
}

- (void)setEvent:(NSDictionary *)params{
    NSString *eventId = [NSString stringWithFormat:@"%@",[params objectForKey:@"eventId"]];
    [TalkingDataGA onEvent:eventId eventData:params];
}

@end
