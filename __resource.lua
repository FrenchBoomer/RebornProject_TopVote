resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"

ui_page('lib/index.html')

files {
    'lib/index.html',
    'Son/Musique.ogg',
}

client_script {
	'Menu/config.lua',
	'Menu/Client/client.lua',
	'Menu/Client/warmenu.lua',
}

server_scripts {
	"lib/VotePlugin.net.dll",
	'@mysql-async/lib/MySQL.lua',
	'Menu/config.lua',
	'Menu/Serveur/serveur.lua',
}
