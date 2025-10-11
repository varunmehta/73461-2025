# PantheraTech - 73461-2025
Team **PantheraTech** [`#73461`] for 2025 codebase

## Codebase
The code has 2 main folders [`/block`](/block) and [`python`](/python) for each type of code. For now the team is comfortable use block, and that is where all the code will reside.

> The team has decided to use block code

### `block code` 
The `llsp3` file exported from lego is a binary file. Which internally is a set of compressed files. 

#### `llsp3`

To see what's inside make a copy of the `llsp3` file, 
 * Rename the extension from `llsp3` to `zip`
 * Extract the `.zip` file
 * Contents of the `zip(llsp3)` file: 
    * `scratch.sb3` | Scratch-compatible editor file. This is also a binary file
    * `monitors.json` | state of the blocks in the UI, zoom level, and other details
    * `manifest.json` | bluetooth connection and hub info, last connection state
    * `icon.svg` | screenshot of what the block code looks like

##### `scratch.sb3`
The `scratch.sb3` is another binary file, rename the extension to `zip`, and extract the contents. It contains the `project.json` file, which has the final details of what the actual block-code makeup should look like.

## Mission Plans
Our mission planning is available under **[`/plans`](/plans)**

## BlockCode 
![/block/PantheraTech.svg](/block/PantheraTech.svg)
