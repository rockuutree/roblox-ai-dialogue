# Roblox AI Dialogue System with OpenAI Integration

This repository contains an advanced AI dialogue system for Roblox games, using OpenAI's GPT-3.5 model to generate dynamic responses.

## Features

- NPC with proximity-based interaction
- OpenAI-powered response generation
- Client-server communication
- Basic UI for dialogue

## Installation

1. Clone this repository or download the files.
2. In Roblox Studio, create the following structure:
   - In ServerScriptService, create two scripts:
     - "AIDialogueServer" and paste the content of `src/ServerScriptService/AIDialogueServer.lua`
     - "OpenAIHandler" and paste the content of `src/ServerScriptService/OpenAIHandler.lua`
   - In StarterPlayerScripts, create a script named "AIDialogueClient" and paste the content of `src/StarterPlayerScripts/AIDialogueClient.lua`.
   - In ServerStorage, create a folder named "config" and add a ModuleScript named "NPCConfig". Paste the content of `config/NPCConfig.lua`.
3. Replace "YOUR_OPENAI_API_KEY_HERE" in the OpenAIHandler script with your actual OpenAI API key.

## Usage

After installation, the system will automatically create an NPC in the workspace. Players can interact with the NPC by approaching it and triggering the proximity prompt. This will open a dialogue UI where players can type messages and receive AI-generated responses powered by OpenAI.

## Customization

- To modify the NPC appearance or position, edit the `NPCConfig.lua` file in the config folder.
- To adjust the OpenAI model parameters, edit the `OpenAIHandler.lua` file.
- For more advanced customization, you can modify the server and client scripts directly.

## Important Notes

- This system requires an active internet connection to function, as it sends requests to the OpenAI API.
- Be mindful of your OpenAI API usage and associated costs.
- Ensure that your use of the OpenAI API complies with OpenAI's use-case policies and Roblox's Terms of Service.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.# roblox-ai-dialogue
