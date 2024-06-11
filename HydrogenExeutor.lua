-- 创建UI元素
local screenGui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local executeButton = Instance.new("TextButton")
local deleteButton = Instance.new("TextButton")
local inputBox = Instance.new("TextBox")
local icon = Instance.new("ImageLabel")
local toggleButton = Instance.new("TextButton")
local closeButton = Instance.new("TextButton") -- 新增关闭按钮
local openButton = Instance.new("ImageButton") -- 更新为ImageButton
local scriptCenterButton = Instance.new("TextButton") -- 新增脚本中心按钮
local scriptCenterFrame = Instance.new("Frame") -- 新增脚本中心框架

-- 设置屏幕GUI
screenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

-- 主框架设置
mainFrame.Parent = screenGui
mainFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- 黑色背景
mainFrame.Size = UDim2.new(0, 600, 0, 400) -- 扩大后的大小
mainFrame.Position = UDim2.new(0.5, -300, 0.5, -200) -- 居中位置
mainFrame.Draggable = true -- 可拖动
mainFrame.Active = true -- 激活框架以响应拖动
mainFrame.Selectable = true -- 可选择

-- 图标设置
icon.Parent = mainFrame
icon.Image = "rbxassetid://13634297542" -- 替换为您的资源ID
icon.Size = UDim2.new(0, 50, 0, 50)
icon.Position = UDim2.new(0, 5, 0, 5)

-- Toggle按钮设置
toggleButton.Parent = mainFrame
toggleButton.Text = "Executor"
toggleButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- 白色按钮
toggleButton.Size = UDim2.new(0, 100, 0, 50)
toggleButton.Position = UDim2.new(0, 5, 0, 60)

-- 关闭按钮设置
closeButton.Parent = mainFrame
closeButton.Text = "X"
closeButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- 黑色按钮
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255) -- 白色文字
closeButton.Size = UDim2.new(0, 50, 0, 50)
closeButton.Position = UDim2.new(1, -55, 0, 5)

-- 打开按钮设置（使用rbxassetid图标）
openButton.Parent = screenGui
openButton.Image = "rbxassetid://13634297542" -- 替换为您的资源ID
openButton.Size = UDim2.new(0, 50, 0, 50)
openButton.Position = UDim2.new(0, 0, 0, 100) -- 屏幕左上角往下100像素
openButton.Visible = false -- 默认不可见

-- 执行按钮设置
executeButton.Parent = mainFrame
executeButton.Text = "Run script"
executeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- 白色按钮
executeButton.Size = UDim2.new(0, 100, 0, 50)
executeButton.Position = UDim2.new(0, 5, 0, 115)

-- 删除按钮设置
deleteButton.Parent = mainFrame
deleteButton.Text = "Clear Editor"
deleteButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- 白色按钮
deleteButton.Size = UDim2.new(0, 100, 0, 50)
deleteButton.Position = UDim2.new(0, 110, 0, 115)

-- 输入框设置
inputBox.Parent = mainFrame
inputBox.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- 黑色输入框
inputBox.TextColor3 = Color3.fromRGB(255, 255, 255) -- 白色文字
inputBox.Size = UDim2.new(1, -10, 1, -170)
inputBox.Position = UDim2.new(0, 5, 0, 170)
inputBox.Text = "" -- 默认文本为空
inputBox.ClearTextOnFocus = false -- 点击时不清空文本
inputBox.MultiLine = true -- 多行输入

-- 脚本中心按钮设置
scriptCenterButton.Parent = mainFrame
scriptCenterButton.Text = "script hub"
scriptCenterButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255) -- 白色按钮
scriptCenterButton.Size = UDim2.new(0, 100, 0, 50)
scriptCenterButton.Position = UDim2.new(0, 110, 0, 60) -- 设置在Toggle按钮下方

-- 脚本中心框架设置
scriptCenterFrame.Parent = mainFrame
scriptCenterFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0) -- 黑色背景
scriptCenterFrame.Size = UDim2.new(0, 200, 0, 200) -- 设置大小
scriptCenterFrame.Position = UDim2.new(0, 5, 0, 170) -- 设置位置
scriptCenterFrame.Visible = false -- 默认不可见

-- 关闭按钮功能
closeButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = false
    openButton.Visible = true
end)

-- 打开按钮功能
openButton.MouseButton1Click:Connect(function()
    mainFrame.Visible = true
    openButton.Visible = false
end)

-- 将UI添加到玩家的屏幕上
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- 函数化脚本中心的显示和隐藏
local function toggleScriptCenter()
    scriptCenterFrame.Visible = not scriptCenterFrame.Visible
end

-- 脚本中心按钮功能
scriptCenterButton.MouseButton1Click:Connect(toggleScriptCenter)

-- 添加固定脚本到脚本中心
local function addFixedScripts()
    local scripts = {
        { Name = "Trauma Hub V4", Function = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/Drop56796/Mercury/main/Mercury.lua"))() end },
        { Name = "脚本2", Function = function() print("执行脚本2") end },
        -- 可以继续添加更多脚本
    }

    for i, script in ipairs(scripts) do
        local button = Instance.new("TextButton")
        button.Parent = scriptCenterFrame
        button.Text = script.Name
        button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        button.Size = UDim2.new(0, 190, 0, 30)
        button.Position = UDim2.new(0, 5, 0, (i - 1) * 35 + 5)
        button.MouseButton1Click:Connect(script.Function)
    end
end

addFixedScripts()

    -- 添加执行按钮功能
executeButton.MouseButton1Click:Connect(function()
    local script = inputBox.Text
    if script ~= "" then
        loadstring(script)()
    end
end)

-- Toggle按钮功能
toggleButton.MouseButton1Click:Connect(function()
    -- 切换按钮区域的可见性
    executeButton.Visible = not executeButton.Visible
    deleteButton.Visible = not deleteButton.Visible
    scriptCenterButton.Visible = not scriptCenterButton.Visible
    -- 切换输入框的可见性
    inputBox.Visible = not inputBox.Visible
end)

-- 删除按钮功能
deleteButton.MouseButton1Click:Connect(function()
    inputBox.Text = ""
end)
