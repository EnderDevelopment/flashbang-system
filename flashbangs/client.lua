local isBlinded = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isBlinded then
            SetTimecycleModifier('MP_flash')
            SetPedIsDrunk(GetPlayerPed(-1), true)
        else
            ClearTimecycleModifier()
            SetPedIsDrunk(GetPlayerPed(-1), false)
        end
    end
end)

RegisterNetEvent('flashbang:blind')
AddEventHandler('flashbang:blind', function()
    isBlinded = true
    Citizen.Wait(Config.FlashbangDuration * 1000)
    isBlinded = false
end)

RegisterCommand('flashbang', function()
    TriggerServerEvent('flashbang:use')
end, false)