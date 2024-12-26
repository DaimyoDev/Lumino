local Lumino = {}
local LuminoHelpers = require(script.Parent.LuminoHelpers)

Lumino.Themes = {

}

Lumino.CurrentTheme = {}

function Lumino.addTheme(Theme)
    if not Theme then
        error("Please pass in a dictionary")
    end

    local themeKeyTypes = {
        Color = "Color3",
        Font = "table",
        Name = "string",
        DefaultBackgroundColor = "Color3",
        DefaultBackgroundColor2 = "Color3",
        DefaultTextColor = "Color3",
        DefaultFont = "table",
        TextScaled = "boolean"
    }

    local newTheme = {}



    local function addThemeItem(themeKey, themeValue)
        if string.match(themeKey, "Font") then
            if LuminoHelpers.checkFont(themeValue, themeKey) then
                newTheme[themeKey] = themeValue
            end
        end
        newTheme[themeKey] = themeValue
    end

    for themeKey, themeValue in Theme do
            for baseThemeItem, expectedType in themeKeyTypes do
                if string.match(themeKey, baseThemeItem) then
                    if typeof(themeValue) == expectedType then
                        addThemeItem(themeKey, themeValue)
                    end
                end
            end
        end
        if newTheme.Name then
            Lumino.Themes[newTheme.Name] = newTheme
        else
            error("When creating a theme you must have a name key!")
        end
end

function Lumino.setThemeUIComponent(themeName, UIComponent)

    local specificTheme = Lumino.Themes[themeName]

    if specificTheme then
        specificTheme[UIComponent.Name] = UIComponent
    end
end

function Lumino.applyCurrentTheme(playerGui)

    local trys = 0
    local screenGuis
    local hasScreens

    local function getPlayerGuiScreens()
        if trys > 5 then
            print(trys)
            return
        end
        screenGuis = playerGui:GetChildren()
        hasScreens = true
    end


    if #playerGui:GetChildren() <= 1 then
        task.wait(1)
        trys += 1
        getPlayerGuiScreens()
    end

    if hasScreens then
        for _index, screenGui in screenGuis do
            for _index, component in screenGui:GetChildren() do
                screenGui.IgnoreGuiInset = true
                LuminoHelpers.setComponent(component, Lumino.CurrentTheme)
            end
        end
    end
end



return Lumino