-----------------------------------------------------------------------------------------------
-- Client Lua Script for GeminiColor
-- Copyright (c) NCsoft. All rights reserved
-----------------------------------------------------------------------------------------------
 
require "Window"
 
-----------------------------------------------------------------------------------------------
-- GeminiColor Module Definition
-----------------------------------------------------------------------------------------------
local GeminiColor = {}
local GeminiColorEditor = {}
 
-----------------------------------------------------------------------------------------------
-- Constants
-----------------------------------------------------------------------------------------------
-- e.g. local kiExampleVariableMax = 999

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
-- Initialization
-----------------------------------------------------------------------------------------------
function GeminiColor:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self 

    -- initialize variables here	
    return o
end

GeminiColorEditor.tRGB = {
	R = 1,
	G = 1,
	B = 1
}
GeminiColorEditor.tHSL = {
	H = 1,
	S = 1,
	L = 1,
}
GeminiColorEditor.strHex = "ffffffff"

function GeminiColor:Init()
	local bHasConfigureFunction = false
	local strConfigureButtonText = ""
	local tDependencies = {
		-- "UnitOrPackageName",
	}
    Apollo.RegisterAddon(self, bHasConfigureFunction, strConfigureButtonText, tDependencies)
end
 

-----------------------------------------------------------------------------------------------
-- GeminiColor OnLoad
-----------------------------------------------------------------------------------------------
function GeminiColor:OnLoad()
	GeminiColorEditor.xmlDoc = XmlDoc.CreateFromFile("GeminiColor.xml")
	self.wndMain = Apollo.LoadForm(GeminiColorEditor.xmlDoc, "GeminiChooserForm", nil, GeminiColorEditor)
	
	self.wndColorPicker = wndMain:FindChild("wnd_ColorPicker")
	self.wndSatVal = self.wndColorPicker:FindChild:("wnd_WidgetContainer:wnd_SatValue")
	self.wndHue = self.wndColorPicker:FindChild("wnd_WidgetContainer:wnd_Hue:SliderBar")
	
	self.wndDD = self.wndMain:FindChild("ddList_PresetColors:wnd_ColorDD")
	
	for i, v in pairs(ktColors) do
		local wndCurrColor = Apollo.LoadForm(GeminiColorEditor.xmlDoc,"ColorListItemForm",self.wndDD,self)
		wndCurrColor:SetText(v.colorName)
		wndCurrColor:SetTextColor("FF"..v.strColor)
	end
	self.wndDD:ArrangeChildrenVert()
	
	self.wndMain:Show(false, true)
end

-----------------------------------------------------------------------------------------------
-- GeminiColor Functions
-----------------------------------------------------------------------------------------------
-- Define general functions here

function GeminiColor:ShowColorPicker(tAddon, strCallBack, bCustomColor, strInitialColor)
	self.tAddon = tAddon
	self.strCallBack = strCallBack
	
	if bCustomColor == true then
		self.wndMain:FindChild("group_CustomColorControls"):Show(false)
		if self.wndMain:GetWidth() == 410 then
			local fL, fT, fR, fB = self.wndMain:GetAnchorOffsets()
			self.wndMain:SetAnchorOffsets(fL - 100, fT, fR, fB)
		end
	end
	
	if self.wndMain:GetWidth() == 310 then
		local fL, fT, fR, fB = self.wndMain:GetAnchorOffsets()
		self.wndMain:SetAnchorOffsets(fL + 100, fT, fR, fB)
		self.wndMain:FindChild("group_CustomColorControls"):Show(true)
	end
	
	if strInitialColor ~= nil then
		self.wndMain:FindChild("wnd_ColorSwatch_Current"):SetBGColor(strInitialColor)
	end
	
	self.wndMain:Show(true)
end

function GeminiColor:GetColorList()
	-- returns a table containing sub entries for all X11 colors.
	-- colorName, strColor
	return ktColors
end

function GeminiColor:RGBAPercToHex(r, g, b, a)
	if not(a) then a = 1 end
	r = r <= 1 and r >= 0 and r or 0
	g = g <= 1 and g >= 0 and g or 0
	b = b <= 1 and b >= 0 and b or 0
	a = a <= 1 and a >= 0 and a or 1
	-- retunr hex string
	return string.format("%02x%02x%02x%02x",a*255 ,r*255, g*255, b*255)
end

function GeminiColor:HexToRGBAPerc(hex)
	if strlen(hex) == 6 then
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
	return r * 255, g * 255, b * 255, a * 255
end

