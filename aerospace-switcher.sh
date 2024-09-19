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

# Function to attempt focusing a window
focus_window() {
  local window_id="$1"
  aerospace focus --window-id "$window_id"
  return $?
}

# Try focusing windows until successful or all windows have been tried
for ((i=1; i<=${#window_ids[@]}; i++)); do
  next_index=$(( (current_index + i) % ${#window_ids[@]} ))
next_window_id="${window_ids[$next_index]}"

  if focus_window "$next_window_id"; then
    # Focus successful, exit the script
    exit 0
  fi
  # If focus fails, the loop continues to the next window
done

# If we've tried all windows and none could be focused, exit with an error
echo "Failed to focus any window"
exit 1
