# TPM.dev Docker image
## _Ready-to-use Development environment for TPM modules_

This docker image contains:
* IBM TPM 2.0 Simulator
* TCG compliant TPM2 Software Stack
* TCG compliant TPM2 Resource Manager
* TCG compliant TPM2 Tools
* wolfTPM 2.0 stack for embedded systems

All together for rapid TPM development and ease when participating in one of our TPM.dev courses.

Acknowledgement: This docker image was started with a contribution by Matthew Giassa (member of TPM.dev). Later, it was improved upon. Pull-requests are welcome.

## Quickstart

Download our pre-built docker image that is ready for use:

```
docker pull tpmdev/tpm2-runtime
```

### Example run

Generate random number using the TPM2 simulator:

```
docker run --rm -e TPM2TOOLS_TCTI="mssim:host=localhost,port=2321" tpmdev/tpm2-runtime:latest /bin/bash -c "tpm_server >/dev/null & sleep 1; tpm2_startup -c; tpm2_getrandom 8"
```

### Running on Apple M1

To run amd64 docker images on M1 requires an extra parameter `--platform linux/amd64`:

```
docker run --rm --platform=linux/amd64 -e TPM2TOOLS_TCTI="mssim:host=localhost,port=2321" tpmdev/tpm2-runtime:latest /bin/bash -c "tpm_server >/dev/null & sleep 1; tpm2_startup -c; tpm2_getrandom 8"
```

## What is [TPM.dev](https://www.tpm.dev)?

A place for developer-friendly computer security of IoT, Edge and Cloud systems. We are a group of developers who want to make our applications trusted using hardware based security. For example, you can verify the (cloud) servers your applications use. Or, your IoT devices exist in an Ecosystem of Trust. Thanks to hardware root of trust and remote attestation, this is possible. We share know-how and meet online every month.

## Why You Should Join Us

* We are a developer-friendly community with over 500 members as of May 2023
* We create together tutorials about security that are easy to understand
* We share publicly our video tutorials and talks
* Our conference presents industry professionals and commercial companies together with community projects and researchers

Explore our resources here - [TPM.dev](https://www.tpm.dev)
