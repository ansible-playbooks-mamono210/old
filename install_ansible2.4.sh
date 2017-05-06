yum -y groupinstall "Development Tools" 
yum -y install epel-release
yum -y install openssl-devel
yum -y install python-devel
yum -y install python-pip
pip -y install --upgrade pip
pip -y install --upgrade setuptools
pip -y install git+git://github.com/ansible/ansible.git@devel
ansible --version

yum -y install expect
