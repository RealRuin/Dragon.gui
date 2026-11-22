# Dragon.gui
A simple Roblox UI Library, still work in progress. Testing will be done with [Potassium](https://potassium.pro).
Made for executor environments, do not use this in studio, parts of it won't work.

## Guide
Loading the library:
```luau
local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/RealRuin/Dragon.gui/refs/heads/main/source.luau"))()
```
Creating a window:
```luau
local window = library:CreateWindow({Name = "Example",Executor = true})
```
