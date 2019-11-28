if Langue == "fr" then
    LangueChoisie = Locales.fr
elseif Langue == "en" then
    LangueChoisie = Locales.en
elseif Langue == "es" then
    LangueChoisie = Locales.es
end

RegisterNetEvent('RebornProject:EnvoiClientDonnees')
AddEventHandler("RebornProject:EnvoiClientDonnees", function(THELISTEDESVOTANTS, IDENTIFIANT)
    LISTEDESVOTANTS = {}
    LISTEDESVOTANTS = THELISTEDESVOTANTS
    IDENTIFIANTDUJOUEUR = IDENTIFIANT
end)

RegisterNetEvent('RebornProject:Notification')
AddEventHandler("RebornProject:Notification", function(texte)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(texte)
    DrawNotification(true, false)
end)

RegisterNetEvent('RebornProject:NotificationImage')
AddEventHandler("RebornProject:NotificationImage", function(image, type, envoi, titre, texte)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(texte)
    SetNotificationMessage(image, image, true, type, envoi, titre, texte)
    DrawNotification(false, true)
end)

RegisterNetEvent('RebornProject:JouerLaMusique')
AddEventHandler("RebornProject:JouerLaMusique", function()
    SendNUIMessage({
        DemarrerLaMusique     = 'DemarrerLaMusique',
        VolumeDeLaMusique   = VolumeDeLaMusique
    })
end)

function VerificationWhiteListe()
    for k, v in ipairs(WhiteListe) do
        if IDENTIFIANTDUJOUEUR == v.steam then
            return true
        end     
    end
end

