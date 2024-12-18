#!/bin/bash

# Script to archive and compress logs into a tar.gz file with a timestamped name

# Check if a log directory is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

# Variables
LOG_DIR="$1"                      # Log directory provided as an argument
ARCHIVE_DIR="log_archives"        # Directory to store compressed archives
TIMESTAMP=$(date +"%Y%m%d_%H%M%S") # Current timestamp for file naming
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz" # Name of the archive file
ARCHIVE_LOG="archive_log.txt"     # Log file to track archiving

# Verify if the log directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory '$LOG_DIR' does not exist."
    exit 1
fi

# Create the archive storage directory if it doesn't exist
ARCHIVE_PATH="/home/${SUDO_USER:-$USER}/${ARCHIVE_DIR}"
mkdir -p "$ARCHIVE_PATH"

# Compress the logs
#tar -czf "${ARCHIVE_PATH}/${ARCHIVE_NAME}" -C "$LOG_DIR" . --exclude="*.journal" --warning=no-file-changed
tar --exclude="*.journal" --warning=no-file-changed --ignore-failed-read -czf "${ARCHIVE_PATH}/${ARCHIVE_NAME}" -C "$LOG_DIR" .


# Check if compression was successful
if [ $? -eq 0 ]; then
    echo "Logs compressed successfully: ${ARCHIVE_PATH}/${ARCHIVE_NAME}"
else
    echo "Error: Failed to compress logs."
    exit 1
fi

# Log the archive creation with timestamp
echo "$(date +"%Y-%m-%d %H:%M:%S") - Archive created: ${ARCHIVE_NAME}" >> "${ARCHIVE_PATH}/${ARCHIVE_LOG}"
echo "Archive log updated: ${ARCHIVE_PATH}/${ARCHIVE_LOG}"
