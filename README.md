# godot-screen-manager
Godot Engine (v3.0) Screen Manager

## Running the example

1. Click start menu, type `Command Prompt`
1. Right-click `Command Prompt` and click on `Run as Administrator`
1. Run the commands below, assuming you checked out the repo into a `Documents\src\godot-screen-manager` directory.

*Windows*

```powershell
cd c:\Users\YOUR_USERNAME\Documents\src\godot-screen-manager\example
mklink /D addons c:\Users\YOUR_USERNAME\Documents\src\godot-screen-manager\addons
```

*Linux/Mac*

```bash
cd Documents/src/godot-screen-manager/example
ln -s ../addons
```

If you check out the main.gd, as of this writing, there's probably a good bit of cleanup that can be done to avoid DRY.

## File Backend

It seems that the `user://` path resolves to `C:\Users\YOUR_USERNAME\AppData\Roaming\Godot\app_userdata\Godot Screen Manager`.
