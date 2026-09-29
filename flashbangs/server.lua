ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('flashbang:use')
AddEventHandler('flashbang:use', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local identifier = xPlayer.identifier

    MySQL.Async.fetchScalar('SELECT last_used FROM flashbangs WHERE player_id = @player_id', {
        ['@player_id'] = identifier
    }, function(lastUsed)
        local currentTime = os.time()
        if lastUsed and (currentTime - lastUsed) < Config.FlashbangCooldown then
            TriggerClientEvent('esx:showNotification', source, 'You must wait before using another flashbang.')
            return
        end

        MySQL.Async.execute('INSERT INTO flashbangs (player_id, last_used) VALUES (@player_id, @last_used) ON DUPLICATE KEY UPDATE last_used = @last_used', {
            ['@player_id'] = identifier,
            ['@last_used'] = currentTime
        }, function(rowsChanged)
            local players = ESX.GetPlayers()
            local playerCoords = GetEntityCoords(GetPlayerPed(source))

            for _, playerId in ipairs(players) do
                local targetCoords = GetEntityCoords(GetPlayerPed(playerId))
                local distance = #(playerCoords - targetCoords)

                if distance <= Config.FlashbangRange then
                    TriggerClientEvent('flashbang:blind', playerId)
                end
            end
        end)
    end)
end)