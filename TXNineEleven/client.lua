local hasEventStarted = false 

RegisterCommand("9/11", function()
    --  creating a plane thats automatic flying to a specified

    hasEventStarted = true 
    local ped = PlayerPedId()
    
    for _, settings in pairs(tx.settings) do 
        local aircraftModel = settings.plane
        RequestModel(aircraftModel)
        while not HasModelLoaded(aircraftModel) do
            Wait(1)
        end
    
        local aircraft = CreateVehicle(aircraftModel, settings.spawnPoint.x, settings.spawn Point.y, settings.spawnPoint.z, settings.heading, false, false)
    
        TaskWarpPedIntoVehicle(ped, aircraft, 0)
    
        local driverHash = GetHashKey("s_m_m_pilot_02")
        RequestModel(driverHash)
        while not HasModelLoaded(driverHash) do
            Wait(1)
        end
    
        local driver = CreatePedInsideVehicle(aircraft, 4, driverHash, -1, false, true)
    
        TaskPlaneMission(driver, aircraft, 0, 0, settings.flyTo.x, settings.flyTo.y, settings.flyTo.z, 4, 100.0, 100.0, 0.0, 1000, 1500)
        
        while not IsEntityAtCoord(aircraft, settings.flyTo.x, settings.flyTo.y, settings.flyTo.z, true, true, 0) do
            Wait(1000)
        end
        
        
        local aircraft2 = CreateVehicle(aircraftModel, settings.spawnPoint.x, settings.spawnPoint.y, settings.spawnPoint.z, settings.heading, false, false)


        TaskWarpPedIntoVehicle(ped, aircraft2, 0)
    
        local driverHash = GetHashKey("s_m_m_pilot_02")
        RequestModel(driverHash)
        while not HasModelLoaded(driverHash) do
            Wait(1)
        end
    
        local driver = CreatePedInsideVehicle(aircraft2, 4, driverHash, -1, false, true)
    
        TaskPlaneMission(driver, aircraft2, 0, 0, settings.flyToSecondPlane.x, settings.flyToSecondPlane.y, settings.flyToSecondPlane.z, 4, 100.0, 100.0, 0.0, 1000, 1500)
        
        while not IsEntityAtCoord(aircraft2, settings.flyToSecondPlane.x, settings.flyToSecondPlane.y, settings.flyToSecondPlane.z, true, true, 0) do
            Wait(1000)
        end
        


    
        hasEventStarted = false 

    end

    

end)