#!/usr/bin/env bash

# Iterate over the .icns icons corresponding to the applications to be reset
for icon_path in "$@"; do

	# If this supplied argument maps to a directory, recursively process the
	# icons in that directory by calling this same script
	if [ -d "$icon_path" ]; then
		# The %/ syntax strips the leading slash from the directory path
		"$0" "${icon_path%/}"/*.icns
		continue
	fi

	icon_filename="$(basename "$icon_path")"
	app_name="${icon_filename%.*}"
	app_path="/Applications/$app_name.app"

	# Skip this icon if the corresponding app does not exist
	if [ ! -e "$app_path" ]; then
		echo "Skipping $app_path; does not exist"
		continue
	fi

	echo "Resetting $app_path"

	# Set permissions of application to give admin user access
	sudo chown "$USER":staff "$app_path"

	# Reset the icon for the application
	rm -rf "$app_path"/$'Icon\r'

	# Set the icon for the aplication using this temporary resource
	SetFile -a c "$app_path" > /dev/null

done
