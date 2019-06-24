







#import "JMessageMgr.h"

@interface JMessageMgr () <JMessageDelegate>
{
    JMSGMessage *lastSendMessage;
}
@end

@implementation JMessageMgr
static JMessageMgr * _instance = nil;
+(JMessageMgr *) instance
{
    if (_instance == nil)
    {
        _instance = [[JMessageMgr alloc] init];
    }
    
    return _instance;
}

- (void)initJMessage:(NSDictionary*)launchOptions :(const NSString *)JiGuang_APIKey{
    [JMessage addDelegate:self withConversation:nil];
    // Required - 启动 JMessage SDK
    [JMessage setupJMessage:launchOptions
                     appKey:(NSString *)JiGuang_APIKey
                    channel:nil
           apsForProduction:NO
                   category:nil
             messageRoaming:NO];
}

- (void)recvRquest:(UnityProtos)proto :(NSDictionary *)params{
    switch (proto)
    {
        case JMessageLgion: //login
            [self login:params];
            break;
        case JMessageLogout: // logout
            [self logout:params];
            break;
        case JMessageGroupCustomMsg: //goup custom msg
            [self sendGroupMessage:params];
            break;
        case JMessageSingleCustomMsg: //single custom msg
            [self sendSingleMessage:params];
            break;
        case JMessageGetSingleTalk:
            [self getSingleConversation:params];
            break;
        case JMessageGetGroupTalk:
            [self getGroupConversation:params];
            break;
        default:
            break;
    }
}

- (void)login:(NSDictionary *)params{
    NSString *username = [NSString stringWithFormat:@"%@",[params objectForKey:@"username"]];
    NSString *password = [NSString stringWithFormat:@"%@",[params objectForKey:@"password"]];
    [JMSGUser loginWithUsername:username password:password completionHandler:^(id resultObject, NSError *error) {
        NSString *response = @"";
        if (!error) {
            //登录成功
             response = [self createJsonByDic:[self createBaseResponse:0 :true :@"登录成功!"]];
        } else {
            //登录失败
            response = [self createJsonByDic:[self createBaseResponse:1 :false :@"登录失败!"]];
        }
        [[ProtoMgr instance] sendResponse:JMessageLgion :response];
    }];
}
- (void)logout:(NSDictionary *)params{
    //退出当前登录的用户
    [JMSGUser logout:^(id resultObject, NSError *error) {
        if (!error) {
            //退出登录成功
        } else {
            //退出登录失败
            NSLog(@"jmessage 注销失败！！！！！！！！！！！");
        }
    }];
}
- (void)getSingleConversation:(NSDictionary *)params{
    [JMessage resetBadge];
    NSString *username = [NSString stringWithFormat:@"%@",[params objectForKey:@"username"]];
    int max = [[params objectForKey:@"maxFind"] intValue];
    JMSGConversation * conversation = [JMSGConversation singleConversationWithUsername:username];
    NSArray *messageList = [conversation messageArrayFromNewestWithOffset:0 limit:[NSNumber numberWithInt:max]];
    NSMutableArray *singleArray = [NSMutableArray array];
    NSString * response = @"";
    int count = (int)messageList.count;
    for( int i=0; i<count; i++){
        JMSGMessage *message = (JMSGMessage *)[messageList objectAtIndex:i];
        if (message.targetType == kJMSGConversationTypeGroup && message.contentType == kJMSGContentTypeCustom) {
            JMSGCustomContent *content = (JMSGCustomContent *)message.content;
            if(message.contentType == kJMSGContentTypeCustom)
            {
                [singleArray addObject:content.customDictionary];
            }
        }
    }
    response = [self jsonStringWithArray:singleArray];
    [[ProtoMgr instance] sendResponse:JMessageGetSingleTalk :response];
}
- (void)getGroupConversation:(NSDictionary *)params{
    [JMessage resetBadge];
    NSString *groupId = [NSString stringWithFormat:@"%@",[params objectForKey:@"groupId"]];
    int max = [[params objectForKey:@"maxFind"] intValue];
    JMSGConversation * conversation = [JMSGConversation groupConversationWithGroupId:groupId];
    NSArray *messageList = [conversation messageArrayFromNewestWithOffset:0 limit:[NSNumber numberWithInt:max]];
    NSMutableArray *groupArray = [NSMutableArray array];
    NSString * response = @"";
    int count = (int)messageList.count;
    for( int i=count-1; i>=0; i--){
        JMSGMessage *message = (JMSGMessage *)[messageList objectAtIndex:i];
        if (message.targetType == kJMSGConversationTypeGroup && message.contentType == kJMSGContentTypeCustom) {
            JMSGCustomContent *content = (JMSGCustomContent *)message.content;
            if(message.contentType == kJMSGContentTypeCustom)
            {
                [groupArray addObject:content.customDictionary];
            }
        }
    }
    response = [self jsonStringWithArray:groupArray];
    [[ProtoMgr instance] sendResponse:JMessageGetGroupTalk :response];
}
- (void)sendSingleMessage :(NSDictionary *)params{
    //JMSGCustomContent
    NSString *username = [NSString stringWithFormat:@"%@",[params objectForKey:@"username"]];
    JMSGCustomContent *customContent = [[JMSGCustomContent alloc] initWithCustomDictionary:params];
    JMSGMessage *message = [JMSGMessage createSingleMessageWithContent:customContent username:username];
    JMSGOptionalContent *optionalContent = [[JMSGOptionalContent alloc] init];
    optionalContent.noSaveNotification = YES;
    [JMSGMessage sendMessage:message optionalContent:optionalContent];
}

