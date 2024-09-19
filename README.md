# hisrasberry

GitHub CLI (gh) frequently reports that it's out of date, which can be annoying. This project maintains scripts to automatically update gh and other tools daily.

## Features

- Automatically updates GitHub CLI (gh), Terraform, uv, and ourchester using Homebrew
- Uses launchd to schedule daily updates
- Easy installation and uninstallation using just commands

## Installation

To install the auto-update services:

1. Install all update services:
   ```
   just install-all
   ```

2. To install specific update services:
   ```
   just install-github
   just install-terraform
   just install-uv
   just install-ourchester
   ```

## Uninstallation

To uninstall the auto-update services:

1. Uninstall all update services:
   ```
   just uninstall-all
   ```

2. To uninstall specific update services:
   ```
   just uninstall-github
   just uninstall-terraform
   just uninstall-uv
   just uninstall-ourchester
   ```

## Usage

- List loaded services:
  ```
  just list-loaded
  ```

- Show logs for the services:
  ```
  just show-logs
  ```

For more commands, run `just --list` to see all available options.

## Related

- [just](https://github.com/casey/just) - Command runner used for installation and management
- [Homebrew](https://brew.sh/) - Package manager for macOS
- [GitHub CLI (gh)](https://cli.github.com/) - GitHub's official command line tool
- [Terraform](https://www.terraform.io/) - Infrastructure as Code tool
- [uv](https://github.com/astral-sh/uv) - Python packaging and dependency management tool
- [ourchester](https://github.com/taylormonacelli/ourchester) - Custom indexing tool