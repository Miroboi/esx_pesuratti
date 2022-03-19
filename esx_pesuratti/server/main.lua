ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Make the kit usable!
ESX.RegisterUsableItem('pesuratti', function(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	
	if Config.AllowMecano then
		TriggerClientEvent('esx_pesuratti:onUse', _source)
	else
		if xPlayer.job.name ~= 'mecano' then
			TriggerClientEvent('esx_pesuratti:onUse', _source)
		end
	end
end)

RegisterNetEvent('esx_pesuratti:removeKit')
AddEventHandler('esx_pesuratti:removeKit', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if not Config.InfinitePuhdistukset then
		xPlayer.removeInventoryItem('pesuratti', 1)
		TriggerClientEvent('esx:showNotification', _source, _U('used_kit'))
	end
end)