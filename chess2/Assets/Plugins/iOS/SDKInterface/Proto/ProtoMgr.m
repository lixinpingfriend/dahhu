






#import "ProtoMgr.h"

@implementation ProtoMgr

NSString * LogTag = @"JMessage: %s";
static ProtoMgr * _instance = nil;
+(ProtoMgr *) instance
{
    if (_instance == nil)
    {
        _instance = [[ProtoMgr alloc] init];
        [_instance initProtos];
    }
    
    return _instance;
}
- (void)initProtoMgr{
    // 装作自己能init的样子 其实我是不会写oc
}

- (void)recvRquest:(const char *)data{
    NSDictionary * dict = [self JsonToDic:data];
    NSString *request = [NSString stringWithFormat:@"%@",[dict objectForKey:@"protoName"]];
    NSDictionary *params = [dict objectForKey:@"protoParams"];
    ProtoData *proto = [self getProtoByRequest:request];
    if(proto == nil){
        NSLog(@"JMessage: %@ 没定义这个proto",[NSString stringWithUTF8String:data]);
        return;
    }
    if(proto.index < 100)
    {
        [[JMessageMgr instance] recvRquest:proto.index :params];
    }
    else if (proto.index < 150)
    {
        [[TalkingDataMgr instance] recvRquest:proto.index :params];
    }
}
- (void)sendResponse:(UnityProtos)protoEnum : (NSString *) params{
    ProtoData *proto = [self getProtoByIndex:protoEnum];
    NSString *response = [NSString stringWithFormat:@"%@&_think_dit_&%@",proto.response,params];
    UnitySendMessage("GameSDKCallback", "OnSdkProtoCallback", response.UTF8String);
}

-(ProtoData *)getProtoByRequest:(NSString *)request{
//    ProtoData *mProto = nil;
//    [protos enumerateObjectsUsingBlock:^(ProtoData *proto, NSUInteger idx, BOOL * stop) {
//        if([proto.request isEqualToString:request]){
//            stop = YES;
//            mProto = proto;
//        }
//    }];
//enumerateObjectsUsingBlock 效率高一些  但是不知道怎么写lock  放弃
    for (int i = 0;i < protos.count; i++) {
        ProtoData *proto = protos[i];
        if([proto.request isEqualToString:request]){
            return proto;
        }
    }
    return nil;
}

-(ProtoData *)getProtoByIndex:(int) index{
    for (int i = 0;i < protos.count; i++) {
        ProtoData *proto = protos[i];
        if(proto.index == index){
            return proto;
        }
    }
    return nil;
}

-(NSDictionary *)JsonToDic:(const char *)json
{
    NSString * jsonData = [NSString stringWithUTF8String:json];
    NSData * data = [jsonData dataUsingEncoding:NSUTF8StringEncoding];
    NSError * error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if ([jsonObject isKindOfClass:[NSDictionary class]])
    {
        NSDictionary * dic = (NSDictionary *)jsonObject;
        return dic;
    }
    
    return nil;
}


-(void)initProtos{
    protos = [NSMutableArray array];
    
    //
    [protos addObject:[[ProtoData alloc] initWithProperty:1 :@"JMessageLoginRequest" :@"JMessageLoginResponse"]];
    [protos addObject:[[ProtoData alloc] initWithProperty:2 :@"JMessageCreateSingleTalkRequest" :@"JMessageCreateSingleTalkResponse"]];
    [protos addObject:[[ProtoData alloc] initWithProperty:3 :@"JMessageCreateGroupTalkRequest" :@"JMessageCreateGroupTalkResponse"]];
    [protos addObject:[[ProtoData alloc] initWithProperty:4 :@"JMessageGetGroupTalkRequest" :@"JMessageGetGroupTalkResponse"]];
    [protos addObject:[[ProtoData alloc] initWithProperty:5 :@"JMessageGetSingleTalkRequest" :@"JMessageGetSingleTalkResponse"]];
    [protos addObject:[[ProtoData alloc] initWithProperty:6 :@"JMessageDeleteGroupTalkRequest" :@"JMessageDeleteGroupTalkResponse"]];
    [protos addObject:[[ProtoData alloc] initWithProperty:11 :@"JMessageSingleCustomMsgRequest" :@"JMessageSingleFileMsgResponse"]];
    [protos addObject:[[ProtoData alloc] initWithProperty:18 :@"JMessageGroupCustomMsgRequest" :@"JMessageGroupCustomMsgResponse"]];
    [protos addObject:[[ProtoData alloc] initWithProperty:19 :@"JMessageLoginStateChangeRequest" :@"JMessageLoginStateChangeResponse"]];
    [protos addObject:[[ProtoData alloc] initWithProperty:20 :@"JMessageRecvGroupMsgRequest" :@"JMessageRecvGroupMsgResponse"]];
    [protos addObject:[[ProtoData alloc] initWithProperty:21 :@"JMessageDeleteSingleTalkRequest" :@"JMessageDeleteSingleTalkResponse"]];
    [protos addObject:[[ProtoData alloc] initWithProperty:22 :@"JMessageLogoutRequest" :@"JMessageLogoutResponse"]];
    [protos addObject:[[ProtoData alloc] initWithProperty:23 :@"JMessageRecvSingleMsgRequest" :@"JMessageRecvSingleMsgResponse"]];
    [protos addObject:[[ProtoData alloc] initWithProperty:24 :@"JMessageGroupOfflineMsgRequest" :@"JMessageGroupOfflineMsgResponse"]];
    [protos addObject:[[ProtoData alloc] initWithProperty:25 :@"JMessageSingleOfflineMsgRequest" :@"JMessageSingleOfflineMsgResponse"]];
    
    //talkingData
    [protos addObject:[[ProtoData alloc] initWithProperty:101 :@"TalkingDataInitRequest" :@"TalkingDataInitResponse"]];
    [protos addObject:[[ProtoData alloc] initWithProperty:102 :@"TalkingDataLoginRequest" :@"TalkingDataLoginResponse"]];
    [protos addObject:[[ProtoData alloc] initWithProperty:103 :@"TalkingDataEventRequest" :@"TalkingDataEventResponse"]];
    
    [protos addObject:[[ProtoData alloc] initWithProperty:151 :@"TalkingDataInitRequest" :@"TalkingDataInitResponse"]];
    [protos addObject:[[ProtoData alloc] initWithProperty:152 :@"TalkingDataLoginRequest" :@"TalkingDataLoginResponse"]];
    [protos addObject:[[ProtoData alloc] initWithProperty:153 :@"TalkingDataEventRequest" :@"TalkingDataEventResponse"]];
    
}
@end
