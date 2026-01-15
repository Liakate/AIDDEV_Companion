# WORK IN PROGRESS!!!

# AIDDEV_Companion  
Authoritative Project Provider for AIDDEV

AIDDEV_Companion is the **source of truth** for project data and environment metadata.  
It acts as the bridge between your external development pipeline and the in‑game AIDDEV ecosystem.

Companion does **not** perform validation.  
It simply provides raw project data.

## Role in the Toolchain

AIDDEV_Companion → AIDDEV_DevTools → AIDDEV


### Companion  
Provides:
- Project files  
- Environment metadata  

### DevTools  
Validates the project  

### AIDDEV  
Analyzes the validated project  

## Features

### ✔ Project Injection API
Companion exposes:

```lua
AIDDEV_Companion:SetCurrentProject(project)
AIDDEV_Companion:GetCurrentProject()
```lua #added because it broke my colorcoding...

Projects follow this structure:

{
  files = {
    ["path/to/file.lua"] = {
      content = "file text",
    },
  }
}

### ✔ Environment Metadata

Companion provides:

    Realm

    Client build

    Ruleset

    Encoding

    Line endings

AIDDEV displays this in its environment banner.

### ✔ External Pipeline Integration

Companion is designed to be fed by:

    External build tools

    File watchers

    IDE plugins

    Export scripts

    Custom pipelines

How Companion Works

    External tools push project files into Companion

    Companion stores them in memory

    DevTools pulls the project from Companion

    If validated, DevTools forwards it to AIDDEV

Companion never touches AIDDEV directly.
When to Use Companion

Use Companion when you want to:

    Import a project into the game

    Update files dynamically

    Provide environment metadata

    Integrate external tools with AIDDEV

    Maintain deterministic, reproducible project loading

Companion is the ingestion layer.
Requirements

    AIDDEV_DevTools

    AIDDEV
	
