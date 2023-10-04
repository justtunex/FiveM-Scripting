RegisterNetEvent("ov_removePedWeapons")
AddEventHandler("ov_removePedWeapons", function(job)
    local weapons = TXGetWeaponsToRemove(job)

    if weapons ~= nil then 
        RemoveWeaponFromPed(PlayerPedId(), weapons) 
        
    end
end)

function TXGetWeaponsToRemove(name)
    for _, jobs in pairs(tx.jobs) do 
        if jobs.name == name then 
            for _, weapons in pairs(jobs.weapons) do 
                return weapons.weapon 
            end
        end
    end
end