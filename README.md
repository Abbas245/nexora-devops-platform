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

