# Linux Cluster - Lab 10 (CentOS 9)

This repository is for setting up CentOS 9 for the Linux Cluster Lab 9 (RHA Chapter 12: Installing and Updating Software Packages).

## Requirements
- VirtualBox
- Vagrant

## VM Deployment and Destroy
Before deploying the VM, ensure that you set appropriate values in the `.env` file for the new user and credentials.

To do this, first make a copy of the sample environment variables file:
```bash
cp .env.sample .env
```

Then, set the new credentials in the `.env` file.

**Deploy VM:**
```bash
vagrant validate
vagrant up
```

**Destroy VM:**
```bash
vagrant destroy -f
```
