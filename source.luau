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
        if type(options) ~= "table" then
            error("Expected table, got " .. typeof(options))
        end
        if options.Name == nil or type(options.Name) ~= "string" then
            options.Name = "Tab"
        end
        local tabPos = 0
        for _, pos in pairs(f1:GetChildren()) do
            if pos:IsA("TextButton") then
                if tabPos >= 320 then
                    error("You can only have 5 tabs or less, " .. "(" .. options.Name .. ")",2)
                else
                    tabPos += 80
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
        t.Size = UDim2.new(0,80,1,0)
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
            for _, box in pairs(f2:GetChildren()) do
                if box:IsA("ScrollingFrame") then
                    box.Visible = false
                end
            end
            t.BackgroundColor3 = Color3.fromRGB(45,45,45)
            f3.Visible = true
        end)
        local tab = {}
        function tab:CreateSection(options)
            local sectionPos = 5
            if type(options) ~= "table" then
                error("Expected table, got " .. typeof(options),2)
            end
            if type(options.Side) ~= "string" then
                if options.Side ~= "Left" then
                    if options.Side ~= "Right" then
                        error("Expected string, got " .. typeof(options.Side),2)
                    end
                end
            end
            if options.Name == nil or typeof(options.Name) ~= "string" then
                options.Name = "Section"
            end
            local f4 = Instance.new("Frame",f3)
            if options.Side == "Left" then
                for _, sec in pairs(f3:GetChildren()) do
                    if sec:IsA("Frame") and sec.Position.X.Offset == 5 then
                        sectionPos += (sec.Size.Y.Offset + 5)
                    end
                end
                f4.Position = UDim2.new(0,5,0,sectionPos)
                sectionPos = 5
            elseif options.Side == "Right" then
                for _, sec in pairs(f3:GetChildren()) do
                    if sec:IsA("Frame") and sec.Position.X.Offset == 205 then
                        sectionPos += (sec.Size.Y.Offset + 5)
                    end
                end
                f4.Position = UDim2.new(0,205,0,sectionPos)
                sectionPos = 5
            end
            f4.Size = UDim2.new(0,185,0,10)
            f4.BackgroundColor3 = Color3.fromRGB(30,30,30)
            f4.BorderMode = Enum.BorderMode.Middle
            f4.BorderSizePixel = 2
            f4.BorderColor3 = Color3.fromRGB(60,60,60)
            local section = {}
            function section:CreateLabel(options)
                if options.Text == nil or type(options.Text) ~= "string" then
                    error("Expected string, got " .. typeof(options.Text))
                end
                if type(options.Align) ~= "string" then
                    error("Expected string, got " .. typeof(options.Align))
                end
                if options.Align ~= "Left" then
                    if options.Align ~= "Center" then
                        if options.Align ~= "Right" then
                            error("Expected Left, Right, or Center. Got " .. options.Align)
                        end
                    end
                end
                local elementOffset = 5
                local t3 = Instance.new("TextLabel",f4)
                t3.BackgroundTransparency = 1
                t3.Size = UDim2.new(0,175,0,16)
                for _, element in pairs(f4:GetChildren()) do
                    elementOffset += 16
                end
                elementOffset += -16
                t3.Position = UDim2.new(0,5,0,elementOffset)
                t3.Text = options.Text
                if options.Align == "Center" then
                    t3.TextXAlignment = Enum.TextXAlignment.Center
                elseif options.Align == "Left" then
                    t3.TextXAlignment = Enum.TextXAlignment.Left
                elseif options.Align == "Right" then
                    t3.TextXAlignment = Enum.TextXAlignment.Right
                end
                t3.TextColor3 = Color3.new(1,1,1)
                t3.Font = Enum.Font.Gotham
                t3.TextSize = 12
                t3.BorderSizePixel = 0
                f4.Size = f4.Size + UDim2.new(0,0,0,20)
                for _, move in pairs(f3:GetChildren()) do
                    if move:IsA("Frame") and move.Position.X.Offset == f4.Position.X.Offset then
                        if move.Position.Y.Offset > f4.Position.Y.Offset then
                            move.Position = move.Position + UDim2.new(0,0,0,20)
                        end
                    end
                end
            end
            return section
        end
        return tab
    end
    return window
end
function library:Unload()
    if gethui():FindFirstChild("Dragon") and gethui().Dragon:IsA("Folder") then
        gethui().Dragon:Destroy()
    end
end
return library
