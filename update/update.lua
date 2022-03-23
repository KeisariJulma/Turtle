local url =
"https://raw.githubusercontent.com/jacob-pro/turtle-mining/master/miner.lua"
local response = http.get(url)
if response then
    local r = response.readAll()
    response.close()
    local file = fs.open("miner", "w")
    file.write(r)
    file.close()
    print("Success")
else
    print("Failure")
end