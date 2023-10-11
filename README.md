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

### Shebang
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
When using git init in an existing workspace or directory, it initializes a new Git repository if one doesn't already exist. However, if a Git repository has been previously initialized in that directory, running git init again won't re-run the initialization process. Instead, it will have no effect and won't alter the existing repository. So, it's important to be cautious and use git init only when you intend to create a new Git repository or reinitialize a directory.

In the GitHub repository lifecycle, "before" refers to the preparation stage before creating a repository. "Init" involves initializing a new Git repository in a local directory using git init.
Once initialized, you can use various Git commands, such as git add, git commit, and git push, to manage and collaborate on your project, which are essential for version control and collaboration on GitHub. Information on Workspace Lifecycle

[Gitpod workspace tasks](https://www.gitpod.io/docs/configure/workspaces/tasks)

## Working with Environment Variables

### env command
We can list out all Enviroment Variables (Env Vars) using the `env` command. Environment variables, or env vars, are a way to configure software and store important information. They're like labels with values, used to customise programs. Env Vars are handy because they allow to change software settings without editing code. They consist of a name and a value, helping programs adapt to different environments.
We can filter specific env vars using 'grep' command after a pipe, for eg. `env | grep GITPOD`.

### Setting and Unsetting Environment Variables

In bash, we can set the value of an env variable using export, eg. `export HELLO='world`. We can also unset the value of an environment variable using unset, eg. `unset HELLO`.
We can set an env var temporarily before running a file.
```sh
HELLO='world' ./bin/print_message
```
Within a bash script, we can set an env var without writing export eg.
```sh
#!/usr/bin/env bash
HELLO='world'
echo $HELLO
```

### Printing Variables
We can print an env var using echo eg. `echo $HELLO`

### Scoping of Env Vars
When you open up new bash terminals in VSCode it will not be aware of env vars that you have set in an another window.

If you want Env Vars to persist across all future bash terminals that are open you need to set env vars in your bash profile. eg. `.bash_profile`. Setting environment variables at the global scope typically involves defining them in a way that they are accessible to all processes and applications running on a system. It can change based on operating systems, but for Linux/Unix(bash) we can set env vars by adding them to a system-wide configuration file like /etc/environment or by creating custom files in the /etc/profile.d/ directory

When you open up new bash terminals in VSCode it won't be aware of env vars that've been set in another window. Environment variables set in one terminal session are typically not automatically available in other terminal sessions.
To persist environment variables across future Bash terminals in a way that they are available every time you open a new terminal session, you should add them to your Bash profile configuration files

### Persisting Env Vars in Gitpod
We can persist env vars into gitpod by storing them in Gitpod Secrets Storage.
```sh
gp env HELLO='world'
```
All future workspaces launched will set the env vars for all bash terminals opened in those workspaces.
You can also set en vars in the `.gitpod.yml` but this can only contain non-senstive env vars.

