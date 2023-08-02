ESX = exports["es_extended"]:getSharedObject()

-- Tienda
CreateThread(function()
	while true do
		local sleep = 1000
		for k, v in pairs(Config.Advertisements.Locations) do
			local me = PlayerPedId()
			local heading = GetEntityHeading(me)

			if GetDistanceBetweenCoords(GetEntityCoords(me), v) <= 5 then

					sleep = 0

				if GetDistanceBetweenCoords(GetEntityCoords(me),v) <= 1.8 and not IsPedDeadOrDying(me, true) then
					if not IsPedInAnyVehicle(me, false) then

						ESX.ShowHelpNotification(Config.Language['helpnotification'])

						if IsControlJustReleased(0, 38) then
                            InsertarTexto()
                        end 

					end
				end
			end
		end
		Wait(sleep)
	end
end)

-- Blips
CreateThread(function()
	for i=1, #Config.Advertisements.Locations, 1 do
		local blip = AddBlipForCoord(Config.Advertisements.Locations[i])

		SetBlipSprite (blip, 459)
		SetBlipDisplay(blip, 4)
		SetBlipScale  (blip, 0.7)
		SetBlipColour (blip, 0)
		SetBlipAsShortRange(blip, true)
		BeginTextCommandSetBlipName("STRING")
		AddTextComponentSubstringPlayerName(Config.Language['blipname'])
		EndTextCommandSetBlipName(blip)
	end
end)
