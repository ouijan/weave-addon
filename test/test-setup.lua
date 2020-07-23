function relRequire(relPath)
   local dirPath = debug.getinfo(2, "S").source:sub(2):match("(.*/)")
   return require(dirPath .. relPath);
end
