#!/usr/bin/env bash

# The path to the temporary icon resource to write to the application
TEMP_RESOURCE_PATH="$(mktemp -d)/"tmpicns.rsrc

# Iterate over the .icns icons to apply to the corresponding applications
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
		echo "Skipping $icon_path; $app_path does not exist"
		continue
	fi

	echo "Applying $icon_path -> $app_path"

	# Set the proxy icon for this icon file to be its rendered preview (this
	# overwrites the default "ICNS"/"PNG" proxy icon with the actual icon)
	sips -i "$icon_path" > /dev/null

	# Create a temporary icon resource from the original icon file
	DeRez -only icns "$icon_path" > "$TEMP_RESOURCE_PATH"

	# Set permissions of application to give admin user access
	sudo chown "$USER":staff "$app_path"

	# Reset the icon for the application
	rm -rf "$app_path"/$'Icon\r'
	# Append this temporary icon resource to the app to be iconized
	Rez -append "$TEMP_RESOURCE_PATH" -o "$app_path"/$'Icon\r' > /dev/null

	# Set the icon for the aplication using this temporary resource
	SetFile -a C "$app_path" > /dev/null
	SetFile -a V "$app_path"/$'Icon\r' > /dev/null

	# Validate that the code signing on this application is still valid
	codesign --verify "$app_path"

done

# Remove temporary resource file; it is no longer needed
rm -f "$TEMP_RESOURCE_PATH"
