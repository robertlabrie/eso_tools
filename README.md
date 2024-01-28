"# eso_tools" 

@robertlabrie collection of powershell tools for rummaging through ESO LUA

## Installation
Run install_dll.ps1 to get NLua and its dependency Keralua from nuget. ESO is pinned at LUA 5.1 but we use LUA 5.4 which is fine since we're not running the ESO client runtime just parsing saved vars.

## Scripts
* TraitBuddy.ps1 - Goes through traitbuddy saved vars and generates a list of how many characters across all known accounts have a specific research line and trait researched