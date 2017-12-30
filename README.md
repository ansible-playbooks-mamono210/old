###################################################
# Ansibleをインストールする
###################################################


1. Ansibleをインストールする
    
    yum -y install epel-release
    yum --enablerepo=epel -y install sshpass
    yum -y groupinstall "Development Tools"
    yum -y install openssl-devel
    yum -y install python-devel
    yum -y install python-pip
    pip install --upgrade pip
    pip install --upgrade setuptools
    pip install git+git://github.com/ansible/ansible.git@devel
    yum -y install expect
    ansible --version

2. 秘密鍵を「~/.ssh」へ配置する

    i.   ユーザー「ansible」を作成する。
    ii.  ssh-keygenコマンドで鍵ファイルを作成する。
    iii. system_ssh_add-users-and-change-sshd-config-and-firewall で
         ユーザーを対象ノードへ作成する
    iii. 公開鍵ファイルを対象ノードの /home/ansible/.ssh へ配置する。



###############################################
# playbookの利用方法
###############################################


1. localhostでplaybookを実行する

    cd /path/to/ansible/playbooks
    
    ansible-playbook -i /path/to/localhost example.yml \
    --ask-vault-pass



2. ノードへplaybookを実行する

    cd /path/to/ansible/playbooks
    
    ansible-playbook -i /path/to/inventory ansible_create_bin.yml \
    --ask-vault-pass

