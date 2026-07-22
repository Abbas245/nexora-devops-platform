#!/bin/bash

echo "Nexora server health check started"

overall_status=0

echo
echo "CPU load:"
uptime

echo
echo "Disk usage:"
df -h /

echo
echo "Memory usage:"
free -h

echo
echo "Application process:"

if pgrep -f "python3 app/main.py" > /dev/null
then
    echo "PASS: Flask application is running"
else
    echo "FAIL: Flask application is not running"
    overall_status=1
fi

echo
echo "Application port:"

if ss -tuln | grep -q ":5000"
then
    echo "PASS: Port 5000 is listening"
else
    echo "FAIL: Port 5000 is not listening"
    overall_status=1
fi

echo
echo "Application health endpoint:"

if curl -fs http://127.0.0.1:5000/health > /dev/null
then
    echo "PASS: Health endpoint responded successfully"
else
    echo "FAIL: Health endpoint did not respond successfully"
    overall_status=1
fi

echo

if [ "$overall_status" -eq 0 ]
then
    echo "Overall result: PASS"
else
    echo "Overall result: FAIL"
fi

exit "$overall_status"
