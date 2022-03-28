FROM centos:centos8.4.2105
LABEL com.circleci.preserve-entrypoint=true

ENV ANSIBLE_HOST_KEY_CHECKING=False

WORKDIR /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum check-update && yum --security update && yum -x 'kernel*' update && yum install -y gcc libffi-devel python3 epel-release sshpass python3-pip wget git tar gzip ca-certificates && yum clean all

RUN pip3 install --upgrade pip; \
    pip3 install --upgrade virtualenv; \
    pip3 install pywinrm[kerberos]; \
    pip3 install pywinrm; \
    pip3 install jmspath; \
    pip3 install requests; \
    python3 -m pip install ansible==2.9.27;
    
WORKDIR /
ENTRYPOINT ["bash"]
