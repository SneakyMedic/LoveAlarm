function love.load()
    font = require("font")
    window = require("window")
    love.window.setMode(window.size.w, window.size.h, {fullscreen = window.fullscreen})
    love.window.setTitle(window.title)
    songBox = require("songBox")
    timerBox = require("timerBox")
    alarmBox = require("alarmBox")
    downTimer = require("downTimer")
    dialogBox = require("dialogBox")
    audio = require("audio")
    holding = true
    set = false
    looper = false
end

function love.update(dt)
    osTime = os.date("*t")
    timerBox.update(osTime.hour, osTime.min, osTime.sec)
    alarmBox.miniboxA.control()
    alarmBox.miniboxB.control()
    dialogBox.update()
    windowMove()
    if set then
        Alarm()
    end
    if looper then
        if alarmBox.miniboxB.active then
            audio.light:play()
        end
        if alarmBox.miniboxA.active then
            audio.xperia:play()
        end
    end
end

function love.draw()
    love.graphics.setColor(1,1,1)
    --songBox
    love.graphics.setFont(font.default)
        love.graphics.rectangle(songBox.mode, songBox.position.x, songBox.position.y, songBox.size.w, songBox.size.h)
        love.graphics.printf(songBox.text.value, songBox.text.position.x, songBox.text.position.y, songBox.text.size, songBox.text.align)

    --timerBox
    love.graphics.setFont(font.timer)
        love.graphics.printf(timerBox.value, timerBox.position.x, timerBox.position.y, timerBox.size, timerBox.align)

    --alarmBox
        love.graphics.rectangle(alarmBox.mainbox.mode, alarmBox.mainbox.position.x, alarmBox.mainbox.position.y, alarmBox.mainbox.size.w, alarmBox.mainbox.size.h)
        --miniboxes
            --miniboxA
            love.graphics.rectangle(alarmBox.miniboxA.mode, alarmBox.miniboxA.position.x, alarmBox.miniboxA.position.y, alarmBox.miniboxA.size.w, alarmBox.miniboxA.size.h)
            love.graphics.setFont(font.alarmName)
            love.graphics.printf(alarmBox.miniboxA.text.value, alarmBox.miniboxA.text.position.x, alarmBox.miniboxA.text.position.y, alarmBox.miniboxA.text.size, alarmBox.miniboxA.text.align)
            --miniboxB
            love.graphics.rectangle(alarmBox.miniboxB.mode, alarmBox.miniboxB.position.x, alarmBox.miniboxB.position.y, alarmBox.miniboxB.size.w, alarmBox.miniboxB.size.h)
            love.graphics.printf(alarmBox.miniboxB.text.value, alarmBox.miniboxB.text.position.x, alarmBox.miniboxB.text.position.y, alarmBox.miniboxB.text.size, alarmBox.miniboxB.text.align)

    --downTimer
    love.graphics.setFont(font.default)
        --strings
            love.graphics.printf(downTimer.hours.textString.value, downTimer.hours.textString.position.x, downTimer.hours.textString.position.y, downTimer.hours.textString.size, downTimer.hours.textString.align)
            love.graphics.printf(downTimer.minutes.textString.value, downTimer.minutes.textString.position.x, downTimer.minutes.textString.position.y, downTimer.minutes.textString.size, downTimer.minutes.textString.align)
            love.graphics.printf(downTimer.seconds.textString.value, downTimer.seconds.textString.position.x, downTimer.seconds.textString.position.y, downTimer.seconds.textString.size, downTimer.seconds.textString.align)
        --ints
            love.graphics.printf(downTimer.hours.textInt.value, downTimer.hours.textInt.position.x, downTimer.hours.textInt.position.y, downTimer.hours.textInt.size, downTimer.hours.textInt.align)
            love.graphics.printf(downTimer.minutes.textInt.value, downTimer.minutes.textInt.position.x, downTimer.minutes.textInt.position.y, downTimer.minutes.textInt.size, downTimer.minutes.textInt.align)
            love.graphics.printf(downTimer.seconds.textInt.value, downTimer.seconds.textInt.position.x, downTimer.seconds.textInt.position.y, downTimer.seconds.textInt.size, downTimer.seconds.textInt.align)
    --setAlarm
        if dialogBox.active then
            dialogBox.position.x = dialogBox.position.default.x
            dialogBox.position.y = dialogBox.position.default.y
            love.graphics.setColor(0.1,0.1,0.1)
            love.graphics.rectangle(dialogBox.mode, dialogBox.position.x, dialogBox.position.y, dialogBox.size.w, dialogBox.size.h)
            love.graphics.setColor(1,0,0)
            love.graphics.rectangle(dialogBox.closebox.mode, dialogBox.closebox.position.x, dialogBox.closebox.position.y, dialogBox.closebox.size.w, dialogBox.closebox.size.h)
            love.graphics.setColor(1,1,1)
            love.graphics.printf("X", dialogBox.closebox.position.x, dialogBox.closebox.position.y+5, dialogBox.closebox.size.w, "center")
            love.graphics.printf(dialogBox.title.value, dialogBox.title.position.x, dialogBox.title.position.y, dialogBox.title.size, dialogBox.title.align)
            love.graphics.printf(dialogBox.text.value, dialogBox.text.position.x, dialogBox.text.position.y, dialogBox.text.size, dialogBox.text.align)
        end
