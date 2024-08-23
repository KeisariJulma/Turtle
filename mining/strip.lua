-- Example Lua script for CC: Tweaked

-- Function to ask for a parameter and return the value
function askParameter(prompt)
    -- Display the prompt to the user
    print(prompt)
    
    -- Read user input
    local input = read()
    
    -- Return the input value
    return input
end

-- Example usage
local paramName = askParameter("Please enter the name of the parameter:")
print("You entered: " .. paramName)
