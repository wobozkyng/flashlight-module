local holdflashlight = false
local flashlightAlwaysOn = false

Citizen.CreateThread(function()
    while true do
        local playerPed = PlayerPedId()
        local _,weaponHash = GetCurrentPedWeapon(playerPed, true)
        holdflashlight = weaponHash == `WEAPON_FLASHLIGHT`
        if not holdflashlight and flashlightAlwaysOn then
            flashlightAlwaysOn = not flashlightAlwaysOn
            print(('flashlight turned %s'):format(flashlightAlwaysOn and 'on' or 'off'))
        end
        Citizen.Wait(1000)
    end
end)

RegisterCommand('+flashlighton', function()
    if holdflashlight then
        flashlightAlwaysOn = not flashlightAlwaysOn
        SetFlashLightKeepOnWhileMoving(flashlightAlwaysOn and 1 or 0)
        SetFlashLightEnabled(PlayerPedId(), flashlightAlwaysOn)
        print(('flashlight turned %s'):format(flashlightAlwaysOn and 'on' or 'off'))
    end
end)

RegisterCommand('-flashlighton', function()
    
end)

RegisterKeyMapping('+flashlighton', 'Turn Flashlight Always On/Off', 'keyboard', '')