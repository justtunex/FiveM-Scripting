-- i dont know what i do 

Citizen.CreateThread(function()
    AddTextEntry('openKey', 'Drücke ~INPUT_CONTEXT~')
    while true do 
        local sleep = 1000 

        for k, v in pairs(tx.positions) do 
            local ped = PlayerPedId()
            local distance = #(GetEntityCoords(ped) - v.coords)

            if (distance <= 7.0) then 
                -- draw marker
                if (distance <= 0.75) then 
                    DisplayHelpTextThisFrame('openKey', false)
                    
                    if (IsControlJustPressed(0, 38)) then 
                        -- do something
                    end
                end

            end
        end
        
        Citizen.Wait(sleep)
    end
end)