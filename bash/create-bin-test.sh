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
    echo "  --ansible_dir ARGUMENT"
    echo "          Ansibleのディレクトリ"
    echo
    echo "  --skip-tags ARGUMENT"
    echo "          指定したタグのついたロールをスキップして実行する。タグの指定はコンマで区切る。"
    echo "              例）bash create-bin.sh --skip-tags "httpd_install,redmine_install" "
    echo 
    echo "                  指定可能なタグ"
    echo "                      - ansible_install"
    echo "                      - wordpress_uninstall"
    echo
    echo "  --tags ARGUMENT"
    echo "          指定したタグのついたロールのみ実行する。タグの指定はコンマで区切る。"
    echo "              例）bash create-bin.sh --tags "httpd_install,redmine_install" "
    echo 
    echo "                  指定可能なタグ"
    echo "                      - ansible_install"
    echo
    echo "  --vault_password ARGUMENT"
    echo "          ansible vault パスワード "
    echo "          必ず指定する" 
    echo
    exit 1
}

VAULT_PASSWORD=
TAGS=

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

        '--skip-tags' )
            if [[ -z "$2" ]] || [[ "$2" =~ ^-+ ]]; then
                echo "RPROGRAM: option requires an argument -- $1"
                exit 1
            fi

            if [[ ! -z ${TAGS} ]]; then
                echo "PROGRAM: Only one of [--tags] and [--skip-tags] options should be used."
                exit 1
            fi

            TAGS="--skip-tags \"$2\""
            shift 1
            ;;

        '--tags' )
            if [[ -z "$2" ]] || [[ "$2" =~ ^-+ ]]; then
                echo "RPROGRAM: option requires an argument -- $1"
                exit 1
            fi

            if [[ ! -z ${TAGS} ]]; then
                echo "PROGRAM: Only one of [--tags] and [--skip-tags] options should be used."
                exit 1
            fi

            TAGS="--tags \"$2\""
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

LOG_PATH="${AS_DIR}/log/create-bin-test.log"
rm -rf ${LOG_PATH}
export ANSIBLE_LOG_PATH=${LOG_PATH}

# vaultパスワードが引数で渡されていない場合は処理を終了する
if [[ -z "${VAULT_PASSWORD}" ]] || [[ "${VAULT_PASSWORD}" =~ ^-+ ]]; then
    echo "RPROGRAM: vault_password option requires"
    exit 1
fi

# タグを指定する
if [[ ! -z "${TAGS}" ]]; then
    TAGS=" ${TAGS}"
fi


expect -c "

    set timeout -1

    spawn ansible-playbook -i ${AS_DIR}/playbooks/localhost ${AS_DIR}/playbooks/ansible_create-bin-test.yml  --ask-vault-pass `echo ${TAGS}`


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
