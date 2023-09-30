-- idk what script to do so i just look whats comming out 


-- 1 idee GTA Online Heist 


local hasHeistStarted = false 
local lobbys = 0
local lobbyCount = 0 


function joinHeistMenu()
    local options = {
        {label = "Lobby Erstellen", value = "create"}, 
        {label = "Lobby Beitreten", valiue = "join"}
    }

    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'join_menu', {
        title = "Heist Menu", 
        align = "left",
        elements = options
    }, function(data, menu)
        if (data.current.value == "create") then 
            
        end
    end, function(data, menu)
        menu.close()
    end)
end