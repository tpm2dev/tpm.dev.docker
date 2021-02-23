################################################################################
# @brief: 	Top-level build script.
# @copyright: 	Matthew Giassa, Dimitar Tomov, 2021.
# @author: 	Matthew Giassa.
# @author: 	Dimitar Tomov.
# @email:	matthew@giassa.net
# @license:	MIT license with conditions for ownership:
# 		This project and its associated files come with no warranty,
# 		implied or otherwise, even for fitness for a particular
# 		purpose.  All derivative works must include the above notice in
# 		source form, and in customer-facing "README" and/or "about
# 		menu" logic to attribute ownership and acknowledgement to
# 		author(s) to end users, customers, evaluators, etc.
################################################################################

################################################################################
# Globals.
################################################################################
# TODO: this should come from an external CI-related file like for GitHub or
# GitLab, etc.
DOCKER_TAG=0.0.1
DOCKER_IMAGE=iax-tpm-runtime
DOCKER_REPO=iaxes

# Set default target.
.DEFAULT_GOAL: all

# Top-level goal.
.PHONY: all
all:
	# Build Docker image. Use DOCKER_BUILDKIT so we can bundle Dockerfiles
	# and their associated "dockerignore" files (plus some additional
	# helpful features for developers).
	DOCKER_BUILDKIT=1 docker build . \
			-f ./Dockerfile.release \
			--target=baseline \
			--tag=$(DOCKER_REPO)/$(DOCKER_IMAGE):$(DOCKER_TAG)

.PHONY: publish
publish:
	# Push the image to Dockerhub for long-term artifact storage.
	docker push $(DOCKER_REPO)/$(DOCKER_IMAGE):$(DOCKER_TAG)

	# Tag "latest".
	docker tag \
		$(DOCKER_REPO)/$(DOCKER_IMAGE):$(DOCKER_TAG) \
		$(DOCKER_REPO)/$(DOCKER_IMAGE):latest

	# Push "latest".
	docker push $(DOCKER_REPO)/$(DOCKER_IMAGE):latest
