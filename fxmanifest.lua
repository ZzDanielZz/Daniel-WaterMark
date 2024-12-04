fx_version "adamant"
game "gta5"
lua54 "yes"

author "Daniel"
description "Daniel Advanced Watermark System"
version "1.0.0"
ui_page 'UserInterface-NUI/index.html'

client_scripts {
    "Client-Lua/*.lua",
}

server_scripts {
    "Server-Lua/*.lua",
}

shared_scripts {
    "Shared-Lua/dn_config.lua",
    --'@ox_lib/init.lua', -- Uncomment If You Use OX Notify System
}

files {
    'UserInterface-NUI/index.html',
    'UserInterface-NUI/script.js',
    'UserInterface-NUI/style.css',
}