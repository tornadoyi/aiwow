
local class = Zerg.class
local DB = ZergDB
local Hole = class("Hole")
Zerg.Hole = Hole

function Hole:ctor()
    self.root = CreateFrame("Frame", "ZergFrame", UIParent)
    self.root:SetSize(DB.hole.width, DB.hole.height)
    self.root:SetPoint(DB.hole.anchor, 0, 0)

    self.texs = {}
    for w=0, DB.hole.width-1 do
        for h=0, DB.hole.height-1 do
            id = w * DB.hole.height + h
            fname = "f" .. id
            f = CreateFrame("Frame", fname, self.root)
            f:SetSize(1, 1)
            f:SetPoint("TOPLEFT", w, -h)
            f.background = f:CreateTexture()
            f.background:SetAllPoints()
            f.background:SetColorTexture(1, 0, 0, 1)
            table.insert(self.texs, f.background)
        end
    end

end


