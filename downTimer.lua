local downTimer = {
    hours = {
        textString = {
            position = {
                x = 40,
                y = 575,
            },
            size = 67,
            align = "center",
            value = "Hours:",
        },
        textInt = {
            position = {
                x = 116,
                y = 575,
            },
            size = 35,
            align = "center",
            value = 0,
        }
    },
    minutes = {
        textString = {
            position = {
                x = 40,
                y = 610,
            },
            size = 67,
            align = "center",
            value = "Mins:",
        },
        textInt = {
            position = {
                x = 116,
                y = 610,
            },
            size = 35,
            align = "center",
            value = 0,
        }
    },
    seconds = {
        textString = {
            position = {
                x = 40,
                y = 645,
            },
            size = 67,
            align = "center",
            value = "Secs:",
        },
        textInt = {
            position = {
                x = 116,
                y = 645,
            },
            size = 35,
            align = "center",
            value = 0,
        }
    }
}


function downTimer.hours.add()
    downTimer.hours.textInt.value = downTimer.hours.textInt.value + 1
    if downTimer.hours.textInt.value > 23 then
        downTimer.hours.textInt.value = 0
    end
end
function downTimer.hours.substract()
    downTimer.hours.textInt.value = downTimer.hours.textInt.value - 1
    if downTimer.hours.textInt.value < 0 then
        downTimer.hours.textInt.value = 23
    end
end

function downTimer.minutes.add()
    downTimer.minutes.textInt.value = downTimer.minutes.textInt.value + 1
    if downTimer.minutes.textInt.value > 59 then
        downTimer.minutes.textInt.value = 0
    end
end
function downTimer.minutes.substract()
    downTimer.minutes.textInt.value = downTimer.minutes.textInt.value - 1
    if downTimer.minutes.textInt.value < 0 then
        downTimer.minutes.textInt.value = 59
    end
end

function downTimer.seconds.add()
    downTimer.seconds.textInt.value = downTimer.seconds.textInt.value + 1
    if downTimer.seconds.textInt.value > 59 then
        downTimer.seconds.textInt.value = 0
    end
end
function downTimer.seconds.substract()
    downTimer.seconds.textInt.value = downTimer.seconds.textInt.value - 1
    if downTimer.seconds.textInt.value < 0 then
        downTimer.seconds.textInt.value = 59
    end
end


return downTimer