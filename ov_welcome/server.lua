RegisterNetEvent('playerLoaded')
AddEventHandler('playerLoaded', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer ~= nil then 
        TriggerClientEvent("ws_notify", "info", "OCEAN-V", "Willkommen auf Ocean-v wir Wünschen dir Viel Spaß !", 5000)
    end

end)    