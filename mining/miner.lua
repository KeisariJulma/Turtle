while true do
    event, username, message = os.pullEvent("chat") -- Will be fired when someone sends a chat message
    print(username.. " just wrote: ".. message) -- Prints "*User* just wrote: *Message*"
  end