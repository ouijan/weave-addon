WeaveDataSync = {}

function WeaveDataSync:IsNewest(aRecord, bRecord)
  if bRecord == nil then
    return false;
  end
  if aRecord == nil or bRecord.timestamp > aRecord.timestamp then
    return true;
  end
  return false;
end

function WeaveDataSync:GetKey(record)
  return record.character .. " " .. record.profession;
end

function WeaveDataSync:Upsert(db, record) {
  local key = self:GetKey(record);
  if not self:IsNewest(db[key], record) then
    return false;
  end
  db[key] = record;
  -- Should this remove OLD prfession data considering the 2 main profession limit?
  return true;
}
