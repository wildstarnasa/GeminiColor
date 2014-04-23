-----------------------------------------------------------------------------------------------
-- Client Lua Script for GeminiColor
-- Copyright (c) NCsoft. All rights reserved
-----------------------------------------------------------------------------------------------
 
require "Window"
 
-----------------------------------------------------------------------------------------------
-- GeminiColor Module Definition
-----------------------------------------------------------------------------------------------
local GeminiColor = {} 
 
-----------------------------------------------------------------------------------------------
-- Constants
-----------------------------------------------------------------------------------------------
-- e.g. local kiExampleVariableMax = 999

local ktColors = {
	IndianRed = "CD5C5C",	LightCoral = "F08080",	Salmon = "FA8072",	DarkSalmon = "E9967A",	Red = "FF0000",	Crimson = "DC143C",
	FireBrick = "B22222",	DarkRed = "8B0000",	Pink = "FFC0CB",	LightPink = "FFB6C1",	HotPink = "FF69B4",	DeepPink = "FF1493",
	MediumVioletRed = "C71585",	PaleVioletRed = "DB7093",	LightSalmon = "FFA07A",	Coral = "FF7F50",	Tomato = "FF6347",	OrangeRed = "FF4500",
	DarkOrange = "FF8C00",	Orange = "FFA500",	Gold = "FFD700",	Yellow = "FFFF00",	LightYellow = "FFFFE0",	LemonChiffon = "FFFACD",
	LightGoldenrodYellow = "FAFAD2",	PapayaWhip = "FFEFD5",	Moccasin = "FFE4B5",	PeachPuff = "FFDAB9",	PaleGoldenrod = "EEE8AA",	Khaki = "F0E68C",
	DarkKhaki = "BDB76B",	Lavender = "E6E6FA",	Thistle = "D8BFD8",	Plum = "DDA0DD",	Violet = "EE82EE",	Orchid = "DA70D6",
	Magenta = "FF00FF",	MediumOrchid = "BA55D3",	MediumPurple = "9370DB",	BlueViolet = "8A2BE2",	DarkViolet = "9400D3",	DarkOrchid = "9932CC",
	DarkMagenta = "8B008B",	Purple = "800080",	Indigo = "4B0082",	DarkSlateBlue = "483D8B",	SlateBlue = "6A5ACD",	MediumSlateBlue = "7B68EE",
	GreenYellow = "ADFF2F",	Chartreuse = "7FFF00",	LawnGreen = "7CFC00",	Lime = "00FF00",	LimeGreen = "32CD32",	PaleGreen = "98FB98",
	LightGreen = "90EE90",	MediumSpringGreen = "00FA9A",	SpringGreen = "00FF7F",	MediumSeaGreen = "3CB371",	SeaGreen = "2E8B57",	ForestGreen = "228B22",
	Green = "008000",	DarkGreen = "006400",	YellowGreen = "9ACD32",	OliveDrab = "6B8E23",	Olive = "808000",	DarkOliveGreen = "556B2F",
	MediumAquamarine = "66CDAA",	DarkSeaGreen = "8FBC8F",	LightSeaGreen = "20B2AA",	DarkCyan = "008B8B",	Teal = "008080",	Cyan = "00FFFF",
	LightCyan = "E0FFFF",	PaleTurquoise = "AFEEEE",	Aquamarine = "7FFFD4",	Turquoise = "40E0D0",	MediumTurquoise = "48D1CC",	DarkTurquoise = "00CED1",
	CadetBlue = "5F9EA0",	SteelBlue = "4682B4",	LightSteelBlue = "B0C4DE",	PowderBlue = "B0E0E6",	LightBlue = "ADD8E6",	SkyBlue = "87CEEB",
	LightSkyBlue = "87CEFA",	DeepSkyBlue = "00BFFF",	DodgerBlue = "1E90FF",	CornflowerBlue = "6495ED",	RoyalBlue = "4169E1",	Blue = "0000FF",
	MediumBlue = "0000CD",	DarkBlue = "00008B",	Navy = "000080",	MidnightBlue = "191970",	Cornsilk = "FFF8DC",	BlanchedAlmond = "FFEBCD",
	Bisque = "FFE4C4",	NavajoWhite = "FFDEAD",	Wheat = "F5DEB3",	BurlyWood = "DEB887",	Tan = "D2B48C",	RosyBrown = "BC8F8F",
	SandyBrown = "F4A460",	Goldenrod = "DAA520",	DarkGoldenrod = "B8860B",	Peru = "CD853F",	Chocolate = "D2691E",	SaddleBrown = "8B4513",
	Sienna = "A0522D",	Brown = "A52A2A",	Maroon = "800000",	White = "FFFFFF",	Snow = "FFFAFA",	Honeydew = "F0FFF0",
	MintCream = "F5FFFA",	Azure = "F0FFFF",	AliceBlue = "F0F8FF",	GhostWhite = "F8F8FF",	WhiteSmoke = "F5F5F5",	Seashell = "FFF5EE",
	Beige = "F5F5DC",	OldLace = "FDF5E6",	FloralWhite = "FFFAF0",	Ivory = "FFFFF0",	AntiqueWhite = "FAEBD7",	Linen = "FAF0E6",
	LavenderBlush = "FFF0F5",	MistyRose = "FFE4E1",	Gainsboro = "DCDCDC",	LightGrey = "D3D3D3",	Silver = "C0C0C0",	DarkGray = "A9A9A9",
	Gray = "808080",	DimGray = "696969",	LightSlateGray = "778899",	SlateGray = "708090",	DarkSlateGray = "2F4F4F",	Black = "000000",
}
 
