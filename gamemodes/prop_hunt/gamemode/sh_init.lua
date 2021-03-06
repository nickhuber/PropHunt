-- Include the required lua files
include("sh_config.lua")
include("sh_player.lua")


-- Include the configuration for this map
if file.Exists("../gamemodes/prop_hunt/gamemode/maps/"..game.GetMap()..".lua", "LUA") || file.Exists("../lua_temp/prop_hunt/gamemode/maps/"..game.GetMap()..".lua", "LUA") then
    include("maps/"..game.GetMap()..".lua")
end


-- Fretta!
DeriveGamemode("fretta")
IncludePlayerClasses()


-- Information about the gamemode
GM.Name = "Prop Hunt"
GM.Author = "Modified by Rhakyr, based off of Kow@lski (Original by AMT)"
GM.Email = "kowalski.7cc@xspacesoft.com"
GM.Website = "https://github.com/nickhuber/PropHunt"


-- Help info
GM.Help = [[Prop Hunt is a twist on the classic backyard game Hide and Seek.

As a Prop you have ]]..GetConVar("HUNTER_BLINDLOCK_TIME"):GetInt()..[[ seconds to replicate an existing prop on the map and then find a good hiding spot. Press [E] to replicate the prop you are looking at. Your health is scaled based on the size of the prop you replicate.

You can press the left mouse button as a prop to lock your orientation, and the right mouse button to go back into free orientation.

As a Hunter you will be blindfolded for the first ]]..GetConVar("HUNTER_BLINDLOCK_TIME"):GetInt()..[[ seconds of the round while the Props hide. When your blindfold is taken off, you will need to find props controlled by players and kill them. Damaging non-player props will lower your health significantly. However, killing a Prop will increase your health by ]]..GetConVar("HUNTER_KILL_BONUS"):GetInt()..[[ points.

Both teams can press [F3] to play a taunt sound.]]


-- Fretta configuration
GM.AddFragsToTeamScore = true
GM.CanOnlySpectateOwnTeam = true
GM.Data = {}
GM.EnableFreezeCam = true
GM.GameLength = GAME_TIME
GM.NoAutomaticSpawning = true
GM.NoNonPlayerPlayerDamage = true
GM.NoPlayerPlayerDamage = false
GM.NoPlayerTeamDamage = true
GM.RoundBased = true
GM.RoundLimit = ROUNDS_PER_MAP
GM.RoundLength = ROUND_TIME
GM.RoundPreStartTime = 0
GM.SelectModel = false
GM.SuicideString = "couldn't take the pressure and committed suicide."
GM.TeamBased = true


-- Called on gamemode initialization to create teams
function GM:CreateTeams()
    if !GAMEMODE.TeamBased then
        return
    end

    TEAM_HUNTERS = 1
    team.SetUp(TEAM_HUNTERS, "Hunters", Color(150, 205, 255, 255))
    team.SetSpawnPoint(TEAM_HUNTERS, {"info_player_counterterrorist", "info_player_combine", "info_player_deathmatch", "info_player_axis"})
    team.SetClass(TEAM_HUNTERS, {"Hunter"})

    TEAM_PROPS = 2
    team.SetUp(TEAM_PROPS, "Props", Color(255, 60, 60, 255))
    team.SetSpawnPoint(TEAM_PROPS, {"info_player_terrorist", "info_player_rebel", "info_player_deathmatch", "info_player_allies"})
    team.SetClass(TEAM_PROPS, {"Prop"})
end
