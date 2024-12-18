#!/bin/bash

# Function to get total CPU usage
get_cpu_usage() {
    echo "Total CPU usage:"
    mpstat | awk '/all/ {print 100 - $12"%"}'
    echo ""
}

# Function to get memory usage
get_memory_usage() {
    echo "Total memory usage:"
    free -h | grep Mem | awk '{print "Used: " $3 " / Total: " $2 " (" int($3/$2*100)"%)"}'
    echo ""
}

# Function to get disk usage
get_disk_usage() {
    echo "Total disk usage:"
    df -h | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{print $1 " - Used: " $3 " / Total: " $2 " (" $5 ")"}'
    echo ""
}

# Function to get top 5 processes by CPU usage
get_top_cpu_processes() {
    echo "Top 5 processes by CPU usage:"
    ps aux --sort=-%cpu | awk 'NR<=6{print $3"%\t" $11}' 
    echo ""
}

# Function to get top 5 processes by memory usage
get_top_memory_processes() {
    echo "Top 5 processes by memory usage:"
    ps aux --sort=-%mem | awk 'NR<=6{print $4"%\t" $11}' 
    echo ""
}

# Run all the functions
get_cpu_usage
get_memory_usage
get_disk_usage
get_top_cpu_processes
get_top_memory_processes
