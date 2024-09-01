# hisrasberry

GitHub CLI (gh) frequently reports that it's out of date, which can be annoying. This project maintains scripts to automatically update gh and other tools daily.

## Features

- Automatically updates GitHub CLI (gh) and Terraform using Homebrew
- Uses launchd to schedule daily updates
- Easy installation and uninstallation using just commands

## Installation

To install the auto-update services:

1. Install both GitHub CLI and Terraform update services:
   ```
   just install-all
   ```

2. To install only GitHub CLI update service:
   ```
   just install-github
   ```

3. To install only Terraform update service:
   ```
   just install-terraform
   ```

## Uninstallation

To uninstall the auto-update services:

1. Uninstall both GitHub CLI and Terraform update services:
   ```
   just uninstall-all
   ```

2. To uninstall only GitHub CLI update service:
   ```
   just uninstall-github
   ```

3. To uninstall only Terraform update service:
   ```
   just uninstall-terraform
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



## related

- [just](https://github.com/casey/just) - Command runner used for installation and management
- [Homebrew](https://brew.sh/) - Package manager for macOS
- [GitHub CLI (gh)](https://cli.github.com/) - GitHub's official command line tool
- [Terraform](https://www.terraform.io/) - Infrastructure as Code tool