Weave = LibStub("AceAddon-3.0"):NewAddon(
  "Weave", "AceComm", "AceSerializer"
);

function Weave:OnInitialize()
  self.db = LibStub("AceDB-3.0"):New("WeaveDB")
  self.RegisterComm("Weave", "OnCommReceived")
end

function Weave:Sync()
  for index, record in pairs(self.db.realm.craftData) do
    self.SendComm(record, "GUILD")
  end
end
