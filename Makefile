################################################################################
# @brief: 	Top-level build script.
# @copyright: 	Matthew Giassa, Dimitar Tomov, 2021.
# @author: 	Matthew Giassa.
# @author: 	Dimitar Tomov..
# @email:	matthew@giassa.net
# @license:	MIT license with conditions for ownership:
# 		This project and its associated files comes with no warranty,
# 		implied or otherwise, even for fitness for a particular
# 		purpose.  All derivative works must include the above notice in
# 		source form, and in customer-facing "README" and/or "about
# 		menu" logic to attribute ownership and acknowledgement to
# 		author(s) to end users, customers, evaluators, etc.
################################################################################

# Set default target.
.DEFAULT_GOAL: all

# Top-level goal.
.PHONY: all
all:
	# Build Docker image. Use DOCKER_BUILDKIT so we can bundle Dockerfiles
	# and their associated "dockerignore" files (plus some additional
	# helpful features for developers).
	DOCKER_BUILDKIT=1 docker build . -f ./Dockerfile.release

