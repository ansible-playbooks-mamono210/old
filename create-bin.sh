PROGNAME=$(basename $0)
VERSION="0.1"

usage() {
    echo "Usage: $PROGRAM [OPTIONS] FILE"
    echo "  This script is ~."
    echo
    echo "Options:"
    echo "  -h, --help"
    echo
    echo "  --version"
    echo
    echo "  --vault_password ARGUMENT"
    echo "          ansible vault パスワード "
    echo "          必ず指定する" 
    echo
    echo "  --ansible_dir ARGUMENT"
    echo "          Ansibleのディレクトリ"
    echo "          初期値は「/home/ansible/ansible」" 
    echo
    exit 1
}

VAULT_PASSWORD=

for OPT in "$@"
do
    case "$OPT" in
        '-h'|'--help' )
            usage
            exit 1
            ;;

        '--version' )
            echo $VERSION
            exit 1
            ;;

        '--ansible_dir' )
            if [[ -z "$2" ]] || [[ "$2" =~ ^-+ ]]; then
                echo "RPROGRAM: option requires an argument -- $1"
                exit 1
            fi

            ANSIBLE_DIR="$2"
            shift 1
            ;;

        '--vault_password' )
            if [[ -z "$2" ]] || [[ "$2" =~ ^-+ ]]; then
                echo "RPROGRAM: option requires an argument -- $1"
                exit 1
            fi

            VAULT_PASSWORD="$2"
            shift 1
            ;;

        '--'|'-' )
            shift 1
            param+=( "$@" )
            break
            ;;

        -*)
            echo "$PROGNAME: illegal option -- '$(echo $1 | sed 's/^-*//')'" 1>&2
            exit 1
            ;;

        *)
            if [[ ! -z "$1" ]] && [[ ! "$1" =~ ^-x ]]; then
                param+=( "$1" )
                shift 1
            fi
            ;;
    esac
done


export ANSIBLE_HOST_KEY_CHECKING=False

# Ansibleディレクトリを設定する
if [[ ! -z "${ANSIBLE_DIR}" ]]; then
    AS_DIR="${ANSIBLE_DIR}"
else
    AS_DIR="/home/ansible/ansible"
fi

LOG_PATH="${AS_DIR}/log/create-bin.log"
sudo -u ansible rm -rf ${LOG_PATH}
#LOG_PATH=/tmp/ansible-playbok_create-bin.log
#rm -rf ${LOG_PATH}
export ANSIBLE_LOG_PATH=${LOG_PATH}

# vaultパスワードが引数で渡されていない場合は処理を終了する
if [[ -z "${VAULT_PASSWORD}" ]] || [[ "${VAULT_PASSWORD}" =~ ^-+ ]]; then
    echo "RPROGRAM: vault_password option requires"
    exit 1
fi

expect -c "

    set timeout -1

    spawn ansible-playbook -i ${AS_DIR}/playbooks/localhost ${AS_DIR}/playbooks/ansible_create-bin.yml  --ask-vault-pass

    expect "Vault*password*"

    send -- \"${VAULT_PASSWORD}\n\"

    expect eof
    exit
    "    

# SSH接続が失敗している場合はステータス「1」を返して終了する
if tail -n 1 ${LOG_PATH} | grep unreachable=1 ; then
    exit 1
fi

# 処理が失敗している場合はステータス「1」を返して終了する
if ! tail -n 1 ${LOG_PATH} | grep failed=0 ; then
    exit 1
fi
