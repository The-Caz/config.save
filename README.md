# config.save
A very *very* simple script for saving .config and .local/share files
## How to save folders configs and local/share
Running the *update.sh* will save any folders you've specified in the arrays at the top of the script. Arrays should be structured like this:

```bash
declare -a config_folders["folder_a", "folder_b", "folder_c"]
declare -a local_share_folders["folder_a", "folder_b", "folder_c"]
```
e.g.
```bash
declare -a config_folders["panel-colorizer", "kitty", "autostart"]
declare -a local_share_folders["albert", "kwin", "plasma"]
```
Folders are case-sensitive, so be mindful of that.

## Loading configs
Just run the *setup.sh* file from a terminal. That's it.