function GeminiColor:RGBtoRGBperc(r,g,b,a)
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
-----------------------------------------------------------------------------------------------
-- GeminiColorForm Functions
-----------------------------------------------------------------------------------------------
-- when the OK button is clicked
function GeminiColorEditor:OnOK()
	local addon = GeminiColor.tAddon
	local callBack = GeminiColor.strCallBack
	local strColor = self.GetCurrentColor()
	addon[callBack](addon,strColor)
	GeminiColor.wndMain:Close() -- hide the window
end

-- when the Cancel button is clicked
function GeminiColorEditor:OnCancel()
	GeminiColor.wndMain:Close() -- hide the window
end

function GeminiColorEditor:OnPickerShow(wndHandler, wndControl)
	self.wndColorPicker:Show(wndControl:IsChecked())
end

function GeminiColorEditor:OnColorClick(wndHandler, wndControl)
	local strColorCode = wndControl:GetTextColor()
	local strColorName = wndControl:GetText()
	
	local wndDDFrame = self.wndMain:FindChild("ddList_PresetColors")
	wndDDFrame:SetText(strColorName)
	wndDDFrame:SetTextColor(strColorCode)
	
	local clrOld = GeminiColor.wndMain:FindChild("wnd_ColorSwatch_Current"):GetBGColor()
		
	GeminiColor.wndMain:FindChild("wnd_ColorSwatch_Current"):SetBGColor(strColorCode)
	GeminiColor.wndMain:FindChild("wnd_ColorSwatch_Previous"):SetBGColor(clrOld)
	GeminiColorEditor:SetRGB(GeminiColor:HexToRGBAPerc(strColorCode))
end

function GeminiColorEditor:OnColorDD(wndHandler, wndControl)
	GeminiColor.wndDD:Show(not GeminiColor.wndDD:IsShown())
end

function GeminiColorEditor:SetRGB(R,G,B)
	GeminiColor.wndColorPicker:FindChild("input_Red"):SetText(R)
	GeminiColor.wndColorPicker:FindChild("input_Green"):SetText(G)
	GeminiColor.wndColorPicker:FindChild("input_Blue"):SetText(B)
end

function GeminiColorEditor:UndoColorChange()
	local clrOld = ApolloColor.new(GeminiColor.wndMain:FindChild("wnd_ColorSwatch_Previous"):GetBGColor())
	GeminiColor.wndMain:FindChild("wnd_ColorSwatch_Current"):SetBGColor(clrOld)
	GeminiColorEditor:SetRGB(GeminiColor:HexToRGBAPerc(clrOld))	
end

function GeminiColorEditor:GetCurrentColor()
	return GeminiColor.wndMain:FindChild("wnd_ColorSwatch_Current"):GetBGColor()
end

function GeminiColorEditor:UpdateHSL()
	local fLightness, fSaturation = self.wndSatVal:FindChild(wndLoc):GetAnchorOffsets()
	local nLConstant = self.wndSatVal:GetWidth()
	local nSConstant = self.wndSatVal:GetHeight()
	fLightness = (fLightness + 10) / nLConstant
	fSaturation = (fSaturation + 10) / nSConstant
	local fHue = math.floor(self.wndHue:GetValue()) / 100
	
	local clrNew = GeminiColor:RGBAPercToHex("ff"..GeminiColor:HSLtoRGB(fHue, fSaturation, fLightness))
	local clrOld = GeminiColor.wndMain:FindChild("wnd_ColorSwatch_Current"):GetBGColor()
	
	GeminiColor.wndMain:FindChild("wnd_ColorSwatch_Current"):SetBGColor(clrNew)
	GeminiColor.wndMain:FindChild("wnd_ColorSwatch_Previous"):SetBGColor(clrOld)
	GeminiColorEditor:SetRGB(GeminiColor:HSLtoRGB(fHue, fSaturation, fLightness))
end

function GeminiColorEditor:OnSatValueMouseDown( wndHandler, wndControl, eMouseButton, nLastRelativeMouseX, nLastRelativeMouseY)
	local wndLocPointer = GeminiColor.wndSatVal:FindChild("wnd_Loc")
	wndLocPointer:SetAnchorOffsets(nLastRelativeMouseX - 10, nLastRelativeMouseX, -10, nLastRelativeMouseX +10, nLastRelativeMouseX +10)
	self:UpdateHSL()
end

function GeminiColorEditor:OnHueSliderChanged( wndHandler, wndControl, fNewValue, fOldValue )
	local clrNew = GeminiColor:RGBAPercToHex(GeminiColor.HSLtoRGB(math.floor(fNewValue / 100), 1, 1))
	GeminiColor.wndSatVal:SetBGColor(ApolloColor.new(clrNew))
	self:UpdateHSL()
end
-----------------------------------------------------------------------------------------------
-- GeminiColor Instance
-----------------------------------------------------------------------------------------------
local GeminiColorInst = GeminiColor:new()
GeminiColorInst:Init()
