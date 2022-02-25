local LIB = {}
function LIB:CreateWindow(ScriptName)
	local CocoaLib = Instance.new("ScreenGui")
	local TopHold = Instance.new("Frame")
	local Name = Instance.new("TextLabel")
	local Content = Instance.new("Frame")
	local UIListLayout = Instance.new("UIListLayout")
	local ExitGui = Instance.new("ImageButton")
	local ExitImg = Instance.new("ImageLabel")
	local TabPages = Instance.new("Frame")
	local UIListLayout_2 = Instance.new("UIListLayout")
	local uis = game:GetService("UserInputService")
	
	uis.InputBegan:Connect(function(key)
		if key.KeyCode == Enum.KeyCode.RightControl then
			if TopHold.Visible == true then
				Tophold.Visible = false
			else
				TopHold.Visible = true
			end
		end
	end)
	
	CocoaLib.Name = "CocoaLib"
	CocoaLib.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
	CocoaLib.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	TopHold.Name = "TopHold"
	TopHold.Parent = CocoaLib
	TopHold.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
	TopHold.BorderSizePixel = 0
	TopHold.Position = UDim2.new(0.173221752, 0, 0.247133732, 0)
	TopHold.Size = UDim2.new(0, 452, 0, 49)

	Name.Name = "Name"
	Name.Parent = TopHold
	Name.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Name.BackgroundTransparency = 1.000
	Name.BorderSizePixel = 0
	Name.Position = UDim2.new(0.0265486725, 0, 0.142857149, 0)
	Name.Size = UDim2.new(0, 119, 0, 36)
	Name.Font = Enum.Font.GothamSemibold
	Name.Text = ScriptName
	Name.TextColor3 = Color3.fromRGB(255, 255, 255)
	Name.TextSize = 14.000
	Name.TextXAlignment = Enum.TextXAlignment.Left

	Content.Name = "Content"
	Content.Parent = TopHold
	Content.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
	Content.BorderSizePixel = 0
	Content.ClipsDescendants = true
	Content.Position = UDim2.new(0, 0, 1.00000024, 0)
	Content.Size = UDim2.new(0, 305, 0, 231)

	ExitGui.Name = "ExitGui"
	ExitGui.Parent = TopHold
	ExitGui.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
	ExitGui.BackgroundTransparency = 1.000
	ExitGui.BorderSizePixel = 0
	ExitGui.Position = UDim2.new(0.895791948, 0, 0, 0)
	ExitGui.Size = UDim2.new(0, 47, 0, 49)
	ExitGui.Image = "rbxassetid://8928739157"
	ExitGui.ImageTransparency = 1.000

	ExitImg.Name = "ExitImg"
	ExitImg.Parent = ExitGui
	ExitImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ExitImg.BackgroundTransparency = 1.000
	ExitImg.Position = UDim2.new(0.25666666, 0, 0.268043399, 0)
	ExitImg.Size = UDim2.new(0, 21, 0, 22)
	ExitImg.Image = "rbxassetid://8928739157"

	TabPages.Name = "TabPages"
	TabPages.Parent = TopHold
	TabPages.Active = true
	TabPages.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
	TabPages.BorderSizePixel = 0
	TabPages.ClipsDescendants = true
	TabPages.Position = UDim2.new(0.674778759, 0, 1, 0)
	TabPages.Size = UDim2.new(0, 147, 0, 231)

	UIListLayout_2.Parent = TabPages
	UIListLayout_2.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIListLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout_2.Padding = UDim.new(0, 8)
	
	local function PSCFXKX_fake_script() -- ExitGui.ExitScript 
		local script = Instance.new('LocalScript', ExitGui)

		script.Parent.MouseButton1Click:Connect(function()
			script.Parent.Parent.Parent.Parent.CocoaLib:Destroy()
		end)
	end
	coroutine.wrap(PSCFXKX_fake_script)()
	local function QPZAE_fake_script() -- TopHold.Drag 
		local script = Instance.new('LocalScript', TopHold)

		local function CreateDrag()
			local UIS = game:GetService('UserInputService')
			local frame = script.Parent
			local dragToggle = nil
			local dragSpeed = 0.09
			local dragStart = nil
			local startPos = nil

			local function updateInput(input)
				local delta = input.Position - dragStart
				local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
					startPos.Y.Scale, startPos.Y.Offset + delta.Y)
				game:GetService('TweenService'):Create(frame, TweenInfo.new(dragSpeed), {Position = position}):Play()
			end

			frame.InputBegan:Connect(function(input)
				if (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then 
					dragToggle = true
					dragStart = input.Position
					startPos = frame.Position
					local TweenService = game:GetService('TweenService')
					local Speed = 0.2
					local TweenFunc = TweenInfo.new(Speed, Enum.EasingStyle.Linear , Enum.EasingDirection.Out, 0)
					input.Changed:Connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							dragToggle = false
						end
					end)
				end
			end)

			UIS.InputChanged:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
					if dragToggle then
						updateInput(input)
					end
				end
			end)
		end
		CreateDrag()
	end
	coroutine.wrap(QPZAE_fake_script)()
	local PageManagement = {}
	local InnerPage = {}
	function PageManagement:Page(PageTitle)
		local Page = Instance.new("ScrollingFrame")
		local UIListLayout = Instance.new("UIListLayout")
		
		UIListLayout.Parent = Page
		UIListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
		UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
		UIListLayout.Padding = UDim.new(0, 8)
		
		Page.Name = "Page"
		Page.Parent = Content
		Page.Active = true
		Page.Visible = false
		Page.ScrollBarImageColor3 = Color3.fromRGB(43,43,43)
		Page.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
		Page.BorderSizePixel = 0
		Page.Position = UDim2.new(0.0393442623, 0, 0.0349513479, 0)
		Page.Size = UDim2.new(0, 293, 0, 212)
		Page.BottomImage = "rbxassetid://8885587362"
		Page.MidImage = "rbxassetid://8885587362"
		Page.ScrollBarThickness = 10
		Page.TopImage = "rbxassetid://8885587362"
		Page.VerticalScrollBarInset = Enum.ScrollBarInset.ScrollBar
		Page.VerticalScrollBarPosition = Enum.VerticalScrollBarPosition.Left
		
		local BlankPage = Instance.new("ImageButton")
		local PageName = Instance.new("TextLabel")

		BlankPage.Name = "BlankPage"
		BlankPage.Parent = TabPages
		BlankPage.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
		BlankPage.BackgroundTransparency = 1.000
		BlankPage.BorderSizePixel = 0
		BlankPage.Position = UDim2.new(0.0816326514, 0, 0, 0)
		BlankPage.Size = UDim2.new(0, 123, 0, 31)
		BlankPage.Image = "rbxassetid://8885587362"
		BlankPage.ImageColor3 = Color3.fromRGB(37, 37, 37)
		
		PageName.Name = "PageName"
		PageName.Parent = BlankPage
		PageName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		PageName.BackgroundTransparency = 1.000
		PageName.Size = UDim2.new(0, 123, 0, 31)
		PageName.Font = Enum.Font.GothamSemibold
		PageName.Text = PageTitle
		PageName.TextColor3 = Color3.fromRGB(255, 255, 255)
		PageName.TextSize = 12.000
		
		BlankPage.MouseButton1Click:Connect(function()
			for i,v in next, Content:GetChildren() do
				if v.Name == "Page" then
					v.Visible = false
				end
				Page.Visible = true
			end
		end)
		
		function InnerPage:Slider(Slidername,maxvalue,minvalue,callback)
			
			-- Gui to Lua
			-- Version: 3.2

			-- Instances:

			local Slider = Instance.new("Frame")
			local SliderName = Instance.new("TextLabel")
			local SliderFrame = Instance.new("Frame")
			local SliderBtn = Instance.new("ImageButton")
			local SliderValue = Instance.new("TextLabel")

			--Properties:

			Slider.Name = "Slider"
			Slider.Parent = Page
			Slider.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
			Slider.BorderSizePixel = 0
			Slider.Position = UDim2.new(0.0682593882, 0, 0.44339624, 0)
			Slider.Size = UDim2.new(0, 263, 0, 61)

			SliderName.Name = "SliderName"
			SliderName.Parent = Slider
			SliderName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderName.BackgroundTransparency = 1.000
			SliderName.Position = UDim2.new(0.0342205316, 0, 0, 0)
			SliderName.Size = UDim2.new(0, 63, 0, 39)
			SliderName.Font = Enum.Font.GothamSemibold
			SliderName.Text = Slidername
			SliderName.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderName.TextSize = 12.000
			SliderName.TextXAlignment = Enum.TextXAlignment.Left

			SliderFrame.Name = "SliderFrame"
			SliderFrame.Parent = Slider
			SliderFrame.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
			SliderFrame.BorderSizePixel = 0
			SliderFrame.Position = UDim2.new(0.0342205316, 0, 0.625285149, 0)
			SliderFrame.Size = UDim2.new(0, 37, 0, 15)

			SliderBtn.Name = "SliderBtn"
			SliderBtn.Parent = SliderFrame
			SliderBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderBtn.BackgroundTransparency = 1.000
			SliderBtn.BorderSizePixel = 0
			SliderBtn.Size = UDim2.new(0, 244, 0, 15)
			SliderBtn.Image = "rbxassetid://8885587362"
			SliderBtn.ImageColor3 = Color3.fromRGB(43, 43, 43)
			SliderBtn.ImageTransparency = 1.000

			SliderValue.Name = "SliderValue"
			SliderValue.Parent = Slider
			SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			SliderValue.BackgroundTransparency = 1.000
			SliderValue.Position = UDim2.new(0.760456264, 0, 0, 0)
			SliderValue.Size = UDim2.new(0, 53, 0, 38)
			SliderValue.Font = Enum.Font.GothamSemibold
			SliderValue.Text = ""
			SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
			SliderValue.TextSize = 12.000
			SliderValue.TextXAlignment = Enum.TextXAlignment.Right

			-- Scripts:

			local function FSPBY_fake_script() -- SliderBtn.Manager 
				local script = Instance.new('LocalScript', SliderBtn)

				callback = callback or function() end

				minvalue = minvalue or 0
				maxvalue = maxvalue or 100

				local mouse = game.Players.LocalPlayer:GetMouse()
				local uis = game:GetService("UserInputService")
				local Value;


				script.Parent.MouseButton1Down:Connect(function(moveconnection,releaseconnection)
					Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 244) * script.Parent.Parent.Parent.SliderFrame.AbsoluteSize.X) + tonumber(minvalue))
					pcall(function()
						callback(Value)
					end)
					game:GetService('TweenService'):Create(script.Parent.Parent.Parent.SliderFrame, TweenInfo.new(0.1), {Size = UDim2.new(0, math.clamp(mouse.X - script.Parent.Parent.Parent.SliderFrame.AbsolutePosition.X, 0, 244), 0, 15)}):Play()
					moveconnection = mouse.Move:Connect(function()
						Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 244) * script.Parent.Parent.Parent.SliderFrame.AbsoluteSize.X) + tonumber(minvalue))

						script.Parent.Parent.Parent.SliderValue.Text = Value

						pcall(function()
							callback(Value)
						end)
						--script.Parent.Parent.Parent.SliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - script.Parent.Parent.Parent.SliderFrame.AbsolutePosition.X, 0, 244), 0, 15)
						game:GetService('TweenService'):Create(script.Parent.Parent.Parent.SliderFrame, TweenInfo.new(0.1), {Size = UDim2.new(0, math.clamp(mouse.X - script.Parent.Parent.Parent.SliderFrame.AbsolutePosition.X, 0, 244), 0, 15)}):Play()
					end)
					releaseconnection = uis.InputEnded:Connect(function(Mouse)
						if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
							Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 244) * script.Parent.Parent.Parent.SliderFrame.AbsoluteSize.X) + tonumber(minvalue))
							pcall(function()
								callback(Value)
							end)
							game:GetService('TweenService'):Create(script.Parent.Parent.Parent.SliderFrame, TweenInfo.new(0.1), {Size = UDim2.new(0, math.clamp(mouse.X - script.Parent.Parent.Parent.SliderFrame.AbsolutePosition.X, 0, 244), 0, 15)}):Play()
							script.Parent.Parent.Parent.SliderValue.Text = Value
							--script.Parent.Parent.Parent.SliderFrame.Size = UDim2.new(0, math.clamp(mouse.X - script.Parent.Parent.Parent.SliderFrame.AbsolutePosition.X, 0, 244), 0, 15)
							moveconnection:Disconnect()
							releaseconnection:Disconnect()
						end
					end)
				end)
			end
			coroutine.wrap(FSPBY_fake_script)()
		end
		
		function InnerPage:CheckBox(CheckBoxTitle,callback)
			callback = callback or function() end
			
			local CheckBox = Instance.new("Frame")
			local Toggle = Instance.new("ImageButton")
			local CheckBoxName = Instance.new("TextLabel")
			
			CheckBox.Name = "CheckBox"
			CheckBox.Parent = Page
			CheckBox.BackgroundColor3 = Color3.fromRGB(43, 43, 43)
			CheckBox.BorderSizePixel = 0
			CheckBox.Position = UDim2.new(0.0682593882, 0, 0, 0)
			CheckBox.Size = UDim2.new(0, 263, 0, 39)

			Toggle.Name = "Toggle"
			Toggle.Parent = CheckBox
			Toggle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Toggle.BorderSizePixel = 0
			Toggle.Position = UDim2.new(0.89353615, 0, 0.256410271, 0)
			Toggle.Size = UDim2.new(0, 19, 0, 19)
			Toggle.Image = "rbxassetid://8885587362"
			Toggle.ImageColor3 = Color3.fromRGB(255,79,79)
			
			CheckBoxName.Name = "CheckBoxName"
			CheckBoxName.Parent = CheckBox
			CheckBoxName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			CheckBoxName.BackgroundTransparency = 1.000
			CheckBoxName.Position = UDim2.new(0.0342205316, 0, 0, 0)
			CheckBoxName.Size = UDim2.new(0, 63, 0, 39)
			CheckBoxName.Font = Enum.Font.GothamSemibold
			CheckBoxName.Text = CheckBoxTitle
			CheckBoxName.TextColor3 = Color3.fromRGB(255, 255, 255)
			CheckBoxName.TextSize = 12.000
			CheckBoxName.TextXAlignment = Enum.TextXAlignment.Left
			
			local enabled = false
			Toggle.MouseButton1Click:Connect(function()
				if enabled == false then
					enabled = true
					local speed = 0.2
					local tf = TweenInfo.new(speed, Enum.EasingStyle.Sine , Enum.EasingDirection.In, 0)
					local ts = game:GetService("TweenService")
					local checktrue = Color3.fromRGB(144,255,96)	
					ts:Create(Toggle,tf, {ImageColor3 = checktrue}):Play()
				else
					enabled = false 
					local speed = 0.2
					local tf = TweenInfo.new(speed, Enum.EasingStyle.Sine , Enum.EasingDirection.Out, 0)
					local ts = game:GetService("TweenService")
					local checkfalse = Color3.fromRGB(255,79,79)	
					ts:Create(Toggle,tf, {ImageColor3 = checkfalse}):Play()
				end
				pcall(callback,enabled)
			end)
		end
		
		function InnerPage:Button(BtnName,callback)
			callback = callback or function() end
			local Button = Instance.new("ImageButton")
			local ButtonName = Instance.new("TextLabel")
			
			Button.Name = "Button"
			Button.Parent = Page
			Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Button.BorderSizePixel = 0
			Button.Size = UDim2.new(0, 263, 0, 39)
			Button.Image = "rbxassetid://8885587362"
			Button.ImageColor3 = Color3.fromRGB(43, 43, 43)
			
			Button.MouseButton1Click:Connect(function()
				pcall(callback)
			end)
			
			ButtonName.Name = "ButtonName"
			ButtonName.Parent = Button
			ButtonName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			ButtonName.BackgroundTransparency = 1.000
			ButtonName.Position = UDim2.new(0.0342205316, 0, 0, 0)
			ButtonName.Size = UDim2.new(0, 63, 0, 39)
			ButtonName.Font = Enum.Font.GothamSemibold
			ButtonName.Text = BtnName
			ButtonName.TextColor3 = Color3.fromRGB(255, 255, 255)
			ButtonName.TextSize = 12.000
			ButtonName.TextXAlignment = Enum.TextXAlignment.Left
		end
			return InnerPage
		end
	return PageManagement
end

return LIB
