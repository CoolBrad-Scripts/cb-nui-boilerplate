fx_version 'cerulean'
game 'gta5'

author 'Cool Brad Scripts'
version '1.0.0'
description 'A NUI Boilerplate for FiveM'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua',
}

client_scripts {
    '@qbx_core/modules/playerdata.lua', -- For QBOX users
    'client/framework.lua',
    'client/main.lua',
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server/*.lua',
}

files {
    'nui/*',
    'nui/script/*',
    'nui/style/*',
}

ui_page { 'nui/nui.html' }

dependencies {
    'ox_lib',
    'ox_target',
    'qbx_core',
}

lua54 'yes'