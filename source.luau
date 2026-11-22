local library = {}

function library:CreateWindow(options)
    if type(options) ~= "table" then
        error("Expected table, got " .. typeof(options),2)
    end
    if options.Name == nil or type(options.Name) ~= "string" then
        options.Name = "Dragon UI"
    end
    if options.Executor == nil or type(options.Executor) ~= "boolean" then
        options.Executor = false
    end
    local exec,ver = identifyexecutor()
    if gethui():FindFirstChild("Dragon") and gethui().Dragon:IsA("Folder") then
        error("You already have a window created",2)
    end
    local folder = Instance.new("Folder",gethui())
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
    t1.Text = " " .. options.Name
    t1.Font = Enum.Font.Gotham
    t1.TextColor3 = Color3.new(1,1,1)
    t1.TextSize = 16
    t1.TextXAlignment = Enum.TextXAlignment.Left
    t1.BackgroundTransparency = 1
    if options.Executor == true then
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
    local window = {}
    function window:CreateTab(options)
        if options.Name == nil or type(options.Name) ~= "string" then
            options.Name = "Tab"
        end
        local tabPos = 0
        for _, pos in pairs(f1:GetChildren()) do
            if pos:IsA("TextButton") then
                if tabPos >= 350 then
                    error("You can only have 8 tabs or less",2)
                else
                    tabPos += 50
                end
            end
        end
        local f3 = Instance.new("ScrollingFrame",f2)
        f3.Name = options.Name
        f3.Size = UDim2.new(1,0,1,0)
        f3.BackgroundTransparency = 1
        f3.BorderSizePixel = 0
        f3.ScrollBarThickness = 0
        f3.Visible = false
        local t = Instance.new("TextButton",f1)
        t.Size = UDim2.new(0,50,1,0)
        t.Position = UDim2.new(0,tabPos,0,0)
        t.BackgroundColor3 = Color3.fromRGB(30,30,30)
        t.BorderSizePixel = 0
        t.TextColor3 = Color3.new(1,1,1)
        t.Text = options.Name
        t.Font = Enum.Font.Gotham
        t.AutoButtonColor = false
        t.TextSize = 13
        t.Activated:Connect(function()
            for _, tab in pairs(f1:GetChildren()) do
                if tab:IsA("TextButton") then
                    tab.BackgroundColor3 = Color3.fromRGB(30,30,30)
                end
            end
            for _, box in pairs(f3:GetChildren()) do
                if f3:IsA("ScrollingFrame") then
                    box.Visible = false
                end
            end
            t.BackgroundColor3 = Color3.fromRGB(45,45,45)
            f3.Visible = true
        end)
    end
    return window
end

return library
