-- Finds the player meta table or terminates
local meta = FindMetaTable("Player")

if !meta then
    return
end


-- Blinds the player by setting view out into the void
function meta:Blind(bool)
    if !self:IsValid() then
        return
    end

    if SERVER then
        umsg.Start("SetBlind", self)
        if bool then
            umsg.Bool(true)
        else
            umsg.Bool(false)
        end
        umsg.End()
    elseif CLIENT then
        blind = bool
    end
end


-- Removes the player prop if it exists.
function meta:RemoveProp()
    -- If we are executing from client side or the player/player's prop isn't valid, terminate.
    if CLIENT || !self:IsValid() || !self.ph_prop || !self.ph_prop:IsValid() then
        return
    end

    self.ph_prop:Remove()
    self.ph_prop = nil
end
