# Roblox Logging System

A lightweight, color-coded logging utility for Roblox development with rich text support in the developer console.

## Features

- **Color-Coded Logs**: Visual distinction between success, failure, and warning messages
- **Rich Text Support**: Automatic integration with Roblox's developer console
- **Utility Functions**: Built-in waiting utilities for variable initialization
- **Extensible API**: Modular design for future enhancements

## Installation

1. Create a ModuleScript in your Roblox project
2. Copy the logging system code into the ModuleScript
3. Require the module in your scripts:

```lua
local Log = require(path)
```

## Usage

### Basic Logging

The logging system supports three log types:

```lua
-- Success log (green)
Log.log("S", "Operation completed successfully")

-- Failed log (red)
Log.log("F", "Operation failed")

-- Warning log (orange)
Log.log("W", "Potential issue detected")
```

### Logging with Additional Parameters

You can pass additional values to be logged:

```lua
Log.log("S", "Player joined", player.Name, player.UserId)
Log.log("F", "Invalid input", inputValue, expectedType)
```

### WaitFor Utility

Wait for a function to return true:

```lua
-- Wait for a function condition
Log.Utils.WaitFor(function()
    return game:IsLoaded()
end)

-- Wait for a table key (API mode, currently disabled)
Log.Utils.WaitFor(myTable, "isReady")
```

## API Reference

### Log Types

| Type | Name | Color | Description |
|------|------|-------|-------------|
| `S` | Success | Green (0,255,0) | Successful operations |
| `F` | Failed | Red (255,0,0) | Failed operations or errors |
| `W` | Warning | Orange (255,165,0) | Warnings or potential issues |

### Functions

#### `Log.log(T, M, ...)`

Logs a message with the specified type.

**Parameters:**
- `T` (string): Log type - "S", "F", or "W"
- `M` (string): Main message to log
- `...` (any): Additional values to include in the log

**Returns:** None

**Example:**
```lua
Log.log("S", "Database connected", connectionTime)
```

#### `Log.Utils.WaitFor(V, key)`

Waits for a condition to be met.

**Parameters:**
- `V` (function|table): Function that returns boolean or table to monitor
- `key` (string, optional): Specific key to wait for in table mode

**Returns:** `true` when condition is met

**Example:**
```lua
-- Function mode
Log.Utils.WaitFor(function()
    return workspace:FindFirstChild("SpawnPoint")
end)
```

### API Configuration

```lua
Log.API = {
    Enabled = false,  -- API mode (table-based waiting)
    Vars = {}         -- Variables storage
}
```

**Note:** API mode is currently disabled and under development.

## How It Works

The logging system automatically:
1. Enables RichText on all developer console TextLabels
2. Formats messages with color-coded prefixes
3. Outputs to Roblox's built-in console with enhanced visibility

## Requirements

- Roblox Studio or Roblox Game Environment
- Access to `CoreGui` for console modifications

## Limitations

- API mode (`Log.API.Enabled`) is not yet functional
- Requires developer console to be open for visual effects
- RichText colors only visible in Roblox's developer console

## Author

Created by **Rai**

## License

This project is provided as-is for use in Roblox projects.

---

**Version:** 1.0  
**Last Updated:** 2026
