local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local NPCConfig = require(ServerStorage:WaitForChild("config"):WaitForChild("NPCConfig"))
local OpenAIHandler = require(ServerScriptService:WaitForChild("OpenAIHandler"))

-- Create a RemoteEvent for client-server communication
local DialogueEvent = Instance.new("RemoteEvent")
DialogueEvent.Name = "DialogueEvent"
DialogueEvent.Parent = ReplicatedStorage

-- Server-side dialogue handling
DialogueEvent.OnServerEvent:Connect(function(player, message)
    local response = OpenAIHandler.generateResponse(message)
    DialogueEvent:FireClient(player, response)
end)

-- Create an NPC
local function createNPC()
    local npc = Instance.new("Part")
    npc.Name = NPCConfig.name
    npc.Size = NPCConfig.size
    npc.Position = NPCConfig.position
    npc.Anchored = true
    npc.Color = NPCConfig.color
    npc.Parent = workspace
    
    local proximityPrompt = Instance.new("ProximityPrompt")
    proximityPrompt.ObjectText = NPCConfig.objectText
    proximityPrompt.ActionText = NPCConfig.actionText
    proximityPrompt.Parent = npc
    
    return npc, proximityPrompt
end

local npc, proximityPrompt = createNPC()

print("AI Dialogue system with OpenAI integration set up successfully!")