FROM centos:centos8.4.2105
LABEL com.circleci.preserve-entrypoint=true

ENV ANSIBLE_HOST_KEY_CHECKING=False

WORKDIR /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum check-update; \
    yum --security update \
    yum -x 'kernel*' update \
    yum install -y gcc libffi-devel python3 epel-release; \
    yum makecache --refresh  && yum install -y sshpass ; \
    yum install -y python3-pip; \
    yum install -y wget; \
    yum install -y git; \
    yum install -y tar; \
    yum install -y gzip; \
    yum install -y ca-certificates; \
    yum clean all

RUN pip3 install --upgrade pip; \
    pip3 install --upgrade virtualenv; \
    pip3 install pywinrm[kerberos]; \
    pip3 install pywinrm; \
    pip3 install jmspath; \
    pip3 install requests; \
    python3 -m pip install ansible==2.9.27;
    
WORKDIR /
ENTRYPOINT ["bash"]
