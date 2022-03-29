#!/usr/bin/env bash
#
# A collection of functions I do not want to write again.

###############################################################################
# Get script directory.
# Outputs:
#   Writes location to stdout
###############################################################################
function scriptdir {
	declare current_dir

	current_dir="$(pwd)"

	cd "$(dirname "${BASH_SOURCE[-1]}")" || return 1
	printf "%q" "$(pwd)"

	cd "${current_dir}" || return 2
}

###############################################################################
# Get script filepath.
# Outputs:
#   Writes location to stdout
###############################################################################
function scriptfile {
	declare basename

	basename="$(basename "${BASH_SOURCE[-1]}")"

	printf "%q/%q" "$(scriptdir)" "${basename}"
}

###############################################################################
# Get script basename.
# Outputs:
#   Writes location to stdout
###############################################################################
function scriptname {
	printf "%q" "$(basename "$(scriptfile)")"
}

###############################################################################
# Create a temporary working directory if it does not exist.
# Outputs:
#   Writes location to stdout
###############################################################################
function workingdir {
	declare dirname
	declare dirpath

	dirname="$(scriptname)_${PPID}"
	dirpath="/tmp/${dirname}"

	mkdir -p "${dirpath}"

	printf "%q" "${dirpath}"
}

###############################################################################
# Remove the temporary working directory.
###############################################################################
function workingdir_rm {
	declare dirname
	declare dirpath

	dirname="$(scriptname)_${PPID}"
	dirpath="/tmp/${dirname}"

	rm -fr "${dirpath}"
}
