
ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('advertisementsystem:pay')
AddEventHandler('advertisementsystem:pay', function(_source, input)
	local _source = source
	local jugador = ESX.GetPlayerFromId(_source)

	if jugador.getMoney() >= Config.Price then
		jugador.removeMoney(Config.Price)

		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])	
			TriggerClientEvent('esx:showAdvancedNotification', xPlayer.source, Config.Language['title'], "", input, 'CHAR_LIFEINVADER', 0)				
		end
	else
		jugador.showNotification(Config.Language['notenoughmoney'])
	end
end)
