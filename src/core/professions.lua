WeaveProfessions = {}

function WeaveProfessions:GetCraftRecord()
  local recipes = {}
  local numCrafts = GetNumCrafts()
  if numCrafts == 0 then
    return nil
  end
  for i=1, numCrafts do
    local craftName, _, craftType = GetCraftInfo(i)
    if craftType ~= "header" then
      table.insert(recipes, craftName)
    end
  end
  return {
    name = GetCraftName(),
    recipes = recipes,
  }
end

function WeaveProfessions:GetTradeSkillRecord()
  local record = {
    name = GetTradeSkillLine(),
    recipes = {}
  }
  for i=1, GetNumTradeSkills() do
    local skillName, skillType = GetTradeSkillInfo(i)
    if skillType ~= "header" then
      table.insert(record.recipes, skillName)
    end
  end
  if record.name == "UNKNOWN" or #record.recipes == 0 then
    return nil
  end
  return record
end

function WeaveProfessions:GetOpenProfessionInfo()
  local record = self:GetTradeSkillRecord()
  if record then
    return record
  end
  return self:GetCraftRecord()
end

function WeaveProfessions:getOpenProfessionRecord()
  local record = self:GetOpenProfessionInfo()
  return {
    character = GetUnitName("player"),
    profession = record.name,
    timestamp = GetServerTime(),
    recipes = record.recipes,
  }
end
