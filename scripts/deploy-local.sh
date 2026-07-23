#!/bin/bash

echo "Nexora local deployment started"

echo
echo "Checking Python installation..."

if command -v python3 > /dev/null
then
    echo "PASS: Python 3 is installed"
else
    echo "FAIL: Python 3 is not installed"
    exit 1
fi

echo
echo "Checking virtual environment..."

if [ -d ".venv" ]
then
    echo "PASS: Virtual environment exists"
else
    echo "FAIL: Virtual environment is missing"
    exit 1
fi

echo
echo "Checking requirements file..."

if [ -f "requirements.txt" ]
then
    echo "PASS: requirements.txt exists"
else
    echo "FAIL: requirements.txt is missing"
    exit 1
fi

echo
echo "Installing application dependencies..."

.venv/bin/pip install -r requirements.txt

if [ $? -ne 0 ]
then
    echo "FAIL: Dependency installation failed"
    exit 1
fi

echo "PASS: Dependencies installed successfully"

echo
echo "Checking for an existing application process..."

if pgrep -f "python3 app/main.py" > /dev/null
then
    echo "INFO: Flask application is already running"
else
    echo "Starting Flask application..."

    APP_ENV=development nohup .venv/bin/python3 app/main.py > /dev/null 2>&1 &
    app_pid=$!

    echo "INFO: Application started with process ID $app_pid"
fi

echo
echo "Waiting for the application to start..."
sleep 3

echo
echo "Verifying application health..."

if curl -fs http://127.0.0.1:5000/health > /dev/null
then
    echo "PASS: Application deployment completed successfully"
else
    echo "FAIL: Application health check failed"
    exit 1
fi
