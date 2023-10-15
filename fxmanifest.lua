fx_version 'adamant'
game 'gta5'
lua54 'yes'

author 'More Then Code'
description 'Arcade (mtc-arcade) 1.0.0'
version '1.0.0'

client_scripts {
    'client/*',
}

server_scripts {
	'server/*.lua',
}

shared_scripts {
	'@ox_lib/init.lua',
	'@qb-core/shared/locale.lua',
    	'locales/en.lua',
    	'locales/*.lua',
	'shared/*.lua'
}

files {
	"html/css/*.css",
	"html/css/img/*.png",
	"html/*.html",
	"html/scripts/*.js",
}

ui_page "html/index.html"
