local HttpService = game:GetService("HttpService")

local OpenAIHandler = {}

local API_KEY = "YOUR_OPENAI_API_KEY_HERE" -- Replace with your actual API key
local API_URL = "https://api.openai.com/v1/chat/completions"

function OpenAIHandler.generateResponse(prompt)
    local headers = {
        ["Content-Type"] = "application/json",
        ["Authorization"] = "Bearer " .. API_KEY
    }

    local data = {
        model = "gpt-3.5-turbo",
        messages = {
            {role = "system", content = "You are a helpful AI assistant in a Roblox game."},
            {role = "user", content = prompt}
        },
        max_tokens = 150,
        temperature = 0.7
    }

    local success, response = pcall(function()
        return HttpService:RequestAsync({
            Url = API_URL,
            Method = "POST",
            Headers = headers,
            Body = HttpService:JSONEncode(data)
        })
    end)

    if success and response.Success then
        local responseData = HttpService:JSONDecode(response.Body)
        return responseData.choices[1].message.content
    else
        warn("Failed to get response from OpenAI:", response)
        return "I'm sorry, I couldn't process that request."
    end
end

return OpenAIHandler