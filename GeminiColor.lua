-----------------------------------------------------------------------------------------------
-- Client Lua Script for GeminiColor
-- Copyright (c) NCsoft. All rights reserved
-----------------------------------------------------------------------------------------------
 
local MAJOR, MINOR = "GeminiColor", 1
-- Get a reference to the package information if any
local APkg = Apollo.GetPackage(MAJOR)
-- If there was an older version loaded we need to see if this is newer
if APkg and (APkg.nVersion or 0) >= MINOR then
	return -- no upgrade needed
end

require "Window"
 
-----------------------------------------------------------------------------------------------
-- GeminiColor Module Definition
-----------------------------------------------------------------------------------------------
 local GeminiColor = APkg or {}
-----------------------------------------------------------------------------------------------
-- Constants
-----------------------------------------------------------------------------------------------

local ktColors = {
	{ colorName = "IndianRed", strColor = "CD5C5C"}, { colorName = "LightCoral", strColor = "F08080"}, { colorName = "Salmon", strColor = "FA8072"},
	{ colorName = "DarkSalmon", strColor = "E9967A"}, { colorName = "Red", strColor = "FF0000"}, { colorName = "Crimson", strColor = "DC143C"},
	{ colorName = "FireBrick", strColor = "B22222"}, { colorName = "DarkRed", strColor = "8B0000"}, { colorName = "Pink", strColor = "FFC0CB"},
	{ colorName = "LightPink", strColor = "FFB6C1"}, { colorName = "HotPink", strColor = "FF69B4"}, { colorName = "DeepPink", strColor = "FF1493"},
	{ colorName = "MediumVioletRed", strColor = "C71585"}, { colorName = "PaleVioletRed", strColor = "DB7093"}, { colorName = "LightSalmon", strColor = "FFA07A"},
	{ colorName = "Coral", strColor = "FF7F50"}, { colorName = "Tomato", strColor = "FF6347"}, { colorName = "OrangeRed", strColor = "FF4500"},
	{ colorName = "DarkOrange", strColor = "FF8C00"}, { colorName = "Orange", strColor = "FFA500"}, { colorName = "Gold", strColor = "FFD700"},
	{ colorName = "Yellow", strColor = "FFFF00"}, { colorName = "LightYellow", strColor = "FFFFE0"}, { colorName = "LemonChiffon", strColor = "FFFACD"},
	{ colorName = "LightGoldenrodYellow", strColor = "FAFAD2"}, { colorName = "PapayaWhip", strColor = "FFEFD5"}, { colorName = "Moccasin", strColor = "FFE4B5"},
	{ colorName = "PeachPuff", strColor = "FFDAB9"}, { colorName = "PaleGoldenrod", strColor = "EEE8AA"}, { colorName = "Khaki", strColor = "F0E68C"},
	{ colorName = "DarkKhaki", strColor = "BDB76B"}, { colorName = "Lavender", strColor = "E6E6FA"}, { colorName = "Thistle", strColor = "D8BFD8"},
	{ colorName = "Plum", strColor = "DDA0DD"}, { colorName = "Violet", strColor = "EE82EE"}, { colorName = "Orchid", strColor = "DA70D6"},
	{ colorName = "Magenta", strColor = "FF00FF"}, { colorName = "MediumOrchid", strColor = "BA55D3"}, { colorName = "MediumPurple", strColor = "9370DB"},
	{ colorName = "BlueViolet", strColor = "8A2BE2"}, { colorName = "DarkViolet", strColor = "9400D3"}, { colorName = "DarkOrchid", strColor = "9932CC"},
	{ colorName = "DarkMagenta", strColor = "8B008B"}, { colorName = "Purple", strColor = "800080"}, { colorName = "Indigo", strColor = "4B0082"},
	{ colorName = "DarkSlateBlue", strColor = "483D8B"}, { colorName = "SlateBlue", strColor = "6A5ACD"}, { colorName = "MediumSlateBlue", strColor = "7B68EE"},
	{ colorName = "GreenYellow", strColor = "ADFF2F"}, { colorName = "Chartreuse", strColor = "7FFF00"}, { colorName = "LawnGreen", strColor = "7CFC00"},
	{ colorName = "Lime", strColor = "00FF00"}, { colorName = "LimeGreen", strColor = "32CD32"}, { colorName = "PaleGreen", strColor = "98FB98"},
	{ colorName = "LightGreen", strColor = "90EE90"}, { colorName = "MediumSpringGreen", strColor = "00FA9A"}, { colorName = "SpringGreen", strColor = "00FF7F"},
	{ colorName = "MediumSeaGreen", strColor = "3CB371"}, { colorName = "SeaGreen", strColor = "2E8B57"}, { colorName = "ForestGreen", strColor = "228B22"},
	{ colorName = "Green", strColor = "008000"}, { colorName = "DarkGreen", strColor = "006400"}, { colorName = "YellowGreen", strColor = "9ACD32"},
	{ colorName = "OliveDrab", strColor = "6B8E23"}, { colorName = "Olive", strColor = "808000"}, { colorName = "DarkOliveGreen", strColor = "556B2F"},
	{ colorName = "MediumAquamarine", strColor = "66CDAA"}, { colorName = "DarkSeaGreen", strColor = "8FBC8F"}, { colorName = "LightSeaGreen", strColor = "20B2AA"},
	{ colorName = "DarkCyan", strColor = "008B8B"}, { colorName = "Teal", strColor = "008080"}, { colorName = "Cyan", strColor = "00FFFF"},
	{ colorName = "LightCyan", strColor = "E0FFFF"}, { colorName = "PaleTurquoise", strColor = "AFEEEE"}, { colorName = "Aquamarine", strColor = "7FFFD4"},
	{ colorName = "Turquoise", strColor = "40E0D0"}, { colorName = "MediumTurquoise", strColor = "48D1CC"}, { colorName = "DarkTurquoise", strColor = "00CED1"},
	{ colorName = "CadetBlue", strColor = "5F9EA0"}, { colorName = "SteelBlue", strColor = "4682B4"}, { colorName = "LightSteelBlue", strColor = "B0C4DE"},
	{ colorName = "PowderBlue", strColor = "B0E0E6"}, { colorName = "LightBlue", strColor = "ADD8E6"}, { colorName = "SkyBlue", strColor = "87CEEB"},
	{ colorName = "LightSkyBlue", strColor = "87CEFA"}, { colorName = "DeepSkyBlue", strColor = "00BFFF"}, { colorName = "DodgerBlue", strColor = "1E90FF"},
	{ colorName = "CornflowerBlue", strColor = "6495ED"}, { colorName = "RoyalBlue", strColor = "4169E1"}, { colorName = "Blue", strColor = "0000FF"},
	{ colorName = "MediumBlue", strColor = "0000CD"}, { colorName = "DarkBlue", strColor = "00008B"}, { colorName = "Navy", strColor = "000080"},
	{ colorName = "MidnightBlue", strColor = "191970"}, { colorName = "Cornsilk", strColor = "FFF8DC"}, { colorName = "BlanchedAlmond", strColor = "FFEBCD"},
	{ colorName = "Bisque", strColor = "FFE4C4"}, { colorName = "NavajoWhite", strColor = "FFDEAD"}, { colorName = "Wheat", strColor = "F5DEB3"},
	{ colorName = "BurlyWood", strColor = "DEB887"}, { colorName = "Tan", strColor = "D2B48C"}, { colorName = "RosyBrown", strColor = "BC8F8F"},
	{ colorName = "SandyBrown", strColor = "F4A460"}, { colorName = "Goldenrod", strColor = "DAA520"}, { colorName = "DarkGoldenrod", strColor = "B8860B"},
	{ colorName = "Peru", strColor = "CD853F"}, { colorName = "Chocolate", strColor = "D2691E"}, { colorName = "SaddleBrown", strColor = "8B4513"},
	{ colorName = "Sienna", strColor = "A0522D"}, { colorName = "Brown", strColor = "A52A2A"}, { colorName = "Maroon", strColor = "800000"},
	{ colorName = "White", strColor = "FFFFFF"}, { colorName = "Snow", strColor = "FFFAFA"}, { colorName = "Honeydew", strColor = "F0FFF0"},
	{ colorName = "MintCream", strColor = "F5FFFA"}, { colorName = "Azure", strColor = "F0FFFF"}, { colorName = "AliceBlue", strColor = "F0F8FF"},
	{ colorName = "GhostWhite", strColor = "F8F8FF"}, { colorName = "WhiteSmoke", strColor = "F5F5F5"}, { colorName = "Seashell", strColor = "FFF5EE"},
	{ colorName = "Beige", strColor = "F5F5DC"}, { colorName = "OldLace", strColor = "FDF5E6"}, { colorName = "FloralWhite", strColor = "FFFAF0"},
	{ colorName = "Ivory", strColor = "FFFFF0"}, { colorName = "AntiqueWhite", strColor = "FAEBD7"}, { colorName = "Linen", strColor = "FAF0E6"},
	{ colorName = "LavenderBlush", strColor = "FFF0F5"}, { colorName = "MistyRose", strColor = "FFE4E1"}, { colorName = "Gainsboro", strColor = "DCDCDC"},
	{ colorName = "LightGrey", strColor = "D3D3D3"}, { colorName = "Silver", strColor = "C0C0C0"}, { colorName = "DarkGray", strColor = "A9A9A9"},
	{ colorName = "Gray", strColor = "808080"}, { colorName = "DimGray", strColor = "696969"}, { colorName = "LightSlateGray", strColor = "778899"},
	{ colorName = "SlateGray", strColor = "708090"}, { colorName = "DarkSlateGray", strColor = "2F4F4F"}, { colorName = "Black", strColor = "000000"},
}
 
