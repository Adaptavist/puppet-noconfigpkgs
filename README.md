# NoConfigPkgs Module

## Overview

The **NoConfigPkgs** module allows a list of packages and gems in hiera to be installed.

This is suitable for packages and gems that require little or no configuration.

This module also ensures Git is installed on all nodes that module is included on in case noconfigpkgs::git class is included in hiera config.

## Configuration

This module is configured in Hiera.

Packages and gems are specified in arrays of package/gem names (YAML strings) that are the values of a hash that is keyed on puppet `::osfamily` values (e.g. 'Redhat' and 'Debian'). This hash is stored under the Hiera key `packages`.

The `::osfamily` keys allow the user to specify different package names where two operating system use different names for the same software.

Include noconfigpkgs::git class into hiera config in case you want git to be installed. Supported osfamilies are 'Redhat' and 'Debian'

An example packages configuration is presented below:

	noconfigpkgs::default_packages:
	  RedHat : 
	    - 'acl'
	    - 'diffutils'
	    - 'rsyslog'
	    - 'rsyslog-relp'
	    - 'traceroute'
	    - 'sysstat'
	    - 'mailx'
	    - 'man'
	    - 'mtr'
	    - 'nc'
	    - 'vim-enhanced'
	    - 'zsh'
	  Debian : 
	    - 'acl'
	    - 'aptitude'
	    - 'rsyslog'
	    - 'rsyslog-relp'
	    - 'traceroute'
	    - 'mailutils'
	    - 'sysstat'
	    - 'vim'
	    - 'zsh'
	noconfigpkgs::default_gems:
	  RedHat : 
	    - 'avst-backup'
	  Debian : 
	    - 'avst-backup'

## Dependencies

This module has no dependencies on other modules.

## Caveats

Use caution when installing git by configuring this module in Hiera. If another module such Etckeeper is configured a conflict may occur because that module will also attempt to install git.

