window = require("window")
local dialogBox = {
    mode = "fill",
    active = false,
}


dialogBox.position = {
    x = 0,
    y = 0,
}
dialogBox.size = {
    w = 400,
    h = 250,
}
dialogBox.position.default = {
    x = 440,
    y = 235,
}

dialogBox.text = {
    position = {
        x = dialogBox.position.x + 15,
        y = dialogBox.position.y + 64,
    },
    size = dialogBox.size.w - 31,
    align = "left",
    value = "Lorem"
}

dialogBox.title = {
    position = {
        x = dialogBox.position.x + 60,
        y = dialogBox.position.y + 10,
    },
    size = dialogBox.size.w - 76,
    align = "left",
    value = "Lorem ipsum alert!"
}

dialogBox.closebox = {
    position = {
        x = dialogBox.position.x + 5,
        y = dialogBox.position.y + 5,
    },
    size = {
        w = 41,
        h = 41,
    },
    mode = "fill"
}

function dialogBox.update()
    dialogBox.closebox.position.x = dialogBox.position.x + 5
    dialogBox.closebox.position.y = dialogBox.position.y + 5
    dialogBox.text.position.x = dialogBox.position.x + 15
    dialogBox.text.position.y = dialogBox.position.y + 64
    dialogBox.title.position.x = dialogBox.position.x + 60
    dialogBox.title.position.y = dialogBox.position.y + 10
end


return dialogBox