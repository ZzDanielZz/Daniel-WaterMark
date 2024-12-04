local steamApiKey = DN.SteamWebAPI
local IsPictureLoaded = false
local isPlayerLoaded = false
local playerCountfortrigger = #GetPlayers()
local playeridglobal = nil

if steamApiKey == "" then
    print("Error: Steam API key not set in server.cfg")
end

RegisterNetEvent("Daniel-WaterMark:Server:PlayerHasBeenLoaded")
AddEventHandler("Daniel-WaterMark:Server:PlayerHasBeenLoaded", function(source)
    local src = source
    playeridglobal = src
    isPlayerLoaded = true
    TriggerPlayerSteamProfile(src)
end)

function TriggerPlayerSteamProfile(playerId)
    local steamID64 = GetSteamID64(playerId)
    if steamID64 then
        getSteamProfilePicture(tonumber(steamID64,16), playerId)
    else
        TriggerClientEvent("Daniel-WaterMark:UpdateSteamProfilePicture", playerId, DN.DefaultSteamPicture, playerCountfortrigger)
    end
end

function GetSteamID64(playerId)
    local identifiers = GetPlayerIdentifiers(playerId)
    for _, identifier in ipairs(identifiers) do
        if string.sub(identifier, 1, 6) == "steam:" then
            return string.sub(identifier, 7)
        end
    end
    return nil
end

getSteamProfilePicture = function(steamID64, playerId)
    local url = "http://api.steampowered.com/ISteamUser/GetPlayerSummaries/v0002/?key=" .. steamApiKey .. "&steamids=" .. steamID64

    PerformHttpRequest(url, function(status, response, headers)
        if status == 200 then
            local data = json.decode(response)
            if data.response.players and data.response.players[1] then
                local profileData = data.response.players[1].avatarfull
                if profileData then
                    IsPictureLoaded = true
                    TriggerClientEvent("Daniel-WaterMark:UpdateSteamProfilePicture", playerId, profileData, playerCountfortrigger)
                else
                    IsPictureLoaded = true
                    TriggerClientEvent("Daniel-WaterMark:UpdateSteamProfilePicture", playerId, DN.DefaultSteamPicture, playerCountfortrigger)
                end
            else
                TriggerClientEvent("Daniel-WaterMark:UpdateSteamProfilePicture", playerId, DN.DefaultSteamPicture, playerCountfortrigger)
            end
        else
            TriggerClientEvent("Daniel-WaterMark:UpdateSteamProfilePicture", playerId, DN.DefaultSteamPicture, playerCountfortrigger)
        end
    end, "GET")
end

Citizen.CreateThread(function()
    while true do
        local playerCount = #GetPlayers()
        TriggerClientEvent("Daniel-WaterMark:updatePlayerCount", -1, playerCount)
        Citizen.Wait(3500)
    end
end)