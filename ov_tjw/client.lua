RegisterNetEvent("ov_removePedWeapons")
AddEventHandler("ov_removePedWeapons", function(job)
    local weapons = TXGetWeaponsToRemove(job)

    if weapons ~= nil then 
        RemoveWeaponFromPed(PlayerPedId(), weapons) 
    end
end)

RegisterCommand("txtest", function(source)
    TriggerServerEvent("ov_checkCurrentJob", GetPlayerServerId(PlayerId()), job)
end)

function TXGetWeaponsToRemove(name)
    local weaponsToRemove = {}
    for _, job in pairs(tx.jobs) do 
        if job.name == name then 
            for _, weaponData in pairs(job.weapons) do 
                table.insert(weaponsToRemove, weaponData.name)
            end
        end
    end
    return weaponsToRemove
end
