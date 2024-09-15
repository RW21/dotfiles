#!/bin/bash

# Get the ID of the currently focused window
current_window_id=$(aerospace list-windows --focused --format %{window-id})

# Get a list of all window IDs in the current workspace, separated by newlines
window_ids_string=$(aerospace list-windows --workspace focused --format %{window-id})

# Convert the string of window IDs into an array
IFS=$'\n' read -d '' -ra window_ids <<< "$window_ids_string"


# Find the index of the current window in the list
current_index=0
for i in "${!window_ids[@]}"; do
  if [[ "${window_ids[$i]}" == "$current_window_id" ]]; then
    current_index=$i
    break
  fi
done

# Calculate the next window's index
next_index=$(( (current_index + 1) % ${#window_ids[@]} ))

# Get the next window's ID
next_window_id="${window_ids[$next_index]}"

# Focus the next window
aerospace focus --window-id "$next_window_id"
