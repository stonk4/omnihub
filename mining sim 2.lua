
--Discord Lib very sexy mexy taxi ui
local DiscordLib = loadstring(game:HttpGet "https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/discord")()

-- creates the window
local win = DiscordLib:Window("OmniHub | Mining Simulator 2 | Main | Player | teleports")

--local scripts
local plyr = game.Players.LocalPlayer


--creates a tab called Main sexy ooolalala
local serv = win:Server("Main", "")

--tab player already explained
local serv2 = win:Server("Player","")

--creates a section in the tab main called main starting to get it
local Main = serv:Channel("Main")

--Player related
local Player1 = serv2:Channel("Player Related", "")

--tab already explained
local Player2 = serv2:Channel("Command scripts", "")

--ima stop with these comments
local serv3 = win:Server("Teleports", "")

-- channel
local Teleport = serv3:Channel("World Teleports")






-- kind of laggy thing u see weird me out but ok
Main:Button(
	"Rejoin Game - click reconnect if asked",
	function()
		game:GetService'TeleportService':TeleportToPlaceInstance(game.PlaceId,game.JobId,game:GetService'Players'.LocalPlayer)
	end
)



--label
mething = serv:Channel("My Opinion")
--my opinions on exploiting
mething:Label("This Discord UI LIb is very hot!")
--dady chil
mething:Label("I dont advise exploiting and certainly using this script.")
--ching chong ching chang i see your mom and i think iam going to bang
mething:Label("This script was made for learning purposes.")
--common W
mething:Label("And this script will probably get you banned on the game!")
--another W so common
mething:Label("Please dont complain to me as i said its a Learning purpose.")
--again another one another W to common for freezeboi or stonk4 on github(same guy)
mething:Label("I also exploit on this game and create for personal use.")
--lol
mething:Label("That was it if u see this i say : 'be cautious.' ")
--haha big opinion it was now back to exploiting

Player1:Button(
    "Reset Character Button",
    function()
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end
)


--label
Player2:Label("Infinite Yield FE Command Script")



--button to ativate infinite yield
Player2:Button(
    "Tap to activate infinite yield ",
    function()   
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
)

--label
Player2:Label("CMD- X Script")

Player2:Button(
    "Tap to activate CMD - X",
    function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CMD-X/CMD-X/master/Source",true))()
    end
)











local selectedw
Teleport:Dropdown(
    "Checkpoint | World ",
    {"Hidden Treasure", "Frozen Depths", "Gloomy Basin","Molten Core", "The Underworld", "Crystal Cavern"},
    function(value)
        selectedw = value
    end

)


Teleport:Button(
    "Click to teleport to destination",
    function()
        if selectedw  then
            game:GetService("ReplicatedStorage").Events.Teleport:FireServer(selectedw)
        
        end
    end
)








