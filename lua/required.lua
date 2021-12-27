for k in pairs(package.loaded) do
    if k:match("^tools") then
        package.loaded[k] = nil end end