-----------------------------------------------------------------------------------------------
-- GeminiColor OnLoad
-----------------------------------------------------------------------------------------------

function GeminiColor:OnLoad()
	local folder = Apollo.GetAssetFolder()
	self.xmlDoc = XmlDoc.CreateFromFile("GeminiColor\\GeminiColor.xml")
	self.xmlDoc:RegisterCallback("OnDocLoaded", self)
end

function GeminiColor:OnDocLoaded()

end

-----------------------------------------------------------------------------------------------
-- GeminiColor Functions
-----------------------------------------------------------------------------------------------
-- Define general functions here

function GeminiColor:CreateColorPicker(owner, callback, bCustomColor, strInitialColor, ...)
	local wndChooser = Apollo.LoadForm(self.xmlDoc, "GeminiChooserForm", nil, self)
	
	Apollo.LoadSprites("GeminiColor\\GeminiColorSprites.xml")
	
	local wndPicker = wndChooser:FindChild("wnd_ColorPicker")
	local wndSatVal = wndPicker:FindChild("wnd_WidgetContainer:wnd_SatValue")
	wndSatVal:SetSprite("GeminiColorSprites:SL")
	wndSatVal:FindChild("wnd_Overlay"):SetSprite("GeminiColorSprites:SLOverlay")
	
	local wndHue = wndPicker:FindChild("wnd_WidgetContainer:wnd_Hue:SliderBar")
	wndPicker:FindChild("wnd_WidgetContainer:wnd_Hue"):SetSprite("GeminiColorSprites:H")
	wndPicker:Show(false)
	
	local wndDD = wndChooser:FindChild("ddList_PresetColors:wnd_ColorDD")
	for i, v in pairs(ktColors) do
		local wndCurrColor = Apollo.LoadForm(self.xmlDoc,"ColorListItemForm",wndDD,self)
		wndCurrColor:SetText(v.colorName)
		wndCurrColor:SetTextColor(ApolloColor.new("ff"..v.strColor))
	end
	wndDD:ArrangeChildrenVert()
	wndDD:Show(false)	
		
	wndChooser:FindChild("btn_CustomColor"):Show(bCustomColor or false)

	if type(strInitialColor) == "string" then
		wndChooser:FindChild("wnd_ColorSwatch_Current"):SetBGColor(strInitialColor)
	else
		wndChooser:FindChild("wnd_ColorSwatch_Current"):SetBGColor("ffffffff")
		wndChooser:FindChild("wnd_ColorSwatch_Previous"):SetBGColor("ff000000")
	end	
	
	wndChooser:SetData({
		owner = owner,
		callback = callback,
		bCustomColor = bCustomColor,
		strInitialColor = strInitialColor,
		args = arg				
	})
	
	return wndChooser		
