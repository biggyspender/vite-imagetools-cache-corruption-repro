# imagetools build failure repro

Steps below reproduce the `vite-imagetools` build failure encountered in this repo when a large number of copied images are present.

## Prerequisites
- Node.js `v24.11.1`
- pnpm `10.22.0`
- A Bash shell (the repro script depends on Bash-specific features)

## Setup
1. Install dependencies with `pnpm i` from the repo root.

## Reproduction steps
1. Run `bash repro.sh` from the repo root.
	- The script clears the imagetools cache, generates ~2000 image copies under `src/images/temp`, and triggers `pnpm build`.
2. Wait for the build to finish; within a few minutes the process fails with:

	```text
	[imagetools] Could not load ... Input file contains unsupported image format
	```

The failure consistently reproduces after the script finishes preparing the image set and the build step runs.
