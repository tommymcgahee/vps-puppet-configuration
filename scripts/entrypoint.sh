#!/bin/sh

# Big thanks to https://github.com/patricksanders/ for helping me understand this.
set -e

# You would normally want this to be `exec "$@"` so it replaces the shell
# process with your command.
"$@"

# Pull from control repo and create dynamic environments
/opt/puppetlabs/puppet/bin/r10k deploy environment -p --config /r10k.yaml

# r10k does NOT do module dependency resolution, so we need Puppet to check for that
tput setaf 2; echo "Checking module dependencies"
/opt/puppetlabs/bin/puppet module list --tree

# Compile and apply catalog(s)
/opt/puppetlabs/bin/puppet apply

if [[ "$DEV_MODE" = "true" ]]; then
	echo "Sleeping to keep container running for local shenanigans."
	sleep 600
fi