end



function GeminiColor:OnGCOn()
	self:ShowColorPicker({Test = function(self, strColor) Print(strColor) end}, "Test", true)
end

function GeminiColor:ShowColorPicker(owner, callback, bCustomColor, strInitialColor, ...)

	local chooser = self:CreateColorPicker(owner, callback, bCustomColor, strInitialColor, unpack(arg))
	chooser:AddEventHandler("WindowHide", "OnColorChooserHide", self)

	chooser:Show(true)
	chooser:ToFront()
end

function GeminiColor:OnColorChooserHide(wndHandler, wndControl) 
	if wndHandler ~= wndControl then
		return
	end
	wndControl:Destroy()
end

function GeminiColor:GetColorList()
	-- returns a table containing sub entries for all X11 colors.
	-- colorName, strColor
	return ktColors
end

function GeminiColor:RGBAPercToHex(r, g, b, a)
	-- Returns a hexadecimal string for the RGBA values passed.
	if not(a) then a = 1 end
	r = r <= 1 and r >= 0 and r or 0
	g = g <= 1 and g >= 0 and g or 0
	b = b <= 1 and b >= 0 and b or 0
	a = a <= 1 and a >= 0 and a or 1
	-- retunr hex string
	return string.format("%02x%02x%02x%02x",a*255 ,r*255, g*255, b*255)
