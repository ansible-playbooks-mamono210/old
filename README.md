# Ansibleをインストールする
   
``` 
yum -y install epel-release
yum -y install expect
yum -y install openssl-devel
yum -y install python-devel
yum -y install python-pip
pip install --upgrade pip
pip install --upgrade setuptools
pip install git+git://github.com/ansible/ansible.git@devel
ansible --version
```

# playbookの利用方法

inventoriesディレクトリに初期設定ファイルがあるので適宜変更する。


1. localhostでplaybookを実行する

```    
ansible-playbook -i /path/to/inventories/localhost example.yml
```


2. ノードへplaybookを実行する

``` 
ansible-playbook -i /path/to/inventory example.yml
```
