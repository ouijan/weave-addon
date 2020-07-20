WhoCanCraft = LibStub("AceAddon-3.0"):NewAddon("WhoCanCraft")

function WhoCanCraft:OnInitialize()
  self.db = LibStub("AceDB-3.0"):New("WhoCanCraftDB")
end