end

function GeminiColor:HexToRGBAPerc(hex)
	-- Returns RGBA values for the a hexadecimal string passed.
	if string.len(hex) == 6 then
		local rhex, ghex, bhex = string.sub(hex, 1,2), string.sub(hex, 3, 4), string.sub(hex, 5, 6)
		-- return R,G,B number list
		return tonumber(rhex, 16)/255, tonumber(ghex, 16)/255, tonumber(bhex, 16)/255, 1
	else
		local ahex, rhex, ghex, bhex = string.sub(hex, 1,2), string.sub(hex, 3, 4), string.sub(hex, 5, 6), string.sub(hex, 7, 8)
		-- return R, G, B, A number list
		return tonumber(rhex, 16)/255, tonumber(ghex, 16)/255, tonumber(bhex, 16)/255, tonumber(ahex, 16)/255
	end
end

function GeminiColor:RGBpercToRGB(r,g,b,a)
	--Converts 0 - 1 RGB to 0 - 255 RGB
	return r * 255, g * 255, b * 255, a * 255
end

function GeminiColor:RGBtoRGBperc(r,g,b,a)
	--Converts 0 - 255 RGB to 0 - 1 RGB
	return r / 255, g / 255, b / 255, a / 255
end
-----------------------------------------------------------------------------------------------
-- Color Utility Functions
-- Adapted From https://github.com/EmmanuelOga/columns/blob/master/utils/color.lua
-----------------------------------------------------------------------------------------------

function GeminiColor:RGBtoHSL(r, g, b, a)
	--[[
	 * Converts an RGB color value to HSL. Conversion formula
	 * adapted from http://en.wikipedia.org/wiki/HSL_color_space.
	 * Assumes r, g, and b are contained in the set [0, 255] and
	 * returns h, s, and l in the set [0, 1].
	 *
	 * @param   Number  r       The red color value
	 * @param   Number  g       The green color value
	 * @param   Number  b       The blue color value
	 * @return  Array           The HSL representation
	]]

	r, g, b = r / 255, g / 255, b / 255

	local max, min = math.max(r, g, b), math.min(r, g, b)
	local h, s, l

	l = (max + min) / 2

	if max == min then
		h, s = 0, 0 -- achromatic
	else
		local d = max - min
		local s
		if l > 0.5 then s = d / (2 - max - min) else s = d / (max + min) end
			if max == r then
			h = (g - b) / d
				if g < b then h = h + 6 end
			elseif max == g then h = (b - r) / d + 2
			elseif max == b then h = (r - g) / d + 4
		end
		h = h / 6
	end

	return h, s, l, a or 255
end

