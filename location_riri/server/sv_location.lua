ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('riri:locationkosatka')
AddEventHandler('riri:locationkosatka', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
	local playerMoney = xPlayer.getAccount('bank').money
    local car = "kosatka"
    if playerMoney >= prix then
    xPlayer.removeAccountMoney('bank', prix)
    TriggerClientEvent('spawnCar',source,car)
	TriggerClientEvent('esx:showNotification', source, "Vous avez bien reçu votre véhicule ~s~! ")
    else
        TriggerClientEvent('esx:showNotification', source, "Vous n\'avez assez ~r~d\'argent")
    end
end)

RegisterNetEvent('riri:locationsubmersible')
AddEventHandler('riri:locationsubmersible', function(prix)
	local xPlayer = ESX.GetPlayerFromId(source)
		local playerMoney = xPlayer.getAccount('bank').money
    local car = "submersible"
    if playerMoney >= prix then
	xPlayer.removeAccountMoney('bank', prix)
    TriggerClientEvent('spawnCar',source,car)
	TriggerClientEvent('esx:showNotification', source, "Vous avez bien reçu votre véhicule ~s~! ")
    else
        TriggerClientEvent('esx:showNotification', source, "Vous n\'avez assez ~r~d\'argent")
    end
end)



