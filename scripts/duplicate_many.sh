#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 3 ]; then
  echo "Usage: $(basename "$0") <source_path> <destination_dir> <count>" >&2
  exit 1
fi

source_path="$1"
destination_dir="$2"
count="$3"

if [ ! -e "$source_path" ]; then
  echo "Source path '$source_path' does not exist." >&2
  exit 1
fi

if ! [[ "$count" =~ ^[0-9]+$ ]]; then
  echo "Count must be a positive integer." >&2
  exit 1
fi

if [ "$count" -le 0 ]; then
  echo "Count must be greater than zero." >&2
  exit 1
fi

mkdir -p "$destination_dir"

base_name="$(basename "$source_path")"

make_copy() {
  local target_path="$1"
  if [ -e "$target_path" ]; then
    echo "Target '$target_path' already exists; aborting to avoid overwriting." >&2
    exit 1
  fi

  if [ -d "$source_path" ]; then
    cp -a "$source_path" "$target_path"
  else
    cp -a "$source_path" "$target_path"
  fi
}

if [ -d "$source_path" ]; then
  for ((i = 1; i <= count; i++)); do
    # Create numbered directory copies such as example_copy1
    target_dir="$destination_dir/${base_name}_copy${i}"
    make_copy "$target_dir"
  done
else
  filename_no_ext="${base_name%.*}"
  extension="${base_name##*.}"

  if [ "$extension" = "$base_name" ]; then
    extension=""
  else
    extension=".$extension"
  fi

  for ((i = 1; i <= count; i++)); do
    target_file="$destination_dir/${filename_no_ext}_copy${i}${extension}"
    make_copy "$target_file"
  done
fi
