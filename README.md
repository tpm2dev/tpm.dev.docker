# TPM.dev Docker image
## _Ready-to-use Development environment for TPM modules_

This docker image contains:
* IBM TPM 2.0 Simulator
* TCG compliant TPM2 Software Stack
* TCG compliant TPM2 Resource Manager
* TCG compliant TPM2 Tools
* wolfTPM 2.0 stack for embedded systems
* OpenSSL v1.1.1 with TPM2 Engine (legacy)
* OpenSSL v3.0.15 with TPM2 Provider (modern)

All together for rapid TPM development and ease when participating in one of our TPM.dev courses.

Acknowledgement: This docker image was started with a contribution by Matthew Giassa (member of TPM.dev). Later, it was improved upon. Pull-requests are welcome.

## Quickstart

Download our pre-built docker image that is ready for use:

```
docker pull tpmdev/tpm2-runtime
```

###  First run

Generate random number using the TPM2 simulator:

```
docker run --rm -e TPM2TOOLS_TCTI="mssim:host=localhost,port=2321" tpmdev/tpm2-runtime:latest /bin/bash -c "tpm_server >/dev/null & sleep 1; tpm2_startup -c; tpm2_getrandom 8"
```

### Running on Apple M1

To run amd64 docker images on M1 requires an extra parameter `--platform linux/amd64`:

```
docker run --rm --platform=linux/amd64 -e TPM2TOOLS_TCTI="mssim:host=localhost,port=2321" tpmdev/tpm2-runtime:latest /bin/bash -c "tpm_server >/dev/null & sleep 1; tpm2_startup -c; tpm2_getrandom 8"
```

## Typical development flow

Create a container that can be resumed at later time using:

```
docker run --platform=linux/amd64 --name tpmdev -e TPM2TOOLS_TCTI="mssim:host=localhost,port=2321" -e TPM2OPENSSL_TCTI="mssim:host=localhost,port=2321" --network=host -it -v /Your/Work/Folder:/Your/Work/Folder tpm-openssl-ops tpmdev/tpm2-runtime /bin/bash
```

After `exit`, you can always resume using:

```
docker start -i tpmdev
```

New states of the container can be saved using:

```
docker commit tpmdev tpmdev-newfiles-saved
```

The above command must be executed while the Docker container is running. After `exit`, you can resume using the new container name:

```
docker start -i tpmdev-newfiles-saved
```

## What is [TPM.dev](https://www.tpm.dev)?

A forum dedicated to developer-friendly computer security for IoT, Edge, and Cloud systems. We help developers build trusted applications and systems using hardware-based security. By leveraging hardware roots of trust and remote attestation, you can verify cloud servers and build secure IoT devices. We discuss online to share knowledge and collaborate.

## Why You Should Join Us

* We are a developer-friendly community with over 1000 members as of May 2026
* We create together [TPM 2.0 tutorials](https://github.com/tpm2dev/tpm.dev.tutorials) about security that are easy to understand
* We share publicly our video tutorials and talks
* Our conference presents industry professionals and commercial companies together with community projects and researchers

Explore our resources here - [TPM.dev](https://www.tpm.dev)

Alternative resource: [TPM.dev Linkedin](https://www.linkedin.com/company/tpmdev/)
