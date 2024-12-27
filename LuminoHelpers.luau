local LuminoHelpers = {}

function LuminoHelpers.checkFont(fontTable, fontKey)
    if fontTable["Font"] and fontTable["Size"] then
        if typeof(fontTable["Font"]) == "Font" and typeof(fontTable["Size"]) == "number" then
            return fontTable
        end
    else
        error(`A Font must have a table with a Font key and a Font value! {fontKey}`)
    end
    return
end

function LuminoHelpers.setComponent(component, CurrentTheme)
    local componentFunctions = {
        TextLabel = function()
            if CurrentTheme[tostring(component)] then
                component.BackgroundColor3 = CurrentTheme[tostring(component)].BackgroundColor or CurrentTheme.DefaultBackgroundColor
                component.TextColor3 = CurrentTheme[tostring(component)].TextColor or CurrentTheme.DefaultTextColor
                component.FontFace = (CurrentTheme[tostring(component)].SetFont and CurrentTheme[tostring(component)].SetFont.Font) or CurrentTheme.DefaultFont.Font
                component.TextSize = (CurrentTheme[tostring(component)].SetFont and CurrentTheme[tostring(component)].SetFont.Size) or CurrentTheme.DefaultFont.Size
                component.TextScaled = CurrentTheme[tostring(component)].TextScaled or CurrentTheme.TextScaled

            else
                component.BackgroundColor3 = CurrentTheme.DefaultBackgroundColor
                component.TextColor3 = CurrentTheme.DefaultTextColor
                component.FontFace = CurrentTheme.DefaultFont.Font
                component.TextSize = CurrentTheme.DefaultFont.Size
                component.TextScaled = CurrentTheme.TextScaled
            end
        end,
        TextButton = function()
            if CurrentTheme[tostring(component)] then
                component.BackgroundColor3 = CurrentTheme[tostring(component)].BackgroundColor or CurrentTheme.DefaultBackgroundColor
                component.TextColor3 = CurrentTheme[tostring(component)].TextColor or CurrentTheme.DefaultTextColor
                component.FontFace = (CurrentTheme[tostring(component)].SetFont and CurrentTheme[tostring(component)].SetFont.Font) or CurrentTheme.DefaultFont.Font
                component.TextSize = (CurrentTheme[tostring(component)].SetFont and CurrentTheme[tostring(component)].SetFont.Size) or CurrentTheme.DefaultFont.Size
                component.TextScaled = CurrentTheme[tostring(component)].TextScaled or CurrentTheme.TextScaled

            else
                component.BackgroundColor3 = CurrentTheme.DefaultBackgroundColor
                component.TextColor3 = CurrentTheme.DefaultTextColor
                component.FontFace = CurrentTheme.DefaultFont.Font
                component.TextSize = CurrentTheme.DefaultFont.Size
                component.TextScaled = CurrentTheme.TextScaled
            end
        end,
        Frame = function()
            if CurrentTheme[tostring(component)] then
                component.BackgroundColor3 = CurrentTheme[tostring(component)].BackgroundColor or CurrentTheme.DefaultBackgroundColor
            else
                component.BackgroundColor3 = CurrentTheme.DefaultBackgroundColor2 or CurrentTheme.DefaultBackgroundColor
            end
        end
    }

    if component:IsA("TextLabel") then
        componentFunctions["TextLabel"]()
    end
    if component:IsA("TextButton") then
        componentFunctions["TextButton"]()
    end
    if component:IsA("Frame") then
        componentFunctions["Frame"]()
    end
end

return LuminoHelpers