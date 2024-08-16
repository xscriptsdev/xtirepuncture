fx_version 'cerulean'
game 'gta5'
lua54 'yes'
author 'X SCRIPTS'
description 'Tire Puncture'
version '1.0.0'

shared_script { 
  'shared/config.lua',
  '@ox_lib/init.lua'

}

client_script 'client/main.lua'
server_script 'server/main.lua'
