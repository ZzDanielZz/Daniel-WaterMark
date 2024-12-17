# Daniel Advanced Watermark

A customizable watermark resource for FiveM servers that displays server information, player statistics, and player Steam profile pictures. This resource is designed to display important server details and player-specific information, such as their Steam profile picture, in a visually appealing manner.
<br><h3>Note: if your picture is in the requested size and still doesn't fit well try changing line 52 in /UserInterface-NUI/style.css</h3>

## Features

- Display server name and tagline.
- Show player Steam profile pictures.
- Display the player count on the server.
- Customize the background and text colors of the watermark.
- Handle player-loaded events and Steam profile updates dynamically.

## Requirements

- **QBCore**: Ensure you're running QBCore framework.
- **Steam API Key**: You need to set your own Steam Web API key to fetch player Steam profile pictures.

## Installation

1. **Download** or **Clone** the repository to your server resources folder.
2. **Add the resource** to your `server.cfg`:
    ```bash
    ensure Daniel-WaterMark
    ```
3. **Set your Steam API Key** in the `config.lua`:
    ```lua
    SteamWebAPI = "YOUR_STEAM_API_KEY"
    ```
4. **Customize** the server settings in `config.lua` (e.g., server name, logo, background color).

## Configuration

In `config.lua`, you can modify several options to tailor the watermark to your server’s needs.

```lua
DN = {
    PlayerLoaded = "QBCore:Client:OnPlayerLoaded",
    PlayerSpawned = "playerSpawned",
    ServerName = "Daniel - Development",
    SteamWebAPI = "F41E0B6911CB1F0F2F8E75D0B768F24A",
    DisplayLogo = true,
    -- Recommended Image Size 120x68
    ServerLogo = "https://cdn.discordapp.com/attachments/1313848598416592948/1313876009560313916/image.png?ex=6751b9e3&is=67506863&hm=12aeeb945943ce90f047fd8c65c05c56f0658701fe507b97e4e8c545c8a0eff6&",
    DefaultSteamPicture = "https://content.rustmaps.com/maps/262/760ddacceebe43fe9e463281758e7b21/map_raw_normalized.png",
    BackgroundColor = "#1a1a1a",
    TextColor = "#ffffff"
}
```
## Preview
<img src="https://i.imgur.com/0hrtwQE.png" alt="Preview">
