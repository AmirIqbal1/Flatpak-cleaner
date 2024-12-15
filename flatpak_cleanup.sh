#!/bin/bash

# Script to clean up and optimize Flatpak on Linux

# Function to display a header
echo_header() {
  echo "====================================="
  echo "$1"
  echo "====================================="
}

# Step 1: List all Flatpak applications and runtimes
echo_header "Listing installed Flatpak applications and runtimes"
flatpak list
flatpak list --runtime

# Step 2: Uninstall unused Flatpak runtimes
echo_header "Uninstalling unused Flatpak runtimes"
flatpak uninstall --unused -y

# Step 3: Clean Flatpak cache and logs
echo_header "Repairing Flatpak to clean logs and caches"
flatpak repair -y

# Step 4: Update Flatpak applications and runtimes
echo_header "Updating Flatpak applications and runtimes"
flatpak update -y

# Step 5: Remove old versions of Flatpak apps
echo_header "Removing old versions of Flatpak applications"
flatpak uninstall --old -y

# Step 6: Display current Flatpak disk usage
echo_header "Current Flatpak disk usage"
flatpak list --app --columns=name,size

# Final message
echo_header "Flatpak cleanup completed!"
