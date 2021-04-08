local addon = ...

local DB = ZergDB

local frame = CreateFrame("Frame", addon .. "ConfigFrame", InterfaceOptionsFramePanelContainer)
frame.name = addon
frame:Hide()
frame:SetScript("OnShow", function(frame)
    local s_width = CreateFrame("Slider", addon .. "ConfigFontSlider", frame, "OptionsSliderTemplate")
    s_width:SetPoint("TOPLEFT", 16, -16)
    s_width.text = _G[s_width:GetName() .. 'Text']
    s_width.text:SetText("")
    s_width:SetMinMaxValues(1, 1000)
    s_width:SetScript("OnValueChanged", function(self, value) 
        value = math.ceil(value)
        DB.hole.width = value 
        s_width.text:SetText(DB.hole.width)
    end)
    


    local Refresh;
    function Refresh()
        if not frame:IsVisible() then return end
        s_width:SetValue(DB.hole.width)
    end

    frame:SetScript("OnShow", Refresh) 
    Refresh()

    print("4")
    
end)

InterfaceOptions_AddCategory(frame)
