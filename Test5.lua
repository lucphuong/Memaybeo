pcall(function()
    local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Orion/main/source"))()
    local Window = OrionLib:MakeWindow({
        Name = "🌙 Soliar Hub | By chat gpt",
        HidePremium = false,
        SaveConfig = false,
        ConfigFolder = "SoliarHub"
    })

    local Main = Window:MakeTab({
        Name = "⚙️ Main",
        Icon = "rbxassetid://4483345998",
        PremiumOnly = false
    })

    OrionLib:MakeNotification({
        Name = "Soliar Hub",
        Content = "🌙 Hub đã khởi động thành công!",
        Time = 3
    })

    local UIS = game:GetService("UserInputService")
    UIS.InputBegan:Connect(function(input, gp)
        if not gp and input.KeyCode == Enum.KeyCode.RightShift then
            OrionLib:ToggleUI()
            OrionLib:MakeNotification({
                Name = "Menu",
                Content = "🔁 Đã toggle menu!",
                Time = 2
            })
        end
    end)

    Main:AddButton({
        Name = "🕊️ Fly v3",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/XNEOFF/FlyGuiV3/main/FlyGuiV3.txt"))()
            OrionLib:MakeNotification({
                Name = "Fly v3",
                Content = "✅ Đã bật Fly GUI V3",
                Time = 2
            })
        end
    })

    Main:AddButton({
        Name = "⚡ Jump & Speed",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/lucphuong/Bloxfruit/refs/heads/main/Jumpspeed.lua"))()
            OrionLib:MakeNotification({
                Name = "Jump & Speed",
                Content = "✅ Đã bật chỉnh Jump + Speed",
                Time = 2
            })
        end
    })

    local noclipEnabled = false
    Main:AddToggle({
        Name = "🚫 Noclip",
        Default = false,
        Callback = function(state)
            noclipEnabled = state
            local player = game.Players.LocalPlayer
            local char = player.Character or player.CharacterAdded:Wait()
            local conn
            if state then
                OrionLib:MakeNotification({
                    Name = "Noclip",
                    Content = "✅ Đã bật Noclip",
                    Time = 2
                })
                conn = game:GetService("RunService").Stepped:Connect(function()
                    for _,v in pairs(char:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.CanCollide = false
                        end
                    end
                end)
                char.AncestryChanged:Connect(function(_, parent)
                    if not parent and conn then conn:Disconnect() end
                end)
            else
                OrionLib:MakeNotification({
                    Name = "Noclip",
                    Content = "❌ Đã tắt Noclip",
                    Time = 2
                })
                if conn then conn:Disconnect() end
            end
        end
    })

    local infJump = false
    Main:AddToggle({
        Name = "🌀 Infinite Jump",
        Default = false,
        Callback = function(state)
            infJump = state
            OrionLib:MakeNotification({
                Name = "Infinite Jump",
                Content = state and "✅ Bật Infinite Jump" or "❌ Tắt Infinite Jump",
                Time = 2
            })
            local plr = game.Players.LocalPlayer
            local UIS = game:GetService("UserInputService")
            UIS.JumpRequest:Connect(function()
                if infJump and plr.Character and plr.Character:FindFirstChildOfClass("Humanoid") then
                    plr.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
                end
            end)
        end
    })

    Main:AddButton({
        Name = "🖱️ Click TP",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/lucphuong/Bloxfruit/refs/heads/main/Clicktp.lua"))()
            OrionLib:MakeNotification({
                Name = "Click TP",
                Content = "✅ Đã bật Click Teleport",
                Time = 2
            })
        end
    })

    Main:AddButton({
        Name = "🔁 Rejoin Server",
        Callback = function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/lucphuong/Bloxfruit/refs/heads/main/Rejoinsever.lua"))()
            OrionLib:MakeNotification({
                Name = "Rejoin",
                Content = "🔄 Đang rejoin server...",
                Time = 2
            })
        end
    })

    OrionLib:Init()
end)
