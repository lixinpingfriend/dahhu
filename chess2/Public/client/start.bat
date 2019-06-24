
@echo off

rem echo process hall protos 
rem for %%i in (..\probuff\hall\*.proto) do (  
rem     protoc-gen-lua\example\protoc.exe --proto_path=..\probuff\hall\ --plugin=protoc-gen-lua="protoc-gen-lua\plugin\build.bat" --lua_out=protol\hall %%i      
rem ) 

rem echo process phz protos
rem for %%i in (..\probuff\phz\*.proto) do (  
rem     protoc-gen-lua\example\protoc.exe --proto_path=..\probuff\phz\ --plugin=protoc-gen-lua="protoc-gen-lua\plugin\build.bat" --lua_out=protol\paohuzi %%i
rem ) 

echo process majiang protos
for %%i in (..\probuff\majiang\*.proto) do (  
    protoc-gen-lua\example\protoc.exe --proto_path=..\probuff\majiang\ --plugin=protoc-gen-lua="protoc-gen-lua\plugin\build.bat" --lua_out=protol\majiang %%i
) 

echo process bullfight protos
for %%i in (..\probuff\bullfight\*.proto) do (  
    protoc-gen-lua\example\protoc.exe --proto_path=..\probuff\bullfight\ --plugin=protoc-gen-lua="protoc-gen-lua\plugin\build.bat" --lua_out=protol\bullfight %%i
) 

echo process henanmj protos
for %%i in (..\probuff\henanmj\*.proto) do (  
    protoc-gen-lua\example\protoc.exe --proto_path=..\probuff\henanmj\ --plugin=protoc-gen-lua="protoc-gen-lua\plugin\build.bat" --lua_out=protol\henanmj %%i
) 

echo process succeed

cmd