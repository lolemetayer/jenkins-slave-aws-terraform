FROM jenkinsci/slave

ARG AWSCLI_VERSION=1.15.71
ARG TERRAFORM_VERSION=0.10.6

# Execute actions below (installation as root)
USER root

# Install AWS CLI
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && \
    python get-pip.py && \
    pip install awscli==${AWSCLI_VERSION} && \
    rm -vf get-pip.py

# Install Terraform
RUN curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_386.zip -o terraform.zip && \
    unzip terraform.zip && \
    rm -vf terraform.zip && \
    mv -v terraform /usr/local/bin/

# Add build date in the image
RUN echo "Build at $(date "+%Y-%m-%d %H:%M:%S %Z")" >> /home/jenkins/build_date.txt && \
    echo "Source repository: https://github.com/lolemetayer/jenkins-slave-aws-terraform" >> /home/jenkins/build_date.txt

# Set default user to jenkins
USER jenkins