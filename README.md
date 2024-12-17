# Log Archiver Script

This script archives and compresses log files from a specified directory into a timestamped `.tar.gz` file. It also logs the archive creation event for future reference.

## Usage

Run the script with the log directory as an argument:

    sudo ./log-archive.sh /var/log

### Arguments:
- `<log-directory>`: Path to the directory containing log files (e.g., `/var/log`).

## Features:
- Archives logs into a `tar.gz` file with a timestamp.
- Excludes `.journal` files and handles files that change during archiving.
- Saves the archive to the original user's home directory (`/home/<user>/log_archives`).
- Logs archive creation with a timestamp in `archive_log.txt`.

## Requirements:
- Bash
- `tar` command
- Sudo privileges for reading system logs

## License:
MIT
