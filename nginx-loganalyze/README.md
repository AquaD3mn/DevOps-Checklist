# Log Analysis Script

This script automates the process of analyzing an Nginx access log file to extract the following information:

- Top 5 IP addresses with the most requests
- Top 5 most requested paths
- Top 5 response status codes
- Top 5 user agents

## Requirements

- Bash
- `curl` command to fetch the log file

## How to Use

1. Download or clone the repository.
2. Make the script executable:
   chmod +x log_analysis.sh
3. Run the script:
   ./log_analysis.sh
4. The script will download the log file, analyze the data, and display the top 5 results for each category.

## Example Output

Top 5 IP addresses with the most requests:
45.76.135.253 - 1000 requests
142.93.143.8 - 600 requests
...

Top 5 most requested paths:
/api/v1/users - 1000 requests
/api/v1/products - 600 requests
...

Top 5 response status codes:
200 - 1000 requests
404 - 600 requests
...

Top 5 user agents:
Mozilla/5.0 (Windows NT 10.0; Win64) - 500 requests
Mozilla/5.0 (X11; Linux x86_64) - 450 requests
...

https://roadmap.sh/projects/nginx-log-analyser
## License

MIT License
