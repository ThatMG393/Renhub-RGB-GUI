gamePlaceIds = {2753915549,4442272183,7449423635, 4520749081, 6381829480, 5931540094}

_G.isRGB = true
_G.isDefault = false
_G.isCustom = false

_G.CustomColor = Color3.fromRGB(255, 0, 0)

local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RGBTweenService = game:GetService("TweenService")

local Threading = {}
local TC3 = function(GUIObject)
    while true do
        wait(0.1) 
        RGBTweenService:Create(
            GUIObject,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
            {TextColor3 = Color3.fromRGB(255, 0, 0)}
        ):Play() 
        wait(.5)            
        RGBTweenService:Create(
            GUIObject,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
            {TextColor3 = Color3.fromRGB(255, 155, 0)}
        ):Play() 
        wait(.5)            
        RGBTweenService:Create(
            GUIObject,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
            {TextColor3 = Color3.fromRGB(255, 255, 0)}
        ):Play() 
        wait(.5)            
        RGBTweenService:Create(
            GUIObject,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
            {TextColor3 = Color3.fromRGB(0, 255, 0)}
        ):Play() 
        wait(.5)            
        RGBTweenService:Create(
            GUIObject,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
            {TextColor3 = Color3.fromRGB(0, 255, 255)}
        ):Play() 
        wait(.5)            
        RGBTweenService:Create(
            GUIObject,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
            {TextColor3 = Color3.fromRGB(0, 155, 255)}
        ):Play() 
        wait(.5)            
        RGBTweenService:Create(
            GUIObject,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
            {TextColor3 = Color3.fromRGB(255, 0, 255)}
        ):Play() 
        wait(.5)            
        RGBTweenService:Create(
            GUIObject,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
            {TextColor3 = Color3.fromRGB(255, 0, 155)}
        ):Play() 
        wait(.5)
    end
end

local BG3 = function(GUIObject)
    while true do
        wait(0.1) 
        RGBTweenService:Create(
            GUIObject,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
            {BackgroundColor3 = Color3.fromRGB(255, 0, 0)}
        ):Play() 
        wait(.5)            
        RGBTweenService:Create(
            GUIObject,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
            {BackgroundColor3 = Color3.fromRGB(255, 155, 0)}
        ):Play() 
        wait(.5)            
        RGBTweenService:Create(
            GUIObject,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
            {BackgroundColor3 = Color3.fromRGB(255, 255, 0)}
        ):Play() 
        wait(.5)            
        RGBTweenService:Create(
            GUIObject,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
            {BackgroundColor3 = Color3.fromRGB(0, 255, 0)}
        ):Play() 
        wait(.5)            
        RGBTweenService:Create(
            GUIObject,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
            {BackgroundColor3 = Color3.fromRGB(0, 255, 255)}
        ):Play() 
        wait(.5)            
        RGBTweenService:Create(
            GUIObject,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
            {BackgroundColor3 = Color3.fromRGB(0, 155, 255)}
        ):Play() 
        wait(.5)            
        RGBTweenService:Create(
            GUIObject,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
            {BackgroundColor3 = Color3.fromRGB(255, 0, 255)}
        ):Play() 
        wait(.5)            
        RGBTweenService:Create(
            GUIObject,TweenInfo.new(1,Enum.EasingStyle.Linear,Enum.EasingDirection.InOut),
            {BackgroundColor3 = Color3.fromRGB(255, 0, 155)}
        ):Play() 
        wait(.5)
    end
end

function Threading:textColorThread()
    local curThr = {}

    function curThr:create(GUIObject)
        local curCo = {}
        local coRGB = coroutine.create(TC3)

        function curCo:Run()
            coroutine.resume(coRGB, GUIObject)
        end

        function curCo:Stop()
            coroutine.close(coRGB)
        end

        return curCo
    end
    return curThr
end

function Threading:backgroundRGBThread()
    local curThr = {}

    function curThr:create(GUIObject)
        local curCo = {}
        local coRGB = coroutine.create(BG3)

        function curCo:Run()
            coroutine.resume(coRGB, GUIObject)
        end

        function curCo:Stop()
            coroutine.close(coRGB)
        end

        return curCo
    end
    return curThr
end

local GUI = {}