- (void)sendSingleTextMessage:(NSString *)params {
    
}

- (void)sendSingleImageMessage:(NSString *)params {
    
}

- (void)sendSingleVoiceMessage:(NSString *)params {
    
}

- (void)sendSingleFileMessage:(NSString *)params {
    
}

- (void)sendSingleLocationMessage:(NSString *)params {
    
}


- (void)sendGroupMessage:(NSDictionary *)params{
    //NSDictionary *dic = [self JsonToDic:params];
    NSString *groupId = [NSString stringWithFormat:@"%@",[params objectForKey:@"groupId"]];
    JMSGCustomContent *customContent = [[JMSGCustomContent alloc] initWithCustomDictionary:params];
    JMSGMessage *message = [JMSGMessage createGroupMessageWithContent:customContent groupId:groupId];
    JMSGOptionalContent *optionalContent = [[JMSGOptionalContent alloc] init];
    optionalContent.noSaveNotification = YES;
    [JMSGMessage sendMessage:message optionalContent:optionalContent];
}

- (void)sendGroupTextMessage:(NSString *)params {
    
}

- (void)sendGroupImageMessage:(NSString *)params {
    
}

- (void)sendGroupVoiceMessage:(NSString *)params {
    
}

- (void)sendGroupFileMessage:(NSString *)params {
    
}

- (void)sendGroupLocationMessage:(NSString *)params {
    
}


- (void)onSendMessageResponse:(JMSGMessage *)message error:(NSError *)error{
    NSString *response = @"";
    UnityProtos proto = JMessageGroupCustomMsg;
    NSLog(@"onSendMessageResponse %s","--------------------------");
    if (message.targetType == kJMSGConversationTypeSingle) {
        proto = JMessageSingleCustomMsg;
    }
    
    if (!error) {
            JMSGCustomContent *content = (JMSGCustomContent *)message.content;
            response = [self createJsonByDic:[self createResponseWithDic:0 :true :@"你发送成功了，厉害！厉害！佩服！佩服！" :content.customDictionary]];
    }
    else
    {
        response = [self createJsonByDic:[self createBaseResponse:1 :false :@"发送失败!"]];
        NSLog(@"send error: %@",error);
    }
    [[ProtoMgr instance] sendResponse:proto :response];
    
}


- (void)onReceiveMessageRetractEvent:(JMSGMessageRetractEvent *)retractEvent{
    NSLog(@"\n === 收到消息撤回事件 === \n retract message:%@",retractEvent.retractMessage);
}
- (void)onReceiveApplyJoinGroupApprovalEvent:(JMSGApplyJoinGroupEvent *)event {
    NSLog(@"\n === 收到申请入群事件 === \n eventID: %@ \n gid: %@ \n 邀请人: %@ \n 被邀请人: %@",event.eventID,event.groupID,event.sendApplyUser.displayName,event.joinGroupUsers);
}
- (void)onReceiveGroupAdminRejectApplicationEvent:(JMSGGroupAdminRejectApplicationEvent *)event {
    NSLog(@"\n ===管理员拒绝入群申请===\n 群 gid:%@，管理员：%@， 拒绝原因：%@",event.groupID,event.groupManager.displayName,event.rejectReason);
}

- (void)onSyncOfflineMessageConversation:(JMSGConversation *)conversation
                         offlineMessages:(NSArray JMSG_GENERIC(__kindof JMSGMessage *)*)offlineMessages{
    NSString *response =[self createJsonByDic:[self createBaseResponse:0 :true :@"收到离线消息接收"]];
    [[ProtoMgr instance] sendResponse:JMessageGroupOfflineMsg :response];
}

- (void)onReceiveMessage:(JMSGMessage *)message error:(NSError *)error {
    
    if (!error) {
        
        if (message.targetType == kJMSGConversationTypeGroup) {
            if(message.contentType == kJMSGContentTypeCustom)
            {
                NSString *response = @"";
                JMSGCustomContent *content = (JMSGCustomContent *)message.content;
                
                response = [self createJsonByDic:[self createResponseWithDic:0 :true :@"收到了一条群聊消息！" :content.customDictionary]];
                [[ProtoMgr instance] sendResponse:JMessageRecvGroupMsg :response];
            }
        }
        
        
        if (message.targetType == kJMSGConversationTypeSingle){
            if(message.contentType == kJMSGContentTypeCustom)
            {
                NSString *response = @"";
                JMSGCustomContent *content = (JMSGCustomContent *)message.content;
                response = [self createJsonByDic:[self createResponseWithDic:0 :true :@"收到了一条单聊消息！" :content.customDictionary]];
                [[ProtoMgr instance] sendResponse:JMessageRecvSingleMsg :response];
            }
        }
    }
    else
    {
        //response = [self createJsonByDic:[self createBaseResponse:1 :false :@"发送失败!"]];
        NSLog(@"recv error: %@",error);
    }
}

