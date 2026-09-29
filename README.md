# Flashbang System

A realistic flashbang system for FiveM with configurable effects and cooldowns.

## Features

- Realistic flashbang effects that blind players for a configurable duration
- Configurable range, duration, and cooldown for flashbangs
- Cooldown system to prevent abuse

## Requirements

- FiveM server
- ESX Legacy framework

## Installation

1. Download the script
2. Place the `flashbangs` folder in your FiveM server's `resources` directory
3. Add `ensure flashbangs` to your server.cfg

## Usage

- Players can use the `/flashbang` command to activate a flashbang
- The flashbang will blind all players within the configured range for the specified duration
- Players must wait for the cooldown period before using another flashbang

## Configuration

The script can be configured in the `config.lua` file:

```lua
Config = {}
Config.FlashbangDuration = 5 -- Duration in seconds the flashbang effect lasts
Config.FlashbangRange = 10.0 -- Range in meters the flashbang affects
Config.FlashbangCooldown = 30 -- Cooldown in seconds before another flashbang can be used
```

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=flashbang-system&utm_content=bottom) — describe it in one sentence and get the full source code.