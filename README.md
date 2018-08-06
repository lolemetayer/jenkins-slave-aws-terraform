# jenkins-slave-aws-terraform
Image for Docker Jenkins Slave including AWS CLI and Terraform


# ARG variables

To change versions installed during build, use the syntax

    docker build --build-arg <varname>=<value> ...

Available arguments are:

| ENV var name      | Default value   | Comment                       |
| ----------------- | --------------- | ----------------------------- |
| AWSCLI_VERSION    | 1.15.71         | Version of AWS CLI to install |
| TERRAFORM_VERSION | 0.10.6          | Version of Terraform          |

