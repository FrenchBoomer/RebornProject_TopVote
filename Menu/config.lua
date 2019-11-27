LISTEDESVOTANTS = {}

local Touches = {
["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

RebornProject = "RebornProject_TopVote" -- Nom de la ressource
ToucheClavier = Touches["F6"] -- Touche d'ouverture du menu
Langue = "fr" -- Choix de la langue (Français = fr,Anglais = en,Espagnol = es)
Administration = false -- Activer / Desactiver la whiteliste
EnvoiNotification = true -- Activer / Desactiver l'envoi de notification aux joueurs connecte
JouerLaMusiqueDuPalier = true -- Activer / Desactiver la musique au palier atteind
EnvoiNotification = true -- Activer / Desactiver le bot d'envoi de notification Discord
SuppressionTotaleDeLaBdd = true -- Ici l'activation par true et la desactivation par false du systeme de suppression de bdd chaque 01 du mois
JourDeLaSuppression = "01" -- Ici l'entree du jour a la quelle chaque mois la suppression se fera
HeureMinimumMAJ = "15:00:00" -- Ici le reglage de l'heure minimum a laquelle l'action de suppression de la base de donnee se fera au prochain lancement du serveur (Il est recommander de faire en sorte que votre dernier reboot serveur ce fasse entre cette tranche d'horaire )
HeureMaximumMAJ = "23:30:00" -- Ici le reglage de l'heure maximum a laquelle l'action de suppression de la base de donnee se fera au prochain lancement du serveur (Il est recommander de faire en sorte que votre dernier reboot serveur ce fasse entre cette tranche d'horaire )
OptionTTS = false -- Activer / Desactiver la lecture de notification par tts discord
TitreNotifDiscord = "TOP SERVEUR" -- Titre de la notification discord
UrlImageDiscord = "https://imgur.com/DmdnCIw" -- Lien de l'image qui s'affichera dans la notification discord
PalierDeVote = 1 -- Nombre de votes necessaire pour jouer la musqique
VolumeDeLaMusique = 0.1 -- Volume de la musique au palier atteind
LienWebHook = "Link_Edit"  -- Lien webhook pour discord qui vous sert a recevoir une notification par votes recus sur top serveur

WhiteListe = {
    steam = "steam:ID",
    steam = "steam:ID",
    steam = "steam:ID",
    steam = "steam:ID",
    steam = "steam:ID",
}

Locales = {
    ['fr'] = {
        ['vote'] = ' vote ~ws~',
        ['votes'] = ' votes ~ws~',
        ['gestionbdd'] = 'Gestion de la base de donnee',
        ['quitter'] = '~r~Quitter le menu~s~',
        ['resvotes'] = 'Remettre a 0 le compteur de votes',
        ['deletebdd'] = 'Supprimer de la base de donnee',
        ['resvotesbdd'] = 'Remettre a 0 tous les votes',
        ['supmembres'] = 'Supprimer tous les membres',
        ['choix'] = '~w~Faites votre choix~s~',
        ['titre'] = 'VOTES TOP SERVEUR',
        ['notifresvotes'] = '~g~Votes du joueur remis a zero~s~',
        ['notifdeletebdd'] = '~g~Joueur supprimer de la base de donnee~s~',
        ['notifresvotesbdd'] = '~g~Remise a zero de tous les votes des joueurs~s~',
        ['notifsupmembres'] = '~g~Suppression de tous les joueurs~s~',
        ['notifwhiteliste'] = '~r~Vous ne faites pas parti de la whiteliste~s~',
        ['notifpourvote'] = ' Vient de voter sur Top Serveur c\'est son : ',
        ['notifpourvote2'] = '1',
        ['notifpourvote3'] = ' vote(s)',
        ['printserveur'] = '### LA BASE DE DONNEE DES VOTES MENSUEL DE TOP SERVEUR A ETAIT CORRECTEMENT REMIS A ZERO ###',
    },

    ['en'] ={
        ['vote'] = ' vote ~ws~',
        ['votes'] = ' votes ~ws~',
        ['gestionbdd'] = 'Management of the database',
        ['quitter'] = '~r~Leave the menu~s~',
        ['resvotes'] = 'Reset the vote counter',
        ['deletebdd'] = 'Delete from the database',
        ['resvotesbdd'] = 'Reset all votes',
        ['supmembres'] = 'Delete all members',
        ['choix'] = '~w~Make your choice~s~',
        ['titre'] = 'VOTES TOP SERVER',
        ['notifresvotes'] = '~g~Player Votes Reset~s~',
        ['notifdeletebdd'] = '~g~Player remove from the database~s~',
        ['notifresvotesbdd'] = '~g~Reset all players votes~s~',
        ['notifsupmembres'] = '~g~Deleting all players~s~',
        ['notifwhiteliste'] = '~r~You are not part of the whiteliste~s~',
        ['notifpourvote'] = ' Just vote on Top Server this is his : ',
        ['notifpourvote2'] = '1',
        ['notifpourvote3'] = ' vote(s)',
        ['printserveur'] = '### THE DATASHEET OF THE MONTHLY VOTES OF TOP SERVER WAS CORRECTLY REFERRED TO ZERO ###',
    },

    ['es'] ={
        ['vote'] = ' voto ~ws~',
        ['votes'] = ' votos ~ws~',
        ['gestionbdd'] = 'Gestión de la base de datos',
        ['quitter'] = '~r~Deja el menu~s~',
        ['resvotes'] = 'Restablecer el contador de votos',
        ['deletebdd'] = 'Eliminar de la base de datos',
        ['resvotesbdd'] = 'Restablecer todos los votos',
        ['supmembres'] = 'Eliminar todos los miembros',
        ['choix'] = '~w~Haz tu elección~s~',
        ['titre'] = 'VOTOS TOP SERVER',
        ['notifresvotes'] = '~g~Restablecer votos de jugador~s~',
        ['notifdeletebdd'] = '~g~Jugador eliminar de la base de datos~s~',
        ['notifresvotesbdd'] = '~g~Restablecer los votos de todos los jugadores~s~',
        ['notifsupmembres'] = '~g~Eliminar todos los jugadores~s~',
        ['notifwhiteliste'] = '~r~No eres parte de la whiteliste~s~',
        ['notifpourvote'] = ' Solo vote en el servidor superior, este es su : ',
        ['notifpourvote2'] = '1',
        ['notifpourvote3'] = ' voto(s)',
        ['printserveur'] = '### LA HOJA DE DATOS DE LOS VOTOS MENSUALES DEL SERVIDOR SUPERIOR SE REFERIÓ CORRECTAMENTE A CERO ###',
    },
}