- (void)onReceiveNotificationEvent:(JMSGNotificationEvent *)event{
    SInt32 eventType = (JMSGEventNotificationType)event.eventType;
    switch (eventType) {
        case kJMSGEventNotificationReceiveFriendInvitation:
        case kJMSGEventNotificationAcceptedFriendInvitation:
        case kJMSGEventNotificationDeclinedFriendInvitation:
        case kJMSGEventNotificationDeletedFriend:
            break;
        case kJMSGEventNotificationReceiveServerFriendUpdate:
            break;
        case kJMSGEventNotificationLoginKicked:
        case kJMSGEventNotificationServerAlterPassword:
        case kJMSGEventNotificationUserLoginStatusUnexpected:
        {
            NSString *response = @"";
            NSString *desc = @"";
            NSMutableDictionary *dic = [NSMutableDictionary dictionary];
            [dic setValue:[NSNumber numberWithBool:true] forKey:@"isOffline"];
            [dic setValue:[NSNumber numberWithInt:eventType] forKey:@"offType"];
            if(eventType == kJMSGEventNotificationLoginKicked)
            {
                NSLog(@"JMessage 用户被挤下线了");
                desc = @"用户被挤下线！";
                
            }
            
            if (eventType == kJMSGEventNotificationServerAlterPassword) {
                NSLog(@"JMessage 非客户端修改密码强制登出事件 ");
                desc = @"服务端修改密码强制登出";
            }
            
            if (eventType == kJMSGEventNotificationUserLoginStatusUnexpected) {
                NSLog(@"JMessage 用户登录状态异常事件（需要重新登录）");
                desc = @"用户登录状态异常";
            }
            response = [self createJsonByDic:[self createResponseWithDic:0 :true :desc :dic]];
            [[ProtoMgr instance] sendResponse:JMessageLoginStateChange :response];
        }
            break;
        default:
            break;
    }
}

- (NSDictionary *)createBaseResponse:(int) result :(bool) success :(NSString *)desc {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:[NSNumber numberWithInt:result] forKey:@"result"];
    [dic setValue:[NSNumber numberWithBool:success] forKey:@"success"];
    [dic setValue:desc forKey:@"desc"];
    return dic;
}

- (NSDictionary *)createResponseWithDic:(int) result :(bool) success :(NSString *)desc :(NSDictionary *)pDic {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:[NSNumber numberWithInt:result] forKey:@"result"];
    [dic setValue:[NSNumber numberWithBool:success] forKey:@"success"];
    [dic setValue:desc forKey:@"desc"];
    [dic addEntriesFromDictionary:pDic];
    return dic;
}

- (NSString *)createJsonByDic:(NSDictionary *)dic{
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic
                                                   options:NSJSONWritingPrettyPrinted
                                                     error:nil];
    NSString *jsonStr = [[NSString alloc] initWithData:jsonData
                                              encoding:NSUTF8StringEncoding];
    return jsonStr;
}


-(NSString *) jsonStringWithArray:(NSArray *)array{
    NSMutableString *reString = [NSMutableString string];
    [reString appendString:@"["];
    NSMutableArray *values = [NSMutableArray array];
    for (id valueObj in array) {
        NSString *value = [self jsonStringWithObject:valueObj];
        if (value) {
            [values addObject:[NSString stringWithFormat:@"%@",value]];
        }
    }
    [reString appendFormat:@"%@",[values componentsJoinedByString:@","]];
    [reString appendString:@"]"];
    return reString;
}
-(NSString *) jsonStringWithDictionary:(NSDictionary *)dictionary{
    return [self createJsonByDic:dictionary];
}
-(NSString *) jsonStringWithString:(NSString *) string{
    return [NSString stringWithFormat:@"\"%@\"",
            [[string stringByReplacingOccurrencesOfString:@"\n" withString:@"\\n"] stringByReplacingOccurrencesOfString:@"\""withString:@"\\\""]
            ];
}
-(NSString *) jsonStringWithObject:(id) object{
    NSString *value = nil;
    if (!object) {
        return value;
    }
    if ([object isKindOfClass:[NSString class]]) {
        value = [self jsonStringWithString:object];
    }else if([object isKindOfClass:[NSDictionary class]]){
        value = [self jsonStringWithDictionary:object];
    }else if([object isKindOfClass:[NSArray class]]){
        value = [self jsonStringWithArray:object];
    }
    return value;
}

-(NSDictionary *)JsonToDic:(NSString *)json
{
    NSData * data = [json dataUsingEncoding:NSUTF8StringEncoding];
    NSError * error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    if ([jsonObject isKindOfClass:[NSDictionary class]])
    {
        NSDictionary * dic = (NSDictionary *)jsonObject;
        return dic;
    }
    else
    {
        NSLog(@"jmessage json 解析失败: %@",json);
    }
    
    return nil;
}

@end
