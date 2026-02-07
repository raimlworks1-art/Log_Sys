--[[
    
    Logging System
    by Rai
    
    IDFK ;-;
    
    Namespace
        Log
          - Types
             S -> Sucess
             F -> Failed
             W -> Warning
        
    Funcs
        Log.log() -> T : Log.Types, M -> string, ... : any
        
        Log.Utils.WaitFor() -> V : Variable / Vars {Table}
        
    API
        Enabled -> Bool
        Vars -> {}
        
    
]]--

local Log = {
  Types = {
   S = { Name = "Success", Color = "0,255,0" },
   F = { Name = "Failed",  Color = "255,0,0" },
   W = { Name = "Warning", Color = "255,165,0" }
  }, 
  
  Utils = {
    
  },
  
  API = {
     Enabled = false, -- Disabled | Doesn't Work Yet
     Vars = {
         
     }
  }
}

function Change() 
    game:GetService("RunService").Heartbeat:Connect(function()
    	if game:GetService("CoreGui"):FindFirstChild("DevConsoleMaster") then 
	        for _, v in pairs(game:GetService("CoreGui"):FindFirstChild("DevConsoleMaster"):GetDescendants()) do 
	            if v:IsA("TextLabel") then 
	                v.RichText = true 
	            end 
	        end 
	    end
    end)
end

Log.Utils.WaitFor = function(V, key)
    -- If API.Enabled is true then it will use these to wait if the var is true
    -- Currently Doesn't work
    if type(V) == "table" then
        if key then
            while not V[key] do
                task.wait(0)
            end
        else
            local AT = false
            while not AT do
                AT = false
                for _, v in pairs(V) do
                    if v then
                        AT = true
                        break
                    end
                end
                task.wait(0)
            end
        end
        return true
    end

    -- Okay So if API.Enabled is false then this will be the fallback
        while not V() do
            task.wait(0)
         end
    return true
end

Log.log = function(T, M, ...)
    local init, err = pcall(Change)
    
    if not init then 
      warn(err)
      return
    end

    local Type = Log.Types[T]
    if not Type then
        warn("Unexpected Type | " .. tostring(T))
        return
    end

    local OP =
        '<font color="rgb(' .. Type.Color .. ')">[' ..
        Type.Name ..
        ']</font> ' .. tostring(M)

    print(OP, ...)
end

return Log   
