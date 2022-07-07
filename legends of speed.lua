-- script for anyone -->  loadstring(game:HttpGet("https://pastebin.com/raw/zh8P7d4x", true))()


--xHeptc ui kavo ui lib very sexy lib
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

-- Legends of speed when Peasants of power walk in
local Window = Library.CreateLib("OmniHub - Legends of Speed", "DarkTheme")

--getgenv() is the best say ong it isnt
getgenv().OrbCollector = false
getgenv().HoopCollector = false
getgenv().AutoRebirth = false

--functions -- orbcollector
function orbCollector()
	spawn(function()
		local PlayerHead = game.Players.LocalPlayer.Character.Head
		while wait() do
			if not getgenv().OrbCollector then break end
			for i, v in pairs(game:GetService("Workspace").orbFolder.City:GetDescendants()) do
				if v.Name == "TouchInterest" and v.Parent then
					firetouchinterest(PlayerHead, v.Parent, 1)
					wait(0.05)
					firetouchinterest(PlayerHead, v.Parent, 0)
					break
				end
			end
		end
	end)
end

--functions -- hoopCollector more risky then orbcollector
function hoopcollector()
	spawn(function()
		local PlayerHead = game.Players.LocalPlayer.Character.Head
		while wait() do
			if not getgenv().HoopCollector then break end
			for i, v in pairs(game:GetService("Workspace").Hoops:GetDescendants()) do
				if v.Name == "TouchInterest" and v.Parent then
					firetouchinterest(PlayerHead, v.Parent, 1)
					wait(0.05)
					firetouchinterest(PlayerHead, v.Parent, 0)
						
				end
			end
		end
	end)
end

--functions -- autorebirth
function autoreb()
	spawn(function()
		while getgenv().AutoRebirth == true do
			local args = {[1] = "rebirthRequest"}
			game:GetService("ReplicatedStorage").rEvents.rebirthEvent:FireServer(unpack(args))	
			wait()
		end
	end)
end

--player function pos
function TPTO(placeCFrame)
	local plyr = game.Players.LocalPlayer
	if plyr.Character then
		plyr.Character.HumanoidRootPart.CFrame = placeCFrame
	end
end	

--function --tps
function TPother(areas)
	if game:GetService("Workspace").areaTeleportParts:FindFirstChild(areas) then
		TPTO(game:GetService("Workspace").areaTeleportParts[areas].CFrame)
	end
end

--functions --tp to crystal
function TPegg(crystal)
	if game:GetService("Workspace").mapCrystalsFolder:FindFirstChild(crystal) then
		TPTO(game:GetService("Workspace").mapCrystalsFolder[crystal].containerNamePart.CFrame)
	end
end





--main tab and section
local tab = Window:NewTab("Main")
local MainSection = tab:NewSection("Main")

--Player Tab and section
local tab = Window:NewTab("Player")
local PlayerSection = tab:NewSection("Player")

--Autofarm tab and section
local tab  = Window:NewTab("AutoFarm")
local AutoFarmSection = tab:NewSection("AutoFarm")

--teleport tab and section
local tab = Window:NewTab("Teleport")
local Teleport1Section = tab:NewSection("AreaTeleport")
local Teleport2Section = tab :NewSection("Crystal teleport")
local TeleportSection = tab:NewSection("Teleport to gem chests")

--credit tab and section
local tab = Window:NewTab("Credits")
local CreditSection = tab:NewSection("Credits")




--Toggle UI keybind
MainSection:NewKeybind("Toggle UI Keybind", "This keybind toggles the OmniHub GUI OFF/ON", Enum.KeyCode.Insert, function()
		Library:ToggleUI()
end)

--Button to rejoin current game
MainSection:NewButton("Rejoin", "Rejoins your game", function()
	game:GetService("TeleportService"):Teleport(game.PlaceId, game:GetService("Players").LocalPlayer)
end)


