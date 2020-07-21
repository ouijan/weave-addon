WhoCanCraft = LibStub("AceAddon-3.0"):NewAddon(
  "WhoCanCraft", "AceComm", "AceSerializer"
);

function WhoCanCraft:OnInitialize()
  self.db = LibStub("AceDB-3.0"):New("WhoCanCraftDB")
  self.RegisterComm("WhoCanCraft", "OnCommReceived")
end

function WhoCanCraft:Sync()
  -- Get all rows in this DB
  -- self.db.realm.craftData
  self.SendComm(row)
end

-- -----------------------------------
-- Communication
-- -----------------------------------
function WhoCanCraft:SendComm(data, channel, target)
  self.SendCommMessage("WhoCanCraft", self.Serialize(data), channel, target)
end

function WhoCanCraft:OnCommReceived(data)
  local data = self.Deserialize(data)
  -- Store in database
end

-- -----------------------------------
-- Crafting Data
-- -----------------------------------

function getProfessionData()
  return {
    name = '',
    profession = '',
    timestamp = '',
    recipes = {
      'Tasty Omlette',
      'Big Hat',
      'Orange Pencil Case',
    },
  }
end
