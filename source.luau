local library = {}

function library:CreateWindow(t)
    if type(t) ~= "table" then
        error("Expected table, got " .. typeof(t),2)
    end
    if t.Name == nil or type(t.Name) ~= "string" then
        t.Name = "Dragon UI"
    end
    if t.Executor == nil or type(t.Executor) ~= "boolean" then
        t.Executor = false
    end
    local exec,ver = identifyexecutor()
    if game:GetService("CoreGui"):FindFirstChild("Dragon") and game:GetService("CoreGui").Dragon:IsA("Folder") then
        error("You already have a window created",2)
    end
    local folder = Instance.new("Folder",game:GetService("CoreGui"))
    folder.Name = "Dragon"
    local s = Instance.new("ScreenGui",folder)
    s.ResetOnSpawn = false
    local f = Instance.new("Frame",s)
    f.Size = UDim2.new(0,400,0,20)
    f.Position = UDim2.new(0.5,-200,0.5,-250)
    f.BackgroundColor3 = Color3.fromRGB(30,30,30)
    f.BorderColor3 = Color3.fromRGB(60,60,60)
    f.Draggable = true
    f.Selectable = true
    f.Active = true
    f.Name = "TitleBar"
    local f1 = Instance.new("Frame",f)
    f1.Position = UDim2.new(0,0,0,21)
    f1.BorderColor3 = Color3.fromRGB(60,60,60)
    f1.BackgroundColor3 = Color3.fromRGB(30,30,30)
    f1.Size = UDim2.new(1,0,0,15)
    f1.Name = "TabButtonContainer"
    local f2 = Instance.new("Frame",f)
    f2.Size = UDim2.new(1,0,0,455)
    f2.Position = f1.Position + UDim2.new(0,0,0,16)
    f2.BorderColor3 = Color3.fromRGB(60,60,60)
    f2.BackgroundColor3 = Color3.fromRGB(30,30,30)
    f2.ClipsDescendants = true
    local t1 = Instance.new("TextLabel",f)
    t1.Size = UDim2.new(1,0,1,0)
    t1.Text = " " .. t.Name
    t1.Font = Enum.Font.Gotham
    t1.TextColor3 = Color3.new(1,1,1)
    t1.TextSize = 16
    t1.TextXAlignment = Enum.TextXAlignment.Left
    t1.BackgroundTransparency = 1
    if t.Executor == true then
        local t2 = t1:Clone()
        t2.Parent = t1.Parent
        t2.Text = exec .. " " .. ver .. " "
        t2.TextXAlignment = Enum.TextXAlignment.Right
    end
    local i = Instance.new("ImageLabel",f2)
    i.Name = "Background"
    i.BackgroundTransparency = 1
    i.Image = "rbxassetid://2151741365"
    i.Size = UDim2.new(0,300,0,300)
    local i2 = i:Clone()
    i2.Parent = i.Parent
    i2.Position = UDim2.new(0,300,0,0)
    local i3 = i:Clone()
    i3.Parent = i.Parent
    i3.Position = UDim2.new(0,300,0,300)
    local i4 = i:Clone()
    i4.Parent = i.Parent
    i4.Position = UDim2.new(0,0,0,300)
end

return library
