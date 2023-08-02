
function InsertarTexto()
    DisplayOnscreenKeyboard(1, "", "", "", "", "", "", 99)
    while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do
        Citizen.Wait(100)
    end
    input = GetOnscreenKeyboardResult()
    TriggerServerEvent('advertisementsystem:pay', _source, input)
end