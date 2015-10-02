-- Send required files to client
AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")


-- Include needed files
include("shared.lua")


-- Called when the entity initializes
function ENT:Initialize()
    self:SetModel("models/player/Kleiner.mdl")
    self.health = 100
end


-- Called when we take damge
function ENT:OnTakeDamage(dmg)
    local pl = self:GetOwner()
    local attacker = dmg:GetAttacker()
    local inflictor = dmg:GetInflictor()

    -- Check if the attacker and the prop are valid players
    if pl && pl:IsValid() && pl:Alive() && pl:IsPlayer() && attacker:IsPlayer() && dmg:GetDamage() > 0 then
        -- Reduce the health of the prop
        self.health = self.health - dmg:GetDamage()
        pl:SetHealth(self.health)

        if self.health <= 0 then

            -- Kill and remove the prop
            pl:KillSilent()
            pl:RemoveProp()

            -- Find the hunter who got the kill
            if inflictor && inflictor == attacker && inflictor:IsPlayer() then
                inflictor = inflictor:GetActiveWeapon()
                if !inflictor || inflictor == NULL then
                    inflictor = attacker
                end
            end

            umsg.Start("PlayerKilledByPlayer")
                umsg.Entity(pl)
                umsg.String(inflictor:GetClass())
                umsg.Entity(attacker)
            umsg.End()

            MsgAll(attacker:Name() .. " found and killed " .. pl:Name() .. "\n")

            -- Give the hunter kill credit, and restore their health
            attacker:AddFrags(1)
            attacker:SetHealth(math.Clamp(attacker:Health() + GetConVar("HUNTER_KILL_BONUS"):GetInt(), 1, 100))

        end
    end
end
