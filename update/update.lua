local url =
"https://raw.githubusercontent.com/KeisariJulma/Turtle/master/mining/strip.lua"
local response = http.get(url)
if response then
    local r = response.readAll()
    response.close()
    local file = fs.open("strip", "w")
    file.write(r)
    file.close()
    print("Success")
else
    print("Failure")
end
