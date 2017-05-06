yum -y groupinstall "Development Tools" 
yum -y install epel-release

yum -y install openssl-devel
yum -y install python-devel
yum -y install python-pip

pip install --upgrade pip
pip install --upgrade setuptools
pip install git+git://github.com/ansible/ansible.git@devel

yum -y install expect

ansible --version
