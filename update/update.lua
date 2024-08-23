local url = "https://raw.githubusercontent.com/KeisariJulma/Turtle/master/mining/strip.lua"
local response = http.get(url)

if response then
    local r = response.readAll()
    response.close()
    
    -- Extract file name from the URL
    local fileName = url:match("^.+/(.+)$") or "downloaded_file"
    
    local file = fs.open(fileName, "w")
    file.write(r)
    file.close()
    
    print("Success: File '" .. fileName .. "' has been downloaded.")
else
    print("Failure: Could not fetch the file from the URL.")
end
