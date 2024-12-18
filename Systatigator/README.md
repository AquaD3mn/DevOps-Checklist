# Server Stats Script

This script provides basic performance statistics for a Linux server. It analyzes the following server metrics:

- Total CPU usage
- Total memory usage (free vs used, with percentage)
- Total disk usage (free vs used, with percentage)
- Top 5 processes by CPU usage
- Top 5 processes by memory usage

## Requirements

- Linux-based server
- `mpstat` command (part of the `sysstat` package) for CPU usage analysis
- `ps` command for process stats
- `df` and `free` commands for disk and memory stats

### Install `sysstat` (for `mpstat` command)

If the `mpstat` command is not available on your server, you can install the `sysstat` package:

#### On Debian/Ubuntu:
\`\`\`
sudo apt-get install sysstat
\`\`\`

#### On CentOS/RedHat:
\`\`\`
sudo yum install sysstat
\`\`\`

## Usage

1. **Download or create the script:**
   Save the script provided in a file named `server-stats.sh`.

2. **Make the script executable:**
   Run the following command to make the script executable:
   \`\`\`
   chmod +x server-stats.sh
   \`\`\`

3. **Run the script:**
   Execute the script with the following command:
   \`\`\`
   ./server-stats.sh
   \`\`\`

4. **Output:**
   The script will output the following information:
   - Total CPU usage (percentage)
   - Memory usage (used vs total, with percentage)
   - Disk usage (used vs total, with percentage)
   - Top 5 processes consuming CPU
   - Top 5 processes consuming memory

## Example Output

\`\`\`
Total CPU usage:
85%

Total memory usage:
Used: 5.0G / Total: 8.0G (62%)

Total disk usage:
/dev/sda1 - Used: 10G / Total: 50G (20%)

Top 5 processes by CPU usage:
35%    /usr/bin/java
12%    /usr/bin/python3
...

Top 5 processes by memory usage:
25%    /usr/bin/java
15%    /usr/bin/python3
...
\`\`\`

## License

This script is released under the MIT License.
