ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

function OpenLocation()
    local Location = RageUI.CreateMenu("Location", "Séléctionne un sous-Marin")
  
    RageUI.Visible(Location, not RageUI.Visible(Location))
  
    while Location do
        Citizen.Wait(0)
        RageUI.IsVisible(Location, true, true, true, function()
  
            RageUI.ButtonWithStyle("Kosatka", nil, {RightLabel = "~r~5000000€"},true, function(Hovered, Active, Selected)
                if (Selected) then   
                    TriggerServerEvent('riri:locationkosatka',5000000)
                    RageUI.CloseAll()
                end
            end)

            RageUI.ButtonWithStyle("submersible", nil, {RightLabel = "~r~100000€"},true, function(Hovered, Active, Selected)
                if (Selected) then   
                    TriggerServerEvent('riri:locationsubmersible',100000)
                    RageUI.CloseAll()
                end
            end)
  
  end, function()
  end)
        if not RageUI.Visible(Location) then
            Location = RMenu:DeleteType("Location", true)
        end
    end
  end

local position = {
    {x = -92.02, y = -2773.7, z = 6.08}
    }    



Citizen.CreateThread(function()
    local hash = GetHashKey("s_m_m_gardener_01")
    while not HasModelLoaded(hash) do
    RequestModel(hash)
    Wait(20)
    end
    ped = CreatePed("PED_TYPE_CIVFEMALE", "s_m_m_gardener_01", -92.02, -2773.7, 5.08, 85.36, false, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
end)

Citizen.CreateThread(function()
    for k, v in pairs(position) do
        local blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(blip, 760)
        SetBlipScale (blip, 0.6)
        SetBlipColour(blip, 46)
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName('Location de ~y~Sous Marin~~')
        EndTextCommandSetBlipName(blip)
    end
end)    
    
 Citizen.CreateThread(function()
    while true do
        local sleep = 500
            for k in pairs(position) do
                local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
                local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)
                    if dist <= 1.0 then
                    sleep = 0
                    RageUI.Text({ message = "Appuyez sur ~y~[E]~s~ pour louer un sous Marin", time_display = 1 })
                    if IsControlJustPressed(1,51) then
                        OpenLocation()
                    end
                end
            end
        Citizen.Wait(sleep)
    end
end)

RegisterNetEvent('spawnCar')
AddEventHandler('spawnCar', function(car)  
    local car = GetHashKey(car)

    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end

    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, -78.92, -2811.41, 0.00, 0.0, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    local plaque = "Location"
    SetVehicleNumberPlateText(vehicle, plaque) 
    SetPedIntoVehicle(GetPlayerPed(-1),vehicle,-1)
end)


