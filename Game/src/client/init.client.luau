local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
local Lumino = require(game.ReplicatedStorage.Shared.Lumino)

local newTheme = {
    BackgroundColor1 = Color3.new(1, 0, 0),
    myOtherFont = {
        Font = Font.fromName("FredokaOne"),
        Size = 10
    },
    Name = "newTheme",
    DefaultBackgroundColor = Color3.fromHex("#0C1618"),
    DefaultBackgroundColor2 = Color3.fromHex("#004643"),
    DefaultTextColor = Color3.fromHex("#FAF4D3"),
    DefaultFont = {
        Font = Font.fromName("Montserrat", Enum.FontWeight.Regular, Enum.FontStyle.Normal),
        Size = 15
    },
    TextScaled = true
}

Lumino.addTheme(newTheme)

Lumino.CurrentTheme = Lumino.Themes["newTheme"]

Lumino.applyCurrentTheme(playerGui)