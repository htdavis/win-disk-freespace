# win-disk-freespace
DX APM Infrastructure Agent extension for Windows which reports free disk space as a rounded percentage.

The extension makes use of Windows PowerShell, so no addtional software requirements.

Follow the instructions in installinstructions.md to use the extension.

## Creating your own bundle versus the Release build
I'm providing a release build as a convenience.

You can certainly fork or download this repo to create your own, if you choose to do so.

When done, make sure you TAR GZIP the contents of the working folder and not the root level files (README, license, .gitignore). Do not include the root working folder (win-disk-freespace). This will cause ACC to reject the bundle and APMIA will fail to load it.
