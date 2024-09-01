LAUNCH_AGENTS := env_var('HOME') + "/Library/LaunchAgents"

# List available commands
default:
    @just --list

# Install GitHub CLI upgrade plist
install-github:
    mkdir -p "{{LAUNCH_AGENTS}}"
    cp com.gh.upgrade.plist "{{LAUNCH_AGENTS}}/"
    launchctl load "{{LAUNCH_AGENTS}}/com.gh.upgrade.plist"
    @echo "GitHub CLI upgrade job installed"

# Install Terraform upgrade plist
install-terraform:
    mkdir -p "{{LAUNCH_AGENTS}}"
    cp com.terraform.upgrade.plist "{{LAUNCH_AGENTS}}/"
    launchctl load "{{LAUNCH_AGENTS}}/com.terraform.upgrade.plist"
    @echo "Terraform upgrade job installed"

# Install both plists
install-all: install-github install-terraform
    @echo "\nAll jobs installed. Current status:"
    @just list-loaded

# Uninstall GitHub CLI upgrade plist
uninstall-github:
    launchctl unload "{{LAUNCH_AGENTS}}/com.gh.upgrade.plist"
    rm "{{LAUNCH_AGENTS}}/com.gh.upgrade.plist"
    @echo "GitHub CLI upgrade job uninstalled"

# Uninstall Terraform upgrade plist
uninstall-terraform:
    launchctl unload "{{LAUNCH_AGENTS}}/com.terraform.upgrade.plist"
    rm "{{LAUNCH_AGENTS}}/com.terraform.upgrade.plist"
    @echo "Terraform upgrade job uninstalled"

# Uninstall both plists
uninstall-all: uninstall-github uninstall-terraform
    @echo "\nAll jobs uninstalled. Current status:"
    @just list-loaded

# List loaded launchd jobs for these services
list-loaded:
    @echo "GitHub CLI upgrade job:"
    @launchctl list | grep com.gh.upgrade || echo "Not loaded"
    @echo "\nTerraform upgrade job:"
    @launchctl list | grep com.terraform.upgrade || echo "Not loaded"

# Show logs for both services
show-logs:
    @echo "GitHub CLI upgrade logs:"
    @cat /tmp/com.gh.upgrade.out /tmp/com.gh.upgrade.err 2>/dev/null || echo "No logs found"
    @echo "\nTerraform upgrade logs:"
    @cat /tmp/com.terraform.upgrade.out /tmp/com.terraform.upgrade.err 2>/dev/null || echo "No logs found"

