-- Props will not be able to become these models
BANNED_PROP_MODELS = {
    "models/props/cs_assault/dollar.mdl",
    "models/props/cs_assault/money.mdl",
    "models/props/cs_office/snowman_arm.mdl"
}


-- Maximum time (in minutes) for this fretta gamemode (Default: 30)
GAME_TIME = 30

-- Number of seconds hunters are blinded/locked at the beginning of the map (Default: 30)
CreateConVar("HUNTER_BLINDLOCK_TIME", "30", FCVAR_REPLICATED)

--Create the convars here
-- Health points removed from hunters when they shoot  (Default: 5)
CreateConVar("HUNTER_FIRE_PENALTY", "5", FCVAR_REPLICATED)

-- How much health to give back to the Hunter after killing a prop (Default: 20)
CreateConVar("HUNTER_KILL_BONUS", "20", FCVAR_REPLICATED)

--Whether or not we include grenade launcher ammo (default: 1)
CreateConVar("WEAPONS_ALLOW_GRENADE", "1", FCVAR_REPLICATED)

-- If you loose one of these will be played
-- Set blank to disable
LOSS_SOUNDS = {
    "vo/announcer_failure.wav",
    "vo/announcer_you_failed.wav"
}


-- Sound files hunters can taunt with
-- You need at least 2 files listed here
HUNTER_TAUNTS = {
    "taunts/hunters/1.wav",
    "taunts/hunters/2.wav"
}


-- Sound files props can taunt with
-- You need at least 2 files listed here
PROP_TAUNTS = {
    "taunts/props/1.wav",
    "taunts/props/2.wav",
    "taunts/props/3.wav",
    "taunts/props/4.wav",
    "taunts/props/5.wav",
    "taunts/props/6.wav",
    "taunts/props/7.wav",
    "taunts/props/8.wav",
    "taunts/props/9.wav",
    "taunts/props/10.wav",
    "taunts/props/11.wav",
    "taunts/props/12.wav",
    "taunts/props/13.mp3",
    "taunts/props/14.wav",
    "taunts/props/15.wav",
    "taunts/props/16.wav",
    "taunts/props/17.mp3",
    "taunts/props/18.wav",
    "taunts/props/19.wav",
    "taunts/props/20.wav",
    "taunts/props/21.wav",
    "taunts/props/22.wav",
    "taunts/props/23.wav",
    "taunts/props/24.wav",
    "taunts/props/25.wav",
    "taunts/props/26.wav",
    "taunts/props/27.wav",
    "taunts/props/28.wav",
    "taunts/props/29.wav",
    "taunts/props/30.wav",
    "taunts/props/31.mp3",
    "taunts/props/32.mp3",
    "taunts/props/33.mp3",
    "taunts/props/34.mp3",
    "taunts/props/35.mp3",
    "taunts/props/36.mp3",
    "taunts/props/37.mp3",
    "taunts/props/38.mp3",
    "taunts/props/39.mp3",
    "taunts/props/40.mp3",
}


-- Seconds a player has to wait before they can taunt again (Default: 5)
TAUNT_DELAY = 3


-- Rounds played on a map (Default: 10)
ROUNDS_PER_MAP = 10


-- Time (in seconds) for each round (Default: 300)
ROUND_TIME = 300


-- Determains if players should be team swapped every round [0 = No, 1 = Yes] (Default: 1)
SWAP_TEAMS_EVERY_ROUND = 1


-- If you win, one of these will be played
-- Set blank to disable
VICTORY_SOUNDS = {
    "vo/announcer_success.wav",
    "vo/announcer_victory.wav",
    "vo/announcer_we_succeeded.wav"
}
