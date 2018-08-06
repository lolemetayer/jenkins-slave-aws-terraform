FROM jenkinsci/slave

ENV AWSCLI_VERSION=1.15.71
ENV TERRAFORM_VERSION=0.10.6

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

# Set default user to jenkins
USER jenkins