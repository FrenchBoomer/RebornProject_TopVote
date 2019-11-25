local ListeDesVotants = {}

if Langue == "fr" then
    LangueChoisie = Locales.fr
elseif Langue == "en" then
    LangueChoisie = Locales.en
elseif Langue == "es" then
    LangueChoisie = Locales.es
end

function VerificationBDD(playername) 
  return MySQL.Sync.fetchScalar("SELECT nom FROM votes_topserveur WHERE nom=@nom",{['@nom'] = playername})
end

AddEventHandler('onPlayerVote', function (playername, ip, date)
  local source = source
  local nom = playername
  local VerificationBDD = VerificationBDD(nom)

    if VerificationBDD ~= nil then
      MySQL.Async.fetchAll("SELECT * FROM votes_topserveur WHERE nom=@nom", {["@nom"] = nom}, function (result)
        local votes = result[1].nombredevotes
        local nouveauvotes = votes + 1
        MySQL.Sync.fetchScalar("UPDATE votes_topserveur SET nombredevotes=@nombredevotes, date=@date, ip=@ip WHERE nom=@nom", {['@nom'] = nom, ['@nombredevotes'] = nouveauvotes, ['@date'] = date, ['@ip'] = ip})

        if EnvoiNotification == true then
          TriggerClientEvent("RebornProject:NotificationImage", -1, "CHAR_ARTHUR", 2, LangueChoisie.titre, false, playername..""..LangueChoisie.notifpourvote.."~g~"..nouveauvotes.."~s~"..LangueChoisie.notifpourvote3)
        end

        if NotificationDiscord == true then
          PerformHttpRequest(LienWebHook, function(Error, Content, Head) end, 'POST', json.encode({username = TitreNotifDiscord, content = playername..""..LangueChoisie.notifpourvote..""..LangueChoisie.notifpourvote2..""..LangueChoisie.notifpourvote3, avatar_url = UrlImageDiscord, tts = OptionTTS}), {['Content-Type'] = 'application/json'})
        end

        if JouerLaMusiqueDuPalier == true then
          if nouveauvotes >= PalierDeVote then
            TriggerClientEvent("RebornProject:JouerLaMusique", -1)
          end
        end
        
      end)

    else
      
      MySQL.Async.execute("INSERT INTO votes_topserveur (`nom`, `ip`, `date`, `nombredevotes`) VALUES (@nom, @ip, @date, @nombredevotes)", {['@nom'] = nom, ['@ip'] = ip, ['@date'] = date, ['@nombredevotes'] = 1})

      if EnvoiNotification == true then
        TriggerClientEvent("RebornProject:NotificationImage", -1, "CHAR_ARTHUR", 2, LangueChoisie.titre, false, playername..""..LangueChoisie.notifpourvote.."~g~"..LangueChoisie.notifpourvote2.."~s~"..LangueChoisie.notifpourvote3)
      end

      if NotificationDiscord == true then
        PerformHttpRequest(LienWebHook, function(Error, Content, Head) end, 'POST', json.encode({username = TitreNotifDiscord, content = playername..""..LangueChoisie.notifpourvote.."~g~"..LangueChoisie.notifpourvote2.."~s~"..LangueChoisie.notifpourvote3, avatar_url = UrlImageDiscord, tts = OptionTTS}), {['Content-Type'] = 'application/json'})
      end

    end
end)

RegisterServerEvent("RebornProject:RecuperationDesVotesBDD")
AddEventHandler('RebornProject:RecuperationDesVotesBDD', function()
  local source = source
  local Joueur = GetPlayerIdentifiers(source)[1]
  ListeDesVotants = {}
    MySQL.Async.fetchAll("SELECT * FROM votes_topserveur WHERE recuperation=@recuperation", {["@recuperation"] = "active"}, function (result)
  for _, v in ipairs(result) do
    ListeDesVotants[tonumber(v.id)] = {["id"] = v.id, ["nom"] = v.nom, ["ip"] = v.ip, ["date"] = os.date("%x",v.date/1000), ["nombredevotes"] = v.nombredevotes}
  end
    TriggerClientEvent('RebornProject:EnvoiClientDonnees', source, ListeDesVotants, Joueur)
    end)
end)

RegisterServerEvent("RebornProject:RemiseZeroVotesDuJoueur")
AddEventHandler('RebornProject:RemiseZeroVotesDuJoueur', function(nom)
    MySQL.Async.execute("UPDATE votes_topserveur SET nombredevotes='0' WHERE nom = @nom", { ['@nom'] = nom})
end)

RegisterServerEvent("RebornProject:SuppressionDuJoueurDeLaBaseDeDonnee")
AddEventHandler('RebornProject:SuppressionDuJoueurDeLaBaseDeDonnee', function(nom)
    MySQL.Async.execute("DELETE FROM votes_topserveur WHERE nom=@nom",{['@nom'] = nom})
end)

RegisterServerEvent("RebornProject:RemiseZeroTousLesVotesEnBdd")
AddEventHandler('RebornProject:RemiseZeroTousLesVotesEnBdd', function()
    MySQL.Async.execute("UPDATE votes_topserveur SET nombredevotes='0' WHERE recuperation = @recuperation", { ['@recuperation'] = "active"})
end)

RegisterServerEvent("RebornProject:SuppressionTotaleDeLaBaseDeDonnee")
AddEventHandler('RebornProject:SuppressionTotaleDeLaBaseDeDonnee', function()
    MySQL.Async.execute("DELETE FROM votes_topserveur WHERE recuperation=@recuperation",{['@recuperation'] = "active"})
end)

-- NE PAS TOUCHER !!!

local CurrentVersion = '1.0.0'
local GithubResourceName = 'RebornProject_TopVote'
local Name = 'Walter White'

PerformHttpRequest('https://raw.githubusercontent.com/WalterWhite84/'.. GithubResourceName .. '/master/Version', function(Error, NewestVersion, Header)
    print('\n')
    print('\n')
    print('#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#')
    print("## Nom de la ressource : "..GithubResourceName)
    print('## Production: ' .. Name)
    print('## Derniere version : ' .. NewestVersion)
    print('## Version en cours : ' .. CurrentVersion)
    print('Lien de telechargement de telechargement du script : https://github.com/WalterWhite84/MenuTopServeur')
    print('#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#-#')
    print('\n')
    print('\n')
end)

-- FIN