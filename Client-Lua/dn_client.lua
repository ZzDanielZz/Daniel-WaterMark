local isInfoDisplayed = false

AddEventHandler(DN.PlayerLoaded, function()
    TriggerServerEvent("Daniel-WaterMark:Server:PlayerHasBeenLoaded", GetPlayerServerId(PlayerId()))
end)

AddEventHandler(DN.PlayerSpawned, function()
    TriggerServerEvent("Daniel-WaterMark:Server:PlayerHasBeenLoaded", GetPlayerServerId(PlayerId()))
end)

updatePlayers = function(p)
    SendNUIMessage({
        ["action"] = "update",
        ["players"] = p,
        ["id"] = GetPlayerServerId(PlayerId()),
        ["serverName"] = DN.ServerName,
        ["displayLogo"] = DN.DisplayLogo,
        ["serverLogo"] = DN.ServerLogo 
    })
end

RegisterNetEvent("Daniel-WaterMark:UpdateSteamProfilePicture")
AddEventHandler("Daniel-WaterMark:UpdateSteamProfilePicture", function(steamProfilePicture, playercount)
    if steamProfilePicture then
        SendNUIMessage({
            ["action"] = "update",
            ["players"] = playercount,
            ["id"] = GetPlayerServerId(PlayerId()),
            ["serverName"] = DN.ServerName,
            ["steamProfilePicture"] = steamProfilePicture,
            ["displayLogo"] = DN.DisplayLogo,
            ["serverLogo"] = DN.ServerLogo
        })
    else
        SendNUIMessage({
            ["action"] = "update",
            ["players"] = playercount,
            ["id"] = GetPlayerServerId(PlayerId()),
            ["serverName"] = DN.ServerName,
            ["displayLogo"] = DN.DisplayLogo,
            ["serverLogo"] = DN.ServerLogo
        })
    end
end)

RegisterNetEvent("Daniel-WaterMark:updatePlayerCount")
AddEventHandler("Daniel-WaterMark:updatePlayerCount", function(playerCount)
    SendNUIMessage({
        ["action"] = "update",
        ["players"] = playerCount,
        ["id"] = GetPlayerServerId(PlayerId()),
        ["serverName"] = DN.ServerName,
        ["displayLogo"] = DN.DisplayLogo,
        ["serverLogo"] = DN.ServerLogo
    })
end)