-----------------------------------------------------------------------------------------------
-- Initialization
-----------------------------------------------------------------------------------------------
function GeminiColor:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self 

    -- initialize variables here
	o.RGB = {
		R = 1,
		G = 1,
		B = 1
	}
	o.HSL = {
		H = 1,
		S = 1,
		L = 1,
	}
	
    return o
end

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
	self.xmlDoc = XmlDoc.CreateFromFile("GeminiColor.xml")
	self.wndMain = Apollo.LoadForm(self.xmlDoc, "GeminiChooserForm", nil, self)
	self.wndSatVal = self.wndMain:FindChild:("wnd_WidgetContainer:wnd_SatValue")
	self.wndHue = self.wndMain:FindChild:("wnd_WidgetContainer:wnd_Hue:SliderBar")
	self.wndCurrColor
	self.wndCurrColor
	self.wndMain:Show(false, true)
end

-----------------------------------------------------------------------------------------------
-- GeminiColor Functions
-----------------------------------------------------------------------------------------------
-- Define general functions here

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
	-- From https://github.com/EmmanuelOga/columns/blob/master/utils/color.lua
	-----------------------------------------------------------------------------------------------

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

function GeminiColor:rgbToHsl(r, g, b, a)
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

function GeminiColor:hslToRgb(h, s, l, a)
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

function GeminiColor:GetColorList()
	return ktColors
end

-----------------------------------------------------------------------------------------------
-- GeminiColorForm Functions
-----------------------------------------------------------------------------------------------
-- when the OK button is clicked
function GeminiColor:OnOK()
	self.wndMain:Close() -- hide the window
end

-- when the Cancel button is clicked
function GeminiColor:OnCancel()
	self.wndMain:Close() -- hide the window
end

function GeminiColor:OnColorDD(wndHandler, wndControl)
	self.wndDD:Show(not wndDD:IsShown())
end

function GeminiColor:SetRGB(R,G,B)

	if R ~= nil then self.RGB.R = R end
	if G ~= nil then self.RGB.G = G end
	if B ~= nil then self.RGB.B = B end
	self.wndMain:FindChild("input_Red"):SetText(self.RGB.R)
	self.wndMain:FindChild("input_Green"):SetText(self.RGB.G)
	self.wndMain:FindChild("input_Blue"):SetText(self.RGB.B)
	
end

function GeminiColor:OnDDItemClick(wndHandler, wndControl)
	local strColor = wndControl:GetTextColor()
	local fR,fG,fB = self:HexToRGBAPerc(strColor)
	local 
	self:SetRGB(fR, fG, fB)
	
end

function GeminiColor:SetCurrentSwatchColor()
	local clrNew = ApolloColor.new(self.hslToRgb(self.HSL.H, self.HSL.S, self.HSL.L))
	local clrOld = ApolloColor.new(self.wndMain:FindChild("wnd_ColorSwatch_Current"):GetBGColor())
	self.wndMain:FindChild("wnd_ColorSwatch_Current"):SetBGColor(clrNew)
	self.wndMain:FindChild("wnd_ColorSwatch_Previous"):SetBGColor(clrOld)
	local tRGB = clrNew:ToTable()
	
	GeminiColor:SetRGB((tRGB.red or tRGB.r, or tRGB[1]),(self.RGB.G = tRGB.green or tRGB.g, or tRGB[2]),(self.RGB.B = tRGB.blue or tRGB.b, or tRGB[3]))
end

function GeminiColor:OnSatValueMouseDown( wndHandler, wndControl, eMouseButton, nLastRelativeMouseX, nLastRelativeMouseY)
	self.HSL.S = nLastRelativeMouseX
	self.HSL.L = nLastRelativeMouseY
	local wndLocPointer = self.wndSatVal:FindChild("wnd_Loc")
	wndLocPointer:SetAnchorOffsets(nLastRelativeMouseX - 10, nLastRelativeMouseX, -10, nLastRelativeMouseX +10, nLastRelativeMouseX +10)
	self:SetCurrentSwatchColor()
end

function GeminiColor:SetSatValColor(clrHue)
	local clrNew = self.hslToRgb(clrHue, 1, 1)
	self.wndSatVal:SetBGColor(ApolloColor.new(clrNew))
end

function GeminiColor:OnHueSliderChanged( wndHandler, wndControl, fNewValue, fOldValue )
	self.HSL.H = math.floor(fNewValue / 100)
	self:SetSatValColor(self.HSL.H)
	self:SetCurrentSwatchColor()
end

-----------------------------------------------------------------------------------------------
-- GeminiColor Instance
-----------------------------------------------------------------------------------------------
local GeminiColorInst = GeminiColor:new()
GeminiColorInst:Init()
