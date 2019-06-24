
local protobuf = require "protobuf.protobuf"
module('package.runfast.model.net.protol.table.login_pb')

LOGINREQ = protobuf.Descriptor();
LOGINREQ_ACCOUNT_FIELD = protobuf.FieldDescriptor();
LOGINREQ_TOKEN_FIELD = protobuf.FieldDescriptor();
LOGINRSP = protobuf.Descriptor();
LOGINRSP_ACCOUNT_FIELD = protobuf.FieldDescriptor();
LOGINRSP_TOKEN_FIELD = protobuf.FieldDescriptor();
LOGINRSP_ROOM_ID_FIELD = protobuf.FieldDescriptor();
PINGREQ = protobuf.Descriptor();
PINGRSP = protobuf.Descriptor();
READY = protobuf.Descriptor();

LOGINREQ_ACCOUNT_FIELD.name = "account"
LOGINREQ_ACCOUNT_FIELD.full_name = ".Login.LoginReq.account"
LOGINREQ_ACCOUNT_FIELD.number = 1
LOGINREQ_ACCOUNT_FIELD.index = 0
LOGINREQ_ACCOUNT_FIELD.label = 2
LOGINREQ_ACCOUNT_FIELD.has_default_value = false
LOGINREQ_ACCOUNT_FIELD.default_value = ""
LOGINREQ_ACCOUNT_FIELD.type = 9
LOGINREQ_ACCOUNT_FIELD.cpp_type = 9

LOGINREQ_TOKEN_FIELD.name = "token"
LOGINREQ_TOKEN_FIELD.full_name = ".Login.LoginReq.token"
LOGINREQ_TOKEN_FIELD.number = 2
LOGINREQ_TOKEN_FIELD.index = 1
LOGINREQ_TOKEN_FIELD.label = 2
LOGINREQ_TOKEN_FIELD.has_default_value = false
LOGINREQ_TOKEN_FIELD.default_value = ""
LOGINREQ_TOKEN_FIELD.type = 9
LOGINREQ_TOKEN_FIELD.cpp_type = 9

LOGINREQ.name = "LoginReq"
LOGINREQ.full_name = ".Login.LoginReq"
LOGINREQ.nested_types = {}
LOGINREQ.enum_types = {}
LOGINREQ.fields = {LOGINREQ_ACCOUNT_FIELD, LOGINREQ_TOKEN_FIELD}
LOGINREQ.is_extendable = false
LOGINREQ.extensions = {}
LOGINRSP_ACCOUNT_FIELD.name = "account"
LOGINRSP_ACCOUNT_FIELD.full_name = ".Login.LoginRsp.account"
LOGINRSP_ACCOUNT_FIELD.number = 1
LOGINRSP_ACCOUNT_FIELD.index = 0
LOGINRSP_ACCOUNT_FIELD.label = 2
LOGINRSP_ACCOUNT_FIELD.has_default_value = false
LOGINRSP_ACCOUNT_FIELD.default_value = ""
LOGINRSP_ACCOUNT_FIELD.type = 9
LOGINRSP_ACCOUNT_FIELD.cpp_type = 9

LOGINRSP_TOKEN_FIELD.name = "token"
LOGINRSP_TOKEN_FIELD.full_name = ".Login.LoginRsp.token"
LOGINRSP_TOKEN_FIELD.number = 2
LOGINRSP_TOKEN_FIELD.index = 1
LOGINRSP_TOKEN_FIELD.label = 2
LOGINRSP_TOKEN_FIELD.has_default_value = false
LOGINRSP_TOKEN_FIELD.default_value = ""
LOGINRSP_TOKEN_FIELD.type = 9
LOGINRSP_TOKEN_FIELD.cpp_type = 9

LOGINRSP_ROOM_ID_FIELD.name = "room_id"
LOGINRSP_ROOM_ID_FIELD.full_name = ".Login.LoginRsp.room_id"
LOGINRSP_ROOM_ID_FIELD.number = 3
LOGINRSP_ROOM_ID_FIELD.index = 2
LOGINRSP_ROOM_ID_FIELD.label = 2
LOGINRSP_ROOM_ID_FIELD.has_default_value = false
LOGINRSP_ROOM_ID_FIELD.default_value = 0
LOGINRSP_ROOM_ID_FIELD.type = 5
LOGINRSP_ROOM_ID_FIELD.cpp_type = 1

LOGINRSP.name = "LoginRsp"
LOGINRSP.full_name = ".Login.LoginRsp"
LOGINRSP.nested_types = {}
LOGINRSP.enum_types = {}
LOGINRSP.fields = {LOGINRSP_ACCOUNT_FIELD, LOGINRSP_TOKEN_FIELD, LOGINRSP_ROOM_ID_FIELD}
LOGINRSP.is_extendable = false
LOGINRSP.extensions = {}
PINGREQ.name = "PingReq"
PINGREQ.full_name = ".Login.PingReq"
PINGREQ.nested_types = {}
PINGREQ.enum_types = {}
PINGREQ.fields = {}
PINGREQ.is_extendable = false
PINGREQ.extensions = {}
PINGRSP.name = "PingRsp"
PINGRSP.full_name = ".Login.PingRsp"
PINGRSP.nested_types = {}
PINGRSP.enum_types = {}
PINGRSP.fields = {}
PINGRSP.is_extendable = false
PINGRSP.extensions = {}
READY.name = "Ready"
READY.full_name = ".Login.Ready"
READY.nested_types = {}
READY.enum_types = {}
READY.fields = {}
READY.is_extendable = false
READY.extensions = {}

LoginReq = protobuf.Message(LOGINREQ)
LoginRsp = protobuf.Message(LOGINRSP)
PingReq = protobuf.Message(PINGREQ)
PingRsp = protobuf.Message(PINGRSP)
Ready = protobuf.Message(READY)

