local lastUpdatedJob = nil 

RegisterNetEvent("esx:playerLoaded")
AddEventHandler("esx:playerLoaded", function(source)
    local xPlayer = ESX.GetPlayerFromId(source) 

    if xPlayer ~= nil then 
        MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = ?', {xPlayer.identifier}, function(result)
            if result ~= nil then 

                for k, v in pairs(result) do 
                    if v.job ~= nil then 
                        lastUpdatedJob = v.job 
                        break 
                    end   
                end 
            end 
        end)
    end
end)



RegisterNetEvent("ov_checkCurrentJob")
AddEventHandler("ov_checkCurrentJob", function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer ~= nil then 
        MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = ?', {xPlayer.identifier}, function(result)
            if result ~= nil then  
                for k, v in pairs(result) do 
                    if v.job ~= nil then 
                        if v.job ~= lastUpdatedJob then 
                            TriggerClientEvent("ov_removePedWeapons", xPlayer.source, v.job)
                        end
                    end                
                end
            end
         
        end)
    end

end)