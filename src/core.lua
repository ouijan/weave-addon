WhoCanCraft = LibStub("AceAddon-3.0"):NewAddon(
  "WhoCanCraft", "AceComm", "AceSerializer"
);

function WhoCanCraft:OnInitialize()
  self.db = LibStub("AceDB-3.0"):New("WhoCanCraftDB")
  self.RegisterComm("WhoCanCraft", "OnCommReceived")
end

function WhoCanCraft:Sync()
  for index, record in pairs(self.db.realm.craftData) do
    self.SendComm(record, "GUILD")
  end
end
