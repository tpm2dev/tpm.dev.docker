# TPM.dev Docker image
## _Development environment for TPM.dev Courses and TPM developers_

This docker image is contribution by Matthew Giassa (member of TPM.dev). It contains:
* IBM TPM 2.0 Simulator
* TCG compliant TPM2 Software Stack
* TCG compliant TPM2 Resource Manager
* TCG compliant TPM2 Tools
* wolfTPM 2.0 stack for embedded systems

All together for rapid TPM development and ease when participating in one of our TPM.dev courses.

## What is [TPM.dev](https://www.tpm.dev)?

A place for developer-friendly computer security of IoT, Edge and Cloud systems. We are a group of developers who want to make our applications trusted using hardware based security. For example, you can verify the (cloud) servers your applications use. Or, your IoT devices exist in an Ecosystem of Trust. Thanks to hardware root of trust and remote attestation, this is possible. We share know-how and meet online every month.

## Why You Should Join Us

* We are a developer-friendly community with over 500 members as of May 2023
* We create together tutorials about security that are easy to understand
* We share publicly our video tutorials and talks
* Our conference presents industry professionals and commercial companies together with community projects and researchers

Explore our resources here - [TPM.dev](https://www.tpm.dev)

## Building

To build the docker container type `make `

## Example run

```
docker run --rm tpmdev/tpm2-runtime:latest -e TPM2TOOLS_TCTI="mssim:host=localhost,port=2321" -c "tpm_server >/dev/null &; sleep 1; tpm2_startup; tpm2_getrandom 8"
```
