fx_version 'cerulean'

game {'gta5'}

Auhor 'Tunex'
Descriptiopn 'FiveM Take Job Weapons'
version '1.0.0'

shared_script '@es_extended/imports.lua'


client_scripts {
    'config.lua',
    'client.lua'
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',  
    'server.lua'
}