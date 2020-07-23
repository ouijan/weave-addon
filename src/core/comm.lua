WeaveComm = {}

function WeaveComm:SendComm(data, channel, target)
  self.SendCommMessage("WeaveComm", self.Serialize(data), channel, target)
end

function WeaveComm:OnCommReceived(data)
  local record = self.Deserialize(data)
  local updated WCCStore:Upsert(self.db.realm.craftData, record)
  if updated then
    print("Updated: " .. record.character .. " (" .. record.profession .. ")")
  end
end