function GeminiColor:HSLtoRGB(h, s, l, a)
	--[[
	 * Converts an HSL color value to RGB. Conversion formula
	 * adapted from http://en.wikipedia.org/wiki/HSL_color_space.
	 * Assumes h, s, and l are contained in the set [0, 1] and
	 * returns r, g, and b in the set [0, 255].
	 *
	 * @param   Number  h       The hue
	 * @param   Number  s       The saturation
	 * @param   Number  l       The lightness
	 * @return  Array           The RGB representation
	]]
	local r, g, b

	if s == 0 then
		r, g, b = l, l, l -- achromatic
	else
		function hue2rgb(p, q, t)
			if t < 0   then t = t + 1 end
			if t > 1   then t = t - 1 end
			if t < 1/6 then return p + (q - p) * 6 * t end
			if t < 1/2 then return q end
			if t < 2/3 then return p + (q - p) * (2/3 - t) * 6 end
			return p
		end
		local q
		if l < 0.5 then q = l * (1 + s) else q = l + s - l * s end
		local p = 2 * l - q
		r = hue2rgb(p, q, h + 1/3)
		g = hue2rgb(p, q, h)
		b = hue2rgb(p, q, h - 1/3)
	end
	-- Modified to produce Decimal RGB values
	return r , g , b , a 
end

function GeminiColor:GetColorStringByName(strColorName)
	for i, color in pairs(ktColors) do
		if color.colorName == strColorName then
			return color.strColor
		end
	end
end

---------------------------------------------------------------------------------------------------
-- GeminiChooserForm Functions
---------------------------------------------------------------------------------------------------
function GeminiColor:OnOK(wndHandler, wndControl, eMouseButton)
	local chooser = wndControl:GetParent()
			
	local data = chooser:GetData()
		
	local owner = data.owner
	local callback
	
	if type(data.callback) == "function" then
		callback = data.callback
	else
		callback = owner[data.callback] 
	end			
		
	local strColor = self:GetCurrentColor(chooser)
	
	if data.args ~= nil then
		callback(owner, strColor, unpack(data.args))
	else
		callback(owner, strColor)	
	end
	
	chooser:Show(false) -- hide the window
end

function GeminiColor:OnCancel(wndHandler, wndControl, eMouseButton )
	wndControl:GetParent():Show(false) -- hide the window
end

function GeminiColor:OnPickerShow(wndHandler, wndControl)
	local chooser = wndControl:GetParent()
	local data = chooser:GetData()
	
	local wndPicker = chooser:FindChild("wnd_ColorPicker")

	wndPicker:Show(wndControl:IsChecked())
	if data.bCustomColorCommit == true then
		local clrOld = chooser:FindChild("wnd_ColorSwatch_Current"):GetBGColor():ToTable()
		local strColor = self:RGBAPercToHex(clrOld.r, clrOld.g, clrOld.b)
		
		chooser:FindChild("wnd_ColorSwatch_Previous"):SetBGColor(clrOld)
		data.bCustomColorCommit = false
		chooser:SetData(data)		-- TODO: necessary ???
	end
end

function GeminiColor:SetPrevCustomColor(wndHandler, wndControl)
	local chooser = wndControl:GetParent()
	local data = chooser:GetData()	
	data.bCustomColorCommit = true	
	chooser:SetData(data)			-- TODO: necessary ???
end

function GeminiColor:OnColorClick(wndHandler, wndControl) -- choose from DD list
	local strColorName = wndControl:GetText()
	local strColorCode = self:GetColorStringByName(strColorName)
	strColorCode = "FF"..strColorCode
	
	local chooser = wndControl:GetParent():GetParent():GetParent()		-- parent path: button -> wnd_ColorDD -> ddList_PresetColors -> GeminiChooserForm
	
	local wndDDFrame = chooser:FindChild("ddList_PresetColors")
	wndDDFrame:SetText(strColorName)
	wndDDFrame:SetTextColor(strColorCode)
	local clrOld = chooser:FindChild("wnd_ColorSwatch_Current"):GetBGColor():ToTable()
	local strColor = self:RGBAPercToHex(clrOld.r, clrOld.g, clrOld.b)
	
	chooser:FindChild("wnd_ColorSwatch_Current"):SetBGColor(strColorCode)
	chooser:FindChild("wnd_ColorSwatch_Previous"):SetBGColor(clrOld)
	wndControl:GetParent():Show(false)
end

function GeminiColor:OnColorDD(wndHandler, wndControl) -- Show DD List
	local wndDD = wndControl:GetParent():FindChild("wnd_ColorDD")
	wndDD:Show(not wndDD:IsShown())
end

function GeminiColor:SetRGB(R,G,B, chooser) -- update teh RGB boxes in the color picker
	chooser:FindChild("input_Red"):SetText(R)
	chooser:FindChild("input_Green"):SetText(G)
	chooser:FindChild("input_Blue"):SetText(B)
end

