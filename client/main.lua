local display = false

RegisterCommand('showui', function()
    display = not display
    SendNUIMessage({
        type = "setVisible",
        status = display
    })
end, false)

-- Handle NUI callback to close UI
RegisterNUICallback('close', function(data, cb)
    display = false
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('requestFocus', function(data, cb)
    if display then
        SetNuiFocus(true, true)
    end
    cb({})
end)

RegisterNUICallback('releaseFocus', function(data, cb)
    SetNuiFocus(false, false)
    cb({})
end)
