LAUNCH_AGENTS := env_var('HOME') + "/Library/LaunchAgents"

default:
    @just --list

install-github:
    mkdir -p "{{ LAUNCH_AGENTS }}"
    cp com.gh.upgrade.plist "{{ LAUNCH_AGENTS }}/"
    launchctl load "{{ LAUNCH_AGENTS }}/com.gh.upgrade.plist"
    @echo "GitHub CLI upgrade job installed"

install-terraform:
    mkdir -p "{{ LAUNCH_AGENTS }}"
    cp com.terraform.upgrade.plist "{{ LAUNCH_AGENTS }}/"
    launchctl load "{{ LAUNCH_AGENTS }}/com.terraform.upgrade.plist"
    @echo "Terraform upgrade job installed"

install-uv:
    mkdir -p "{{ LAUNCH_AGENTS }}"
    cp com.uv.upgrade.plist "{{ LAUNCH_AGENTS }}/"
    launchctl load "{{ LAUNCH_AGENTS }}/com.uv.upgrade.plist"
    @echo "uv upgrade job installed"

install-all: install-github install-terraform install-uv
    @echo "\nAll jobs installed. Current status:"
    @just list-loaded

uninstall-github:
    launchctl unload "{{ LAUNCH_AGENTS }}/com.gh.upgrade.plist"
    rm "{{ LAUNCH_AGENTS }}/com.gh.upgrade.plist"
    @echo "GitHub CLI upgrade job uninstalled"

uninstall-terraform:
    launchctl unload "{{ LAUNCH_AGENTS }}/com.terraform.upgrade.plist"
    rm "{{ LAUNCH_AGENTS }}/com.terraform.upgrade.plist"
    @echo "Terraform upgrade job uninstalled"

uninstall-uv:
    launchctl unload "{{ LAUNCH_AGENTS }}/com.uv.upgrade.plist"
    rm "{{ LAUNCH_AGENTS }}/com.uv.upgrade.plist"
    @echo "uv upgrade job uninstalled"

uninstall-all: uninstall-github uninstall-terraform uninstall-uv
    @echo "\nAll jobs uninstalled. Current status:"
    @just list-loaded

list-loaded:
    @echo "GitHub CLI upgrade job:"
    @launchctl list | grep com.gh.upgrade || echo "Not loaded"
    @echo "\nTerraform upgrade job:"
    @launchctl list | grep com.terraform.upgrade || echo "Not loaded"
    @echo "\nuv upgrade job:"
    @launchctl list | grep com.uv.upgrade || echo "Not loaded"

show-logs:
    @echo "GitHub CLI upgrade logs:"
    @cat /tmp/com.gh.upgrade.out /tmp/com.gh.upgrade.err 2>/dev/null || echo "No logs found"
    @echo "\nTerraform upgrade logs:"
    @cat /tmp/com.terraform.upgrade.out /tmp/com.terraform.upgrade.err 2>/dev/null || echo "No logs found"
    @echo "\nuv upgrade logs:"
    @cat /tmp/com.uv.upgrade.out /tmp/com.uv.upgrade.err 2>/dev/null || echo "No logs found"

format:
    just format-justfile
    just format-plists

format-justfile:
    just --unstable --fmt

format-plists:
    plutil -convert xml1 com.gh.upgrade.plist
    plutil -convert xml1 com.terraform.upgrade.plist
    plutil -convert xml1 com.uv.upgrade.plist
    @echo "All plist files formatted"
