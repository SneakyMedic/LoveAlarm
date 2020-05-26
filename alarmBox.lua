local alarmBox = {
    mainbox = {
        position = {
            x = 140,
            y = 40,
        },
        size = {
            w = 1000,
            h = 100,
        },
        mode = "line",
    },
    minibox = {
        size = {
            w = 50,
            h = 50,
        }
    }
}

    alarmBox.miniboxA = {
        position = {
            x = alarmBox.mainbox.position.x + 25,
            y = alarmBox.mainbox.position.y + 25,
        },
        size = {
            w = alarmBox.minibox.size.w,
            h = alarmBox.minibox.size.h,
        },
        mode = "line",
        active = false,
    }
    alarmBox.miniboxA.text = {
        position = {
            x = alarmBox.miniboxA.position.x - 7,
            y = alarmBox.miniboxA.position.y - 21,
        },
        size = 63,
        align = "center",
        value = "Xperia",
    }
    function alarmBox.miniboxA.control()
        if alarmBox.miniboxA.active then
            alarmBox.miniboxA.mode = "fill"
        else
            alarmBox.miniboxA.mode = "line"
        end
    end

    alarmBox.miniboxB = {
        position = {
            x = alarmBox.mainbox.position.x + 25 + 100,
            y = alarmBox.mainbox.position.y + 25,
        },
        size = {
            w = alarmBox.minibox.size.w,
            h = alarmBox.minibox.size.h,
        },
        mode = "line",
        active = false,
    }
    alarmBox.miniboxB.text = {
        position = {
            x = alarmBox.miniboxB.position.x - 7,
            y = alarmBox.miniboxB.position.y - 21,
        },
        size = 63,
        align = "center",
        value = "Light",
    }
    function alarmBox.miniboxB.control()
        if alarmBox.miniboxB.active then
            alarmBox.miniboxB.mode = "fill"
        else
            alarmBox.miniboxB.mode = "line"
        end
    end


return alarmBox