function GeminiColor:UndoColorChange(wndHandler, wndControl, eMouseButton )
	local chooser = wndControl:GetParent()

	local clrOld = chooser:FindChild("wnd_ColorSwatch_Previous"):GetBGColor():ToTable()
	local strColor = self:RGBAPercToHex(clrOld.r, clrOld.g, clrOld.b)
	chooser:FindChild("wnd_ColorSwatch_Current"):SetBGColor("FF"..strColor)
	
	local r, g, b = self:HexToRGBAPerc(strColor)
	self:SetRGB(r, g, b, chooser )
end

function GeminiColor:GetCurrentColor(chooser) 
	local colorCurrent = chooser:FindChild("wnd_ColorSwatch_Current"):GetBGColor():ToTable()
	strCurrentColor = self:RGBAPercToHex(colorCurrent.r, colorCurrent.g, colorCurrent.b)
	return strCurrentColor
end

function GeminiColor:UpdateHSL(chooser)
	local wndSatVal = chooser:FindChild("wnd_SatValue")

	--Saturation and Lightness
	local fLightness, fSaturation = wndSatVal:FindChild("wnd_Loc"):GetAnchorOffsets()
	
	local nLConstant = wndSatVal:GetWidth()
	local nSConstant = wndSatVal:GetHeight()
	fLightness = 1 - ((fLightness + 10) / nLConstant)
	fSaturation = 1- ((fSaturation + 10) / nSConstant)
	
	if fLightness > 1 then fLightness = 1 elseif fLightness < 0 then fLightness = 0 end
	if fSaturation > 1 then fSaturation = 1 elseif fSaturation < 0 then fSaturation = 0 end

	-- Hue
	local fHue = math.floor(chooser:FindChild("SliderBar"):GetValue()) / 100	
	
	local clrOverlay = self:RGBAPercToHex(self:HSLtoRGB(fHue, 0.5, 0.5))
	wndSatVal:FindChild("wnd_Overlay"):SetBGColor("FF"..clrOverlay)
	
	
	-- Update Colors
	local clrNew = self:RGBAPercToHex(self:HSLtoRGB(fHue, fSaturation, fLightness))
	
	chooser:FindChild("wnd_ColorSwatch_Current"):SetBGColor("FF"..clrNew)
	
	local r,g,b = self:HSLtoRGB(fHue, fSaturation, fLightness)
		
	self:SetRGB(r, g, b, chooser)
	
end

function GeminiColor:SatLightClick( wndHandler, wndControl, eMouseButton, nLastRelativeMouseX, nLastRelativeMouseY, bDoubleClick, bStopPropagation )
	wndControl:FindChild("wnd_Loc"):SetAnchorOffsets(nLastRelativeMouseX - 10, nLastRelativeMouseY - 10, nLastRelativeMouseX + 10, nLastRelativeMouseY + 10)
	local chooser = wndControl:GetParent():GetParent():GetParent()	-- ancestor chain: wnd_SatValue -> wnd_WidgetContainer -> wnd_ColorPicker -> GeminiChooserForm
	self:UpdateHSL(chooser)
end

function GeminiColor:OnSatValueMove(wndHandler, wndControl)
	local chooser = wndControl:GetParent():GetParent():GetParent():GetParent()	-- ancestor chain: wnd_Loc -> wnd_SatValue -> wnd_WidgetContainer -> wnd_ColorPicker -> GeminiChooserForm
	
	self:UpdateHSL(chooser)
end

function GeminiColor:OnHueSliderChanged( wndHandler, wndControl, fNewValue, fOldValue)
	local wndHue = wndControl:GetParent()
	local wndWidgetContainer = wndHue:GetParent()

	local chooser = wndWidgetContainer:GetParent():GetParent()	-- ancestor chain: SliderBar -> wnd_Hue -> wnd_WidgetContainer -> wnd_ColorPicker -> GeminiChooserForm

	self:UpdateHSL(chooser)
	local fHue = chooser:FindChild("SliderBar"):GetValue() / 100
	local clrNew = self:RGBAPercToHex(self:HSLtoRGB(fHue, 0.5, 0.5))

	wndWidgetContainer:FindChild("wnd_Overlay"):SetBGColor(clrNew)
end

Apollo.RegisterPackage(GeminiColor, MAJOR, MINOR, {})