function GUI.makeWindowDraggable(topObject, mainObject)
    local Dragging = nil
    local DragInput = nil
    local DragStart = nil
    local StartPosition = nil

    local function Update(input)
        local Delta = input.Position - DragStart
        local pos =
            UDim2.new(
                StartPosition.X.Scale,
                StartPosition.X.Offset + Delta.X,
                StartPosition.Y.Scale,
                StartPosition.Y.Offset + Delta.Y
            )
        local Tween = TweenService:Create(mainObject, TweenInfo.new(0.2), {Position = pos})
        Tween:Play()
    end

    topObject.InputBegan:Connect(
        function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                Dragging = true
                DragStart = input.Position
                StartPosition = mainObject.Position

                input.Changed:Connect(
                    function()
                        if input.UserInputState == Enum.UserInputState.End then
                            Dragging = false
                        end
                    end)
            end
        end)

    topObject.InputChanged:Connect(
        function(input)
            if
                input.UserInputType == Enum.UserInputType.MouseMovement or
                input.UserInputType == Enum.UserInputType.Touch
            then
                DragInput = input
            end
        end)

    topObject.InputChanged:Connect(
        function(input)
            if input == DragInput and Dragging then
                Update(input)
            end
        end)
end

function GUI.createWindow(hubNameText, kbind)
    local isUIHidden = true
    local ff = false

    local MainScreenGUI = Instance.new("ScreenGui")
    MainScreenGUI.Name = "MainScreenGUI"
    MainScreenGUI.Parent = game.CoreGui
    MainScreenGUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local MainFrame = Instance.new("Frame")
    MainFrame.Name = "Main"
    MainFrame.Parent = MainScreenGUI
    MainFrame.AnchorPoint = Vector2.new(0.5, 0.5)
    MainFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
    MainFrame.BackgroundTransparency = 0.100
    MainFrame.BorderSizePixel = 0
    MainFrame.ClipsDescendants = true
    MainFrame.Position = UDim2.new(0.499526083, 0, 0.499241292, 0)
    MainFrame.Size = UDim2.new(0, 600, 0, 350)

    local TopFrame = Instance.new("Frame")
    TopFrame.Name = "Top"
    TopFrame.Parent = MainFrame
    TopFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    TopFrame.BackgroundTransparency = 1.000
    TopFrame.BorderSizePixel = 0
    TopFrame.Size = UDim2.new(0, 600, 0, 20)

    local PageFrame = Instance.new("Frame")
    PageFrame.Name = "Page"
    PageFrame.Parent = MainFrame
    PageFrame.BackgroundColor3 = Color3.fromRGB(25, 23, 35)
    PageFrame.BackgroundTransparency = 0.100
    PageFrame.BorderSizePixel = 0
    PageFrame.Size = UDim2.new(0, 125, 0, 350)

    local HubName = Instance.new("TextLabel")
    HubName.Name = "NameHub"
    HubName.Parent = PageFrame
    HubName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    HubName.BackgroundTransparency = 1.000
    HubName.Position = UDim2.new(0.113333493, 0, 0, 0)
    HubName.Size = UDim2.new(0, 110, 0, 20)
    HubName.Font = Enum.Font.GothamSemibold
    HubName.Text = hubNameText
    HubName.TextColor3 = Color3.fromRGB(255, 0, 0)
    HubName.TextSize = 11.000
    HubName.TextXAlignment = Enum.TextXAlignment.Left

    local UserTextFrame = Instance.new("Frame")
    UserTextFrame.Name = "User"
    UserTextFrame.Parent = PageFrame
    UserTextFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    UserTextFrame.BackgroundTransparency = 1.000
    UserTextFrame.Position = UDim2.new(0, 0, 0.8, 30)
    UserTextFrame.Size = UDim2.new(0, 125, 0, 40)

    local UserText = Instance.new("TextLabel")
    UserText.Name = "UserText"
    UserText.Parent = UserTextFrame
    UserText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    UserText.BackgroundTransparency = 1.000
    UserText.Position = UDim2.new(0.354999989, 0, 0, 11)
    UserText.Size = UDim2.new(0, 80, 0, 20)
    UserText.Font = Enum.Font.Gotham
    UserText.Text = tostring(game.Players.LocalPlayer.Name)
    Threading:textColorThread():create(UserText):Run()
    UserText.TextScaled = true
    UserText.TextSize = 11.000
    UserText.TextWrapped = true
    UserText.TextXAlignment = Enum.TextXAlignment.Left

    local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
    UITextSizeConstraint.Parent = UserText
    UITextSizeConstraint.MaxTextSize = 11

    local UserImage = Instance.new("ImageLabel")
    UserImage.Name = "UserImage"
    UserImage.Parent = UserTextFrame
    UserImage.BackgroundColor3 = Color3.fromRGB(225, 225, 225)
    UserImage.Position = UDim2.new(0, 10, 0, 9)
    UserImage.Size = UDim2.new(0, 25, 0, 25)
    UserImage.Image = "https://www.roblox.com/headshot-thumbnail/image?userId="..game.Players.LocalPlayer.UserId.."&width=420&height=420&format=png"

    local UserImageCorner = Instance.new("UICorner")
    UserImageCorner.CornerRadius = UDim.new(0, 100)
    UserImageCorner.Name = "UserImageCorner"
    UserImageCorner.Parent = UserImage

    local ScrollPage = Instance.new("ScrollingFrame")
    ScrollPage.Name = "ScrollPage"
    ScrollPage.Parent = PageFrame
    ScrollPage.Active = true
    ScrollPage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ScrollPage.BackgroundTransparency = 1.000
    ScrollPage.BorderSizePixel = 0
    ScrollPage.Position = UDim2.new(0, 0, 0.086, 0)
    ScrollPage.Size = UDim2.new(0, 125, 0, 290)
    ScrollPage.CanvasSize = UDim2.new(0, 0, 0, 0)
    ScrollPage.ScrollBarThickness = 0
    local PageList = Instance.new("UIListLayout")
    PageList.Name = "PageList"
    PageList.Parent = ScrollPage
    PageList.SortOrder = Enum.SortOrder.LayoutOrder
    PageList.Padding = UDim.new(0, 7)

    local PagePadding = Instance.new("UIPadding")
    PagePadding.Name = "PagePadding"
    PagePadding.Parent = ScrollPage
    PagePadding.PaddingTop = UDim.new(0, 5)
    PagePadding.PaddingLeft = UDim.new(0, 28)

    local TabFolder = Instance.new("Folder")
    TabFolder.Name = "TabFolder"
    TabFolder.Parent = MainFrame

    GUI:makeWindowDraggable(TopFrame, MainFrame)

    UserInputService.InputBegan:Connect(function(input)
        if input.KeyCode == kbind then
            if isUIHidden == false then
                isUIHidden = true
                MainFrame:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.2,true)
            else
                isUIHidden = false
                MainFrame:TweenSize(UDim2.new(0, 600, 0, 350),"Out","Quad",0.2,true)
            end
        end
    end)

    local curWin = {}
    
    function curWin:addTab(tabName, tabIcon)
        local PageButton = Instance.new("TextButton")
        PageButton.Name = "PageButton"
        PageButton.Parent = ScrollPage
        PageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        PageButton.BackgroundTransparency = 1.000
        PageButton.BorderSizePixel = 0
        PageButton.Position = UDim2.new(0.224000007, 0, 0.029787235, 0)
        PageButton.Size = UDim2.new(0, 97, 0, 20)
        PageButton.AutoButtonColor = false
        PageButton.Font = Enum.Font.GothamSemibold
        PageButton.Text = tabName
        PageButton.TextColor3 = Color3.fromRGB(225, 225, 225)
        PageButton.TextSize = 11.000
        PageButton.TextXAlignment = Enum.TextXAlignment.Left
        
        local PageImage = Instance.new("ImageLabel")
        PageImage.Name = "PageImage"
        PageImage.Parent = PageButton
        PageImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        PageImage.BackgroundTransparency = 1.000
        PageImage.Position = UDim2.new(0, -20, 0, 3)
        PageImage.Size = UDim2.new(0, 15, 0, 15)
        PageImage.Image = "rbxassetid://"..tostring(tabIcon)

        local MainTab = Instance.new("Frame")
        MainTab.Name = "MainTab"
        MainTab.Parent = TabFolder
        MainTab.BackgroundColor3 = Color3.fromRGB(30, 28, 39)
        MainTab.BorderSizePixel = 0
        MainTab.Position = UDim2.new(0.208333328, 0, 0, 0)
        MainTab.Size = UDim2.new(0, 475, 0, 350)
        MainTab.Visible = false

        local ScrollTab = Instance.new("ScrollingFrame")
        ScrollTab.Name = "ScrollTab"
        ScrollTab.Parent = MainTab
        ScrollTab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        ScrollTab.BackgroundTransparency = 1.000
        ScrollTab.BorderSizePixel = 0
        ScrollTab.Position = UDim2.new(0, 0, 0.057, 0)
        ScrollTab.Size = UDim2.new(0, 475, 0, 330)
        ScrollTab.CanvasSize = UDim2.new(0, 0, 0, 0)
        ScrollTab.ScrollBarThickness = 3

        local TabList = Instance.new("UIListLayout")
        TabList.Name = "TabList"
        TabList.Parent = ScrollTab
        TabList.SortOrder = Enum.SortOrder.LayoutOrder
        TabList.Padding = UDim.new(0, 5)

        local TabPadding = Instance.new("UIPadding")
        TabPadding.Name = "TabPadding"
        TabPadding.Parent = ScrollTab
        TabPadding.PaddingLeft = UDim.new(0, 10)
        TabPadding.PaddingTop = UDim.new(0, 10)

        PageButton.MouseButton1Click:Connect(function()
            for i, v in next, TabFolder:GetChildren() do 
                if v.Name == "MainTab" then
                    v.Visible = false
                end
            end
            MainTab.Visible = true

            for i, v in next, ScrollPage:GetChildren() do 
                if v:IsA("TextButton") then
                    TweenService:Create(
                        v,
                        TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(225, 225, 225)}
                    ):Play()
                end
                TweenService:Create(
                    PageButton,
                    TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                    {TextColor3 = Color3.fromRGB(255,0,0)}
                ):Play()
            end
        end)

        if ff == false then
            TweenService:Create(
                PageButton,
                TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                {TextColor3 = Color3.fromRGB(255,0,0)}
            ):Play()
            for i, v in next, TabFolder:GetChildren() do 
                if v.Name == "MainTab" then
                    v.Visible = false
                end
                MainTab.Visible = true
            end
            ff = true
        end

        game:GetService("RunService").Stepped:Connect(function()
            pcall(function()
                ScrollPage.CanvasSize = UDim2.new(0,0,0,PageList.AbsoluteContentSize.Y + 10)
                ScrollTab.CanvasSize = UDim2.new(0,0,0,TabList.AbsoluteContentSize.Y + 30)
            end)
        end)

        local curTab = {}

        function curTab:addButton(buttonText, buttonCallback)
            local Button = Instance.new("TextButton")
            Button.Name = "Button"
            Button.Parent = ScrollTab
            Button.BackgroundColor3 = Color3.fromRGB(50, 48, 59)
            Button.BackgroundTransparency = 0.1
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(0, 455, 0, 30)
            Button.AutoButtonColor = false
            Button.Font = Enum.Font.Gotham
            Button.Text = buttonText
            Button.TextColor3 = Color3.fromRGB(225, 225, 225)
            Button.TextSize = 11.000
            Button.TextWrapped = true
            
            local ButtonCorner = Instance.new("UICorner")
            ButtonCorner.Name = "ButtonCorner"
            ButtonCorner.CornerRadius = UDim.new(0, 5)
            ButtonCorner.Parent = Button

            local btnTweenRGB = Threading:textColorThread():create(Button)
            
            Button.MouseEnter:Connect(function()
                if _G.isRGB then
                    btnTweenRGB:Run()
                elseif _G.isDefault then
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(255, 0, 0)}
                    ):Play()
                else
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = _G.CustomColor}
                    ):Play()
                end
            end)
            
            Button.MouseLeave:Connect(function()
                if _G.isRGB then
                    btnTweenRGB:Stop()
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(225, 225, 225)}
                    ):Play()
                elseif _G.isDefault then
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(225, 225, 225)}
                    ):Play()
                else
                    TweenService:Create(
                        Button,
                        TweenInfo.new(0.4,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),
                        {TextColor3 = Color3.fromRGB(225, 225, 225)}
                    ):Play()
                end
            end)
            
            Button.MouseButton1Click:Connect(function()
                buttonCallback()
                Button.TextSize = 0
                TweenService:Create(
                    Button,
                    TweenInfo.new(0.4,Enum.EasingStyle.Back,Enum.EasingDirection.Out),
                    {TextSize = 11}
                ):Play() 
            end)
        end

        function curTab:addToggle()
        
        end
        
        function curTab:addDropdown()
        
        end
        function curTab:addColorPicker()
            
        end
    return curTab
    end
return curWin
end

-- if game.PlaceId == gamePlaceIds[0] or game.PlaceId == gamePlaceIds[1] or game.PlaceId == gamePlaceIds[2] then
--
-- end

if true then
    do
        local gui = game.CoreGui:FindFirstChild("MainScreenGUI")
        if gui then
            gui.Destroy()
        end
    end

    local Main = GUI.createWindow("MG Hub | BF")

    local TestTab = Main:addTab("Test tab", "6026568198")
    local TestTabButton = TestTab:addButton("Click me!", function()
        warn("I've been clicked!")
    end)
end