if not _G.Welcomed then
  loadstring(game:HttpGet("https://raw.githubusercontent.com/z4xi/titanium/main/welcome.lua"))()
elseif _G.Welcomed = true then
  loadstring(game:HttpGet("https://raw.githubusercontent.com/z4xi/titanium/main/main.lua"))()
end
