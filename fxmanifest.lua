fx_version 'adamant'
game 'gta5'
lua54 'yes'

client_scripts {
    'client/*',
}

server_scripts {
	'server.lua',
}

shared_scripts {
	'@ox_lib/init.lua',
	'@qb-core/shared/locale.lua',
    'locales/en.lua',
    'locales/*.lua',
	'config.lua'
}

files {
	"html/css/style.css",
	"html/css/reset.css",
	"html/css/img/monitor.png",
	"html/css/img/table.png",
	"html/*.html",
	"html/scripts/listener.js",
}

ui_page "html/index.html"