end

function love.mousepressed(x, y, button)
    --xperia
    if hasBeenClickedInArea( alarmBox.miniboxA.position.x, alarmBox.miniboxA.position.x+alarmBox.miniboxA.size.w, alarmBox.miniboxA.position.y, alarmBox.miniboxA.position.y+alarmBox.miniboxA.size.h, x, y ) then
        if alarmBox.miniboxA.active then
            alarmBox.miniboxA.active = false
        else
            alarmBox.miniboxA.active = true
            alarmBox.miniboxB.active = false
        end
    end
    --light
    if hasBeenClickedInArea( alarmBox.miniboxB.position.x, alarmBox.miniboxB.position.x+alarmBox.miniboxB.size.w, alarmBox.miniboxB.position.y, alarmBox.miniboxB.position.y+alarmBox.miniboxB.size.h, x, y ) then
        if alarmBox.miniboxB.active then
            alarmBox.miniboxB.active = false
        else
            alarmBox.miniboxB.active = true
            alarmBox.miniboxA.active = false
        end
    end
    --hours
    if hasBeenClickedInArea(downTimer.hours.textInt.position.x, downTimer.hours.textInt.position.x+downTimer.hours.textInt.size, downTimer.hours.textInt.position.y, downTimer.hours.textInt.position.y+font.sizeD, x, y) then
        if button == 1 then
            downTimer.hours.add()
        else
            downTimer.hours.substract()
        end
    end
    --minutes
    if hasBeenClickedInArea(downTimer.minutes.textInt.position.x, downTimer.minutes.textInt.position.x+downTimer.minutes.textInt.size, downTimer.minutes.textInt.position.y, downTimer.minutes.textInt.position.y+font.sizeD, x, y) then
        if button == 1 then
            downTimer.minutes.add()
        else
            downTimer.minutes.substract()
        end
    end
    --seconds
    if hasBeenClickedInArea(downTimer.seconds.textInt.position.x, downTimer.seconds.textInt.position.x+downTimer.seconds.textInt.size, downTimer.seconds.textInt.position.y, downTimer.seconds.textInt.position.y+font.sizeD, x, y) then
        if button == 1 then
            downTimer.seconds.add()
        else
            downTimer.seconds.substract()
        end
    end
    --setAlarm
    if hasBeenClickedInArea(songBox.position.x, songBox.position.x+songBox.size.w, songBox.position.y, songBox.position.y+songBox.size.h, x, y) then
        if alarmBox.miniboxA.active == false and alarmBox.miniboxB == false then
            dialogBox.active = true
            dialogBox.title.value = window.title
            dialogBox.text.value = "No song selected!"
        else
            dialogBox.active = true
            dialogBox.title.value = window.title
            ahour = downTimer.hours.textInt.value - tonumber(osTime.hour)
            amin = downTimer.minutes.textInt.value - tonumber(osTime.min)
            asec = downTimer.seconds.textInt.value - tonumber(osTime.sec)
            if tonumber(osTime.min) > 0 and ahour > 0 then
                ahour = ahour - 1
                amin = 60 - tonumber(osTime.min)
            end
            if tonumber(osTime.sec) > 0 and amin > 0 then
                amin = amin - 1
                asec = 60 - tonumber(osTime.sec)
            end
            if ahour < 0 then
                ahour = 0
            end
            if amin < 0 then
                amin = 0
            end
            if asec < 0 then
                asec = 0
            end
            dialogBox.text.value = "Alarm has been set for " .. ahour .. " hours " .. amin .. " minutes and " .. asec .. " seconds!"
            set = true
        end
    end
    --dialogBox
        --closebox
        if hasBeenClickedInArea(dialogBox.closebox.position.x, dialogBox.closebox.position.x+dialogBox.closebox.size.w, dialogBox.closebox.position.y, dialogBox.closebox.position.y+dialogBox.closebox.size.h, x, y) then
            dialogBox.active = false
        end
end

function love.mousereleased()
    holding = false
end

function windowMove()
    if holding then
        dialogBox.position.x = love.mouse.getX()
        dialogBox.position.y = love.mouse.getY()
    end
end

function hasBeenClickedInArea(ax1, ax2, ay1, ay2, x, y)
    if x <= ax2 and x >= ax1 and y <= ay2 and y >= ay1 then
        return true
    else
        return false
    end
end

function Alarm()
    if tonumber(osTime.hour) == downTimer.hours.textInt.value and tonumber(osTime.min) == downTimer.minutes.textInt.value and tonumber(osTime.sec) == downTimer.seconds.textInt.value then
        if alarmBox.miniboxA.active then
            audio.xperia:play()
        elseif alarmBox.miniboxB.active then
            audio.light:play()
        end
        looper = true
        dialogBox.active = true
        dialogBox.title.value = window.title
        dialogBox.text.value = "Alarm!"
    end
    if not dialogBox.active then
        audio.xperia:stop()
        audio.light:stop()
        looper = false
    end
end