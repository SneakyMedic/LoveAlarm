local timerBox = {
    position = {
        x = 80,
        y = 200,
    },
    size = 1125,
    align = "center",
    minutes = 0,
    hours = 0,
    seconds = 0,
}

function timerBox.update(xhours, xminutes, xseconds)
    timerBox.hours = xhours
    timerBox.minutes = xminutes
    timerBox.seconds = xseconds
    if timerBox.hours < 10 then
        timerBox.hours = "0" .. timerBox.hours
    end
    if timerBox.seconds < 10 then
        timerBox.seconds = "0" .. timerBox.seconds
    end
    if timerBox.minutes < 10 then
        timerBox.minutes = "0" .. timerBox.minutes
    end
    timerBox.value = timerBox.hours .. ":" .. timerBox.minutes .. ":".. timerBox.seconds
end

return timerBox