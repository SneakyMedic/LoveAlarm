local songBox = {
    position = {
        x = 1055,
        y = 620,
    },
    size = {
        w = 185,
        h = 60,
    },
    mode = "line",
}

songBox.text = {
    position = {
        x = songBox.position.x + 1,
        y = songBox.position.y + songBox.position.y/40,
    },
    size = songBox.size.w,
    align = "center",
    defaultText = "Set Alarm",
}
songBox.text.value = songBox.text.defaultText


return songBox