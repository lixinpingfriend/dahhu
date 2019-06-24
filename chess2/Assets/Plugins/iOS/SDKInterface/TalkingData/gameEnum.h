






#ifndef gameEnum_h
#define gameEnum_h

/*!
 * 与Unity通信的协议定义 注意与安卓那边对应
 */
typedef NS_ENUM(int, UnityProtos) {
    /// 登录
    JMessageLgion = 1,
    /// 创建单聊
    JMessageCreateSingleTalk = 2,
    /// 创建群聊
    JMessageCreateGroupTalk = 3,
    JMessageGetGroupTalk = 4,
    JMessageGetSingleTalk = 5,
    JMessageDeleteGroupTalk = 6,
    JMessageSingleCustomMsg = 11,
    JMessageGroupCustomMsg  = 18,
    JMessageLoginStateChange = 19,
    JMessageRecvGroupMsg = 20,
    JMessageDeleteSingleTalk = 21,
    JMessageLogout = 22,
    JMessageRecvSingleMsg = 23,
    JMessageGroupOfflineMsg = 24,
    JMessageSingleOfflineMsg = 25,
    
    
    TalkingDataInit = 101,
    TalkingDataLogin = 102,
    TalkingDataEvent = 103,
    
};

#endif /* gameEnum_h */
