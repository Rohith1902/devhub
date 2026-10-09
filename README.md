# PC-ASSISTANT

A personal Linux productivity and automation toolkit built with **Bash** and **Python**. This repository brings together command-line helpers for common development workflows, project navigation, Verilog tool launching, Git operations, and task tracking.

> **Platform note:** Several scripts currently use local absolute paths and application commands. Review and customize those paths for your own Linux setup before running them.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Repository Structure](#repository-structure)
- [Requirements](#requirements)
- [Getting Started](#getting-started)
- [Script Reference](#script-reference)
- [Configuration and Safety](#configuration-and-safety)
- [Known Limitations](#known-limitations)
- [Contributing](#contributing)
- [Author](#author)

## Overview

PC-ASSISTANT is a collection of personal utilities intended to make a Linux development environment easier to use. Instead of repeatedly typing common commands or navigating project folders manually, the scripts provide small interactive helpers for selected tasks.

The repository is a work in progress: some launchers depend on software installed on the author's machine, and some menu options may not yet be implemented.

## Features

- **Git workflow helper** — prompts for commit messages and supports repository initialization, pushing, cloning, and pulling.
- **Verilog tool launcher** — provides a menu for opening ModelSim and navigating to a Verilog project directory.
- **Task tracker** — a Python command-line to-do utility with MySQL integration for storing and displaying daily tasks.
- **Project and directory shortcuts** — shell helpers for opening selected project locations and navigating a development workspace.
- **System time helper** — a script intended to synchronize the system clock from the hardware clock.
- **Additional personal utilities** — other Bash and Python scripts for project-specific workflows.

## Repository Structure

```text
devhub/
├── README.md
├── Git.sh          # Git repository and push/pull helper functions
├── ai_agent.sh     # Shortcut for opening an AI-agent project directory
├── ai_chip.sh      # AI-chip workflow helper
├── class_hub.sh    # Class/project workspace helper
├── dir.sh          # Directory navigation helper
├── mysql_test.py   # MySQL connection/testing utility
├── path.sh         # Path/navigation helper
├── pp.sh           # Personal workflow helper
├── pqc.sh          # Post-quantum cryptography project helper
├── prj.sh          # Project navigation helper
├── rornoa.sh       # Personal automation/workflow script
├── rtpy.sh         # Python-related workflow helper
├── set_clk.sh      # Hardware-clock synchronization helper
├── test.py         # Python test/experiment script
├── test.sh         # Shell test/experiment script
├── to_do.py        # MySQL-backed daily to-do utility
├── transcript      # Transcript or log file
└── verilog.sh      # Verilog tool launcher
```

The descriptions above are based on the filenames and visible code. Check each script before relying on it; update this tree when files are added, removed, or renamed.

## Requirements

Install only the dependencies needed for the script you intend to use:

- Linux with Bash
- Python 3
- MySQL or MariaDB, for the database-backed utilities
- Python package `mysql-connector-python`, for `to_do.py` and any database scripts that import it
- ModelSim, if you want to launch it through `verilog.sh`
- KDE Dolphin (`dolphin`), for shortcuts that open directories in the file manager
- Git, for `Git.sh`

Other scripts may depend on tools or directories specific to the local system.

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/Rohith1902/devhub.git
cd devhub
```

### 2. Review a script before running it

```bash
less Git.sh
less verilog.sh
less set_clk.sh
```

Some scripts contain machine-specific paths. Edit those paths to match your system.

### 3. Run a shell script

For example:

```bash
bash verilog.sh
```

Or, if the script is executable:

```bash
./verilog.sh
```

If needed, make a script executable:

```bash
chmod +x verilog.sh
```

### 4. Run the Python task tracker

Create and activate a virtual environment if desired:

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install mysql-connector-python
```

Before starting the tracker, configure a local MySQL/MariaDB database and update the connection settings in `to_do.py` to match your database and schema.

```bash
python3 to_do.py
```

The database-backed scripts will not work until their database connection details and expected tables are configured correctly.

## Script Reference

| File | Purpose |
|---|---|
| `Git.sh` | Interactive helper functions for Git initialization, commits, push/pull, and cloning. |
| `verilog.sh` | Menu to launch ModelSim or open the configured Verilog project directory. |
| `to_do.py` | Command-line daily task tracker using MySQL. |
| `mysql_test.py` | MySQL testing/connection utility; inspect the file for its exact behavior. |
| `set_clk.sh` | Hardware-clock synchronization helper; inspect permissions and commands before use. |
| `ai_agent.sh` | Opens a configured AI-agent project folder. |
| `ai_chip.sh` | AI-chip-related helper; inspect the script for its current actions. |
| `class_hub.sh` | Class or workspace navigation helper. |
| `dir.sh`, `path.sh`, `prj.sh` | Directory, path, or project navigation helpers. |
| `pqc.sh` | Post-quantum cryptography project helper. |
| `pp.sh`, `rornoa.sh`, `rtpy.sh` | Additional personal workflow helpers; see each script for details. |
| `test.py`, `test.sh` | Test or experiment scripts. |
| `transcript` | Transcript/log file, if still needed. |

## Configuration and Safety

- **Do not publish passwords, API keys, access tokens, or other secrets.** If a credential has already been committed to a public repository, remove it from the code and rotate/change it; deleting it from the latest version alone does not remove it from Git history.
- Use environment variables or a local configuration file excluded by `.gitignore` for database credentials.
- The current `to_do.py` contains database connection details in source code. Replace these with local configuration before sharing or deploying the project.
- Review scripts before execution, especially scripts that use `sudo`, modify system time, delete files, or push changes to Git.
- Update hard-coded paths such as `/mnt/Apps/...` to paths that exist on your machine.
- Avoid running unknown scripts with elevated privileges.

## Known Limitations

- Some scripts are tied to the author's Linux desktop and directory layout.
- Certain menu options may be placeholders or unfinished.
- The Python task tracker requires a correctly configured database and matching schema.
- Script behavior and dependencies may change as the repository evolves.

## Contributing

Suggestions and improvements are welcome. A useful contribution could include making paths configurable, moving secrets into environment variables, adding usage examples, and testing scripts on a clean Linux installation.

1. Fork the repository.
2. Create a branch for your change.
3. Test the script you modified.
4. Submit a pull request describing the change.

## Author

**Rohith Kumar**

GitHub: [@Rohith1902](https://github.com/Rohith1902)

---

This project is a personal collection of utilities and is provided as-is. Review scripts and configure dependencies before use.