Citizen.CreateThread(function()

    WarMenu.CreateMenu('MenuVotesTopServeur')
    WarMenu.CreateSubMenu('GestionDesVotesTopServeur', 'MenuVotesTopServeur', LangueChoisie.choix)
    WarMenu.CreateSubMenu('GestionDeLaBaseDeDonneeTopServeur', 'MenuVotesTopServeur', LangueChoisie.choix)
    WarMenu.SetSubTitle('MenuVotesTopServeur', LangueChoisie.choix)
    WarMenu.SetTitleBackgroundSprite("MenuVotesTopServeur", "TopServeur", "MenuTopServeur")
    WarMenu.SetTitleBackgroundSprite("GestionDesVotesTopServeur", "TopServeur", "MenuTopServeur")
    WarMenu.SetTitleBackgroundSprite("GestionDeLaBaseDeDonneeTopServeur", "TopServeur", "MenuTopServeur")
    WarMenu.SetMenuButtonPressedSound('MenuVotesTopServeur', "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET")
    WarMenu.SetMenuButtonPressedSound('GestionDesVotesTopServeur', "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET")
    WarMenu.SetMenuButtonPressedSound('GestionDeLaBaseDeDonneeTopServeur', "CONFIRM_BEEP", "HUD_MINI_GAME_SOUNDSET")
    WarMenu.SetTitleBackgroundColor('MenuVotesTopServeur', 255, 255, 255, 255)
    WarMenu.SetTitleBackgroundColor('GestionDesVotesTopServeur', 255, 255, 255, 255)
    WarMenu.SetTitleBackgroundColor('GestionDeLaBaseDeDonneeTopServeur', 255, 255, 255, 255)
    WarMenu.SetMenuX('MenuVotesTopServeur', 0.02)
    WarMenu.SetMenuY('MenuVotesTopServeur', 0.05)
    WarMenu.SetMenuX('GestionDesVotesTopServeur', 0.02)
    WarMenu.SetMenuY('GestionDesVotesTopServeur', 0.05)
    WarMenu.SetMenuX('GestionDeLaBaseDeDonneeTopServeur', 0.02)
    WarMenu.SetMenuY('GestionDeLaBaseDeDonneeTopServeur', 0.05)

    WarMenu.SetMenuMaxOptionCountOnScreen('MenuVotesTopServeur', 15)

    while true do
        if WarMenu.IsMenuOpened('MenuVotesTopServeur') then
            for k, value in pairs(LISTEDESVOTANTS) do
                if value.nombredevotes <= 1 then
                    if WarMenu.MenuButton("~p~"..value.nom.."~s~ ~ws~ "..value.nombredevotes..LangueChoisie.vote, "GestionDesVotesTopServeur") then
                        NomDuJoueur = value.nom
                    end
                else
                    if WarMenu.MenuButton("~p~"..value.nom.."~s~ ~ws~ "..value.nombredevotes..LangueChoisie.votes, "GestionDesVotesTopServeur") then
                        NomDuJoueur = value.nom
                    end
                end
            end
            if WarMenu.MenuButton(LangueChoisie.gestionbdd, "GestionDeLaBaseDeDonneeTopServeur") then
            --elseif WarMenu.Button(LangueChoisie.quitter) then
                --WarMenu.CloseMenu()
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('GestionDesVotesTopServeur') then
            if WarMenu.Button(LangueChoisie.resvotes) then
                TriggerServerEvent("RebornProject:RemiseZeroVotesDuJoueur", NomDuJoueur)
                PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "BOMB_DISARMED", "GTAO_SPEED_CONVOY_SOUNDSET", 0, 0, 1)
                TriggerEvent("RebornProject:Notification", LangueChoisie.notifresvotes)
                WarMenu.CloseMenu()
            elseif WarMenu.Button(LangueChoisie.deletebdd) then
                TriggerServerEvent("RebornProject:SuppressionDuJoueurDeLaBaseDeDonnee", NomDuJoueur)
                PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "BOMB_DISARMED", "GTAO_SPEED_CONVOY_SOUNDSET", 0, 0, 1)
                TriggerEvent("RebornProject:Notification", LangueChoisie.notifdeletebdd)
                WarMenu.CloseMenu()
            end
            WarMenu.Display()
        elseif WarMenu.IsMenuOpened('GestionDeLaBaseDeDonneeTopServeur') then
            if WarMenu.Button(LangueChoisie.resvotesbdd) then
                TriggerServerEvent("RebornProject:RemiseZeroTousLesVotesEnBdd")
                PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "BOMB_DISARMED", "GTAO_SPEED_CONVOY_SOUNDSET", 0, 0, 1)
                TriggerEvent("RebornProject:Notification", LangueChoisie.notifresvotesbdd)
                WarMenu.CloseMenu()
            elseif WarMenu.Button(LangueChoisie.supmembres) then
                TriggerServerEvent("RebornProject:SuppressionTotaleDeLaBaseDeDonnee")
                PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "BOMB_DISARMED", "GTAO_SPEED_CONVOY_SOUNDSET", 0, 0, 1)
                TriggerEvent("RebornProject:Notification", LangueChoisie.notifsupmembres)
                WarMenu.CloseMenu()
            end
            WarMenu.Display()
        end
        if IsControlJustPressed(1, ToucheClavier) then
            TriggerServerEvent("RebornProject:RecuperationDesVotesBDD")
            Wait(200)
            if Administration == true then
                local VerifWL = VerificationWhiteListe()
                Wait(100)
                if VerifWL == true then
                    WarMenu.OpenMenu("MenuVotesTopServeur")
                else
                    PlaySound(GetPlayerServerId(GetPlayerPed(-1)), "CHECKPOINT_MISSED", "HUD_MINI_GAME_SOUNDSET", 0, 0, 1)
                    TriggerEvent("RebornProject:Notification", LangueChoisie.notifwhiteliste)
                end
            else
                WarMenu.OpenMenu("MenuVotesTopServeur")
            end
        end
        if WarMenu.IsMenuAboutToBeClosed("MenuVotesTopServeur") then
            -- ICI METTRE LES APPELS NECESSAIRES LORS DE LA FERMETURE DU MENU
        end
        Wait(0)
    end
end)
