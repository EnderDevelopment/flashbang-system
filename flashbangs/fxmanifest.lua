fx_version 'cerulean'
game 'gta5'

author 'YourName'
description 'Flashbang System'
version '1.0.0'

client_scripts {
    'client.lua'
}

server_scripts {
    '@es_extended/locale.lua',
    'server.lua'
}

shared_scripts {
    'config.lua'
}

dependencies {
    'es_extended'
}