--Walkspeed Slider
PlayerSection:NewSlider("Walkspeed", "Walkspeed", 500, 50, function(s)
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)



--Jumppower Slider
PlayerSection:NewSlider("Jumppower", "Jumppower", 500, 50, function(s)
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

--Jumppower and walkspeed Resetter 
PlayerSection:NewButton("Reset Jumppower and Walkspeed", "Resets Jumppower and Walkspeed", function()
	game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
	game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
end)

--Toggle to autofarm orbs in the city
AutoFarmSection:NewToggle("City Orb Farm less OP less risk","City orb farm less OP less risk", function(bool)
	getgenv().OrbCollector = bool
	print("City Orb Farm is ", bool)
	if bool then 
		orbCollector()
	end
end)

--toggle to auto hoop farm
AutoFarmSection:NewToggle("City Hoop farm More OP More Risk","City Hoop Farm More OP more risk", function(bool)
	getgenv().HoopCollector = bool
	print("City hoop Farm is ", bool)
	if bool then 
		hoopcollector()
	end
end)

--toggle to auto rebirth
AutoFarmSection:NewToggle("AutoRebirth (with a city farm !OP!)", "Autorebirths when reaching max level", function(bool)
	getgenv().AutoRebirth = bool
	print("Autorebirth is ", bool)
	if bool then
		autoreb()
	end
end)

local selectedtp
-- button to teleport to enchanted chest
TeleportSection:NewButton("Enchanted Gem Chest ", "im not robot", function()
TPTO(game:GetService("Workspace").enchantedChest.circleInner.CFrame)

end)

--button to teleport to goldenchest
TeleportSection:NewButton("Golden Gem Chest ", "im not robot", function()
TPTO(game:GetService("Workspace").goldenChest.circleInner.CFrame)

end)

--button to teleport to groupRewardsCircle
TeleportSection:NewButton("Groups Reward chest", "im not robot", function()
TPTO(game:GetService("Workspace").groupRewardsCircle.circleInner.CFrame)

end)

--button to teleport to magmachest
TeleportSection:NewButton("Magma Gem Chest ", "im not robot", function()
TPTO(game:GetService("Workspace").magmaChest.circleInner.CFrame)
end)

--local selectedarea is my bussiness
local selectedarea

--teleport dropdown 
Teleport1Section:NewDropdown("Area teleports last course/cave/city is the tp", "THE LAST COURSE/CAVE/CITY IS THE ONE WHERE YOU GET TPED TO", {"frostCourseToCity","cityToGrassCourse", "cityToMysteriousCave", "cityToParkourChallenge", "electroCaveToLegendsHighway", "electroCaveToMagmaCity", "infernoCaveToSnowCity", "magmaCityToInfernoCave", "magmaCityToElectroCave", "snowCityToPirateCourse"},function(value)
	selectedarea = value
end)

--click this button to teleport to you chosen area	
Teleport1Section:NewButton("Click here to teleport to chosen destination", "Title explains itself", function()
	TPother(selectedarea)
end)

--local my bussiness
local selectedcrystal

--teleport dropdown to crystals
Teleport2Section:NewDropdown("Crystal egg teleports", "title explains itself", {"Blue Crystal","Electro Legends Crystal","Inferno Crystal","Lava Crystal", "Lightning Crystal", "Purple Crystal", "Red Crystal","Snow Crystal", "Yellow Crystal" }, function(value)
	selectedcrystal = value
end)

Teleport2Section:NewButton("Click to teleport to your chosen Crystal", "TITLE EXPLAINS ITSELF AGAAIN AAAARGH", function()
	TPegg(selectedcrystal)
end)

--Credit section to honor my self and wYn#0001 void-scripts
CreditSection:NewLabel("-Dev freezeboi(roblox) stonk4(github) (same guy)")

--Credit section to honor wYn#0001 void-scripts
CreditSection:NewLabel("-Tutorials from wYn#0001 void-scripts (HOT!)")

