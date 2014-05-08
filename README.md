GeminiColor
===========

 A tool designed for adding color picking capabilities. Has options for preset or custom colors.
 
 
Useage:
GeminiColor = Apollo.GetAddon("GeminiColor")

GeminiColor:ShowColorPicker(tAddon, strCallBack [, bCustomColor])
 tAddon - The addon that has the callback handler
 strCallback - THe string refeence to the callback handler. Receives one argument, strColor, a hexadecimal string of the color.
 bCustomColor - Optional - If true, will offer a color picker window instead of just the preset colors. if false, only dropdown with all X11 colors is available.

GeminiColor:GetColorList()
  returns a table fo all X11 colors, each entry si as follows:
  { colorName = "IndianRed", strColor = "CD5C5C"},

GeminiColor:GetColorStringByName(strColorName)
  strColorName - string name fo the X11 color.
  returns - hexadecimal color string

GeminiColor:HSLtoRGB(h, s, l, a)

 h - Hue 0 - 1
 s - Saturation 0 - 1
 l - Lightness 0 - 1
 a - Alpha 0 - 1
 
 returns - List of RGBA percentage values
 
GeminiColor:RGBtoHSL(r, g, b, a)
 
 r - Red 0 - 1
 g - Green 0 - 1
 b - Blue 0 - 1
 a - Alpha 0 - 1
 
 returns - List of HSLA percentage values

GeminiColor:RGBAPercToHex(r, g, b, a)

 r - Red 0 - 1
 g - Green 0 - 1
 b - Blue 0 - 1
 a - Alpha 0 - 1
 
 returns - Hexadecmial color string

GeminiColor:HexToRGBAPerc(hex)

 hex - hexadecmial color string
 returns - RGBA list

GeminiColor:RGBpercToRGB(r,g,b,a)
 r - Red 0 - 1
 g - Green 0 - 1
 b - Blue 0 - 1
 a - Alpha 0 - 1
 returns - RGBA list, form 0 - 255
 
GeminiColor:RGBtoRGBperc(r,g,b,a)
 r - Red 0 - 255
 g - Green 0 - 255
 b - Blue 0 - 255
 a - Alpha 0 - 255
 returns - RGBA list, form 0 - 1
