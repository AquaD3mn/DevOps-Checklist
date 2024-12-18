#!/bin/bash

# URL to the log file (you can change this URL to point to your desired log file)
LOG_URL="https://gist.githubusercontent.com/kamranahmedse/e66c3b9ea89a1a030d3b739eeeef22d0/raw/77fb3ac837a73c4f0206e78a236d885590b7ae35/nginx-access.log"

# Fetch the log file using curl
echo "Downloading log file..."
curl -s $LOG_URL -o nginx-access.log

# Check if the log file was downloaded
if [ ! -f "nginx-access.log" ]; then
    echo "Error: Log file not found."
    exit 1
fi

# Function to display the top 5 IP addresses
function top_ips() {
    echo "Top 5 IP addresses with the most requests:"
    awk '{print $1}' nginx-access.log | sort | uniq -c | sort -nr | head -n 5 | while read count ip; do
        echo "$ip - $count requests"
    done
    echo ""
}

# Function to display the top 5 most requested paths
function top_paths() {
    echo "Top 5 most requested paths:"
    awk '{print $7}' nginx-access.log | sort | uniq -c | sort -nr | head -n 5 | while read count path; do
        echo "$path - $count requests"
    done
    echo ""
}

# Function to display the top 5 response status codes
function top_status_codes() {
    echo "Top 5 response status codes:"
    awk '{print $9}' nginx-access.log | sort | uniq -c | sort -nr | head -n 5 | while read count code; do
        echo "$code - $count requests"
    done
    echo ""
}

# Function to display the top 5 user agents
function top_user_agents() {
    echo "Top 5 user agents:"
    awk -F'"' '{print $6}' nginx-access.log | sort | uniq -c | sort -nr | head -n 5 | while read count user_agent; do
        echo "$user_agent - $count requests"
    done
    echo ""
}

# Run the functions
top_ips
top_paths
top_status_codes
top_user_agents

# Clean up the log file
rm -f nginx-access.log
