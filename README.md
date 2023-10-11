# Terraform Beginner Bootcamp 2023

## Semantic Versioning :mage:
This project is going to utilize semantic versioning for its tagging.
[semver.org] (https://semver.org/)

The general format **MAJOR.MINOR.PATCH**, for e.g. `1.0.1`

- **MAJOR** version when you make incompatible API changes
- **MINOR** version when you add functionality in a backward compatible manner
- **PATCH** version when you make backward compatible bug fixes

## Install Terraform CLI
### Considerations with the Terraform CLI changes
The Terraform CLI installation instructions have changed due to gpg keyring changes. So we need to refer to the latest Terraform CLI instructions via Terraform documentation and change the scripting for install.

[Install Terraform CLI](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

### Considerations for Linux Distributions
This project is built against Ubuntu. Please check your Linux distribution and change accordingly to its needs.

[How to check Linux OS version](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

Example of checking OS version:
```
$ cat /etc/os-release
PRETTY_NAME="Ubuntu 22.04.3 LTS"
NAME="Ubuntu"
VERSION_ID="22.04"
VERSION="22.04.3 LTS (Jammy Jellyfish)"
VERSION_CODENAME=jammy
ID=ubuntu
ID_LIKE=debian
HOME_URL="https://www.ubuntu.com/"
SUPPORT_URL="https://help.ubuntu.com/"
BUG_REPORT_URL="https://bugs.launchpad.net/ubuntu/"
PRIVACY_POLICY_URL="https://www.ubuntu.com/legal/terms-and-policies/privacy-policy"
UBUNTU_CODENAME=jammy
```

### Refactoring into Bash scripts
While fixing the Terraform CLI gpg depreciation issues, we noticed the bash script steps were a considerable amount of more code so we decided to create a bash script to install CLI. 

- This will keep the Gitpod task file [.gitpod.yml](.gitpod.yml) tidy.
- This will allow us an easier time to debug and execute manually Terraform CLI install
- This will allow better portability for other projects that need to install Terraform CLI.

### Shebang:
A shebang (pronounced Sha-bang) tells the bash interpreter what program will interpret the script.
Write a shebang `#!/usr/bin/env bash` at the top of a file to make it bash executable, and to make it portable in different OS distributions. It will search the User's PATH for the bash executable.

[Shebang](https://en.wikipedia.org/wiki/Shebang_(Unix))

### Execution considerations
When executing the bash script we can use `./` shorthand notation to execute the bash script.
E.g. `./bin/install_terraform_cli`
If we are using a script in .gitpod.yml we need to point the script to a program to interpret it.
E.g. `source ./bin/install_terraform_cli`

### Linux permissions considerations
In order to make our bash script executable, we need to change linux permissions for the file to be executable by the user.
```sh
chmod u+x ./bin/install_terraform_cli
```
Here, u means user and x is executable. Alternatively,
```sh
chmod 744 ./bin/install_terraform_cli
```
[Change Linux file permissions](https://en.wikipedia.org/wiki/Chmod)

### GitHub lifecycle (Before, Init, Command)
We need to be careful while using the Init because it will not rerun if we restart an existing workspace.  
[Gitpod workspace tasks](https://www.gitpod.io/docs/configure/workspaces/tasks)
