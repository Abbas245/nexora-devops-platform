# Nexora DevOps Platform

## Overview

The Nexora DevOps Platform is a corporate-style DevOps engineering project designed to simulate the day-to-day work of a Junior Cloud / DevOps Engineer in a real software company.

Instead of learning technologies in isolation, every task in this repository is driven by a business requirement, engineering ticket, or production scenario.

The objective is to demonstrate practical engineering skills, decision-making, documentation, troubleshooting, and automation using industry-standard workflows.

## Project Goals

* Build a realistic DevOps engineering portfolio.
* Follow a corporate ticket-based workflow.
* Apply engineering best practices instead of isolated tutorials.
* Document decisions and implementation throughout the project.
* Produce a GitHub repository that reflects real-world engineering work.

## Technologies

* Linux
* Bash Scripting
* Git & GitHub
* AWS

Additional technologies will be introduced only when required by the project's business needs.

## Engineering Philosophy

This repository is built around one principle:

> Technology is introduced to solve business problems, not to complete a learning checklist.

Every feature, script, and infrastructure change begins with an engineering ticket that explains:

* The business problem
* The technical objective
* The implementation
* The verification process
* The lessons learned

## Repository Status

Current Phase:

Ticket NXS-101 — Engineering Workspace and Environment Verification (Completed)

Next Ticket

NXS-102 — First Engineering Task

## License

This project is intended for educational and portfolio purposes.

## Local Development

Create and activate a Python virtual environment:

```bash
python3 -m venv .venv
source .venv/bin/activate
```

Install the required dependencies:

```bash
pip install -r requirements.txt
```

Run the application:

```bash
python3 app/main.py
```

Verify the application:

```bash
curl http://127.0.0.1:5000/
curl http://127.0.0.1:5000/health
```

## Application Configuration

The application reads the `APP_ENV` environment variable to determine which environment it is running in.

If `APP_ENV` is not set, the application uses `development` by default.

Run in development mode:

```bash
python3 app/main.py
```

Run in production mode:

```bash
APP_ENV=production python3 app/main.py
```

Check the active environment:

```bash
curl http://127.0.0.1:5000/health
```

The application also reads the `APP_VERSION` environment variable.

If `APP_VERSION` is not set, the application uses `0.1.0` by default.

Run with a custom version:

```bash
APP_VERSION=1.0.0 python3 app/main.py
```

The health endpoint reports application status, environment, and version.


## Application Logging

The application saves operational logs in:

```text
logs/application.log
```

The log file records application startup and endpoint activity.

View the complete log file:

```bash
cat logs/application.log
```

Search for health-check activity:

```bash
grep "Health endpoint accessed" logs/application.log
```

The `logs/` directory is excluded from Git because log files are generated while the application runs.

## Server Health Check

The project includes a Bash script that checks the Linux server and Flask application.

The script checks:

* CPU load
* Disk usage
* Memory usage
* Flask application process
* Port `5000`
* The `/health` endpoint

Run the health check:

```bash
./scripts/health-check.sh
```

A healthy application returns:

```text
Overall result: PASS
```

and exit code `0`.

An unhealthy application returns:

```text
Overall result: FAIL
```

and exit code `1`.

Check the exit code immediately after running the script:

```bash
echo $?
```

## Local Deployment Automation

The project includes a Bash script that prepares and starts the application locally.

The deployment script:

* Checks that Python 3 is installed
* Checks that the virtual environment exists
* Checks that `requirements.txt` exists
* Installs the required Python dependencies
* Prevents duplicate application processes
* Starts the Flask application in the background
* Verifies the `/health` endpoint

Run the deployment:

```bash
./scripts/deploy-local.sh
```

Verify the application:

```bash
curl http://127.0.0.1:5000/health
```

Stop the locally deployed application:

```bash
pkill -f "python3 app/main.py"
```
