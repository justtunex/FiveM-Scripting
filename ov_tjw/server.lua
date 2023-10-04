local lastUpdatedJob = nil 

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(source)
    local xPlayer = ESX.GetPlayerFromId(source) 

    if xPlayer ~= nil then 
        MySQL.Async.fetchAll('SELECT job FROM users WHERE identifier = ?', {xPlayer.identifier}, function(named)
            if named ~= nil then 
                lastUpdatedJob = named 
            end 
        end)
    end
end)

RegisterCommand("txtest", function()
    TriggerEvent("ov_checkCurrentJob")
end)

RegisterNetEvent("ov_checkCurrentJob")
AddEventHandler("ov_checkCurrentJob", function()
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer ~= nil then 
        MySQL.Async.fetchAll('SELECT job FROM users WHERE identifier = ?', {xPlayer.identifier}, function(jobName)
            if jobName ~= nil then 
                if jobName ~= lastUpdatedJoblastUpdatedJob then 
                    TriggerClientEvent("ov_removePedWeapons", xPlayer.source, jobName)
                end
            end
        end)
    end

end)