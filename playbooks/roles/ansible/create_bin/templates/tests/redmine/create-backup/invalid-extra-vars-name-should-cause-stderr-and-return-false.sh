test_invalid_extra_vars_name_should_cause_stderr_and_return_false() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/create_backup/{{ item.key }} --db_na"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "{{ item.key }}: illegal option -- 'db_na'" "${result}" 
}

# load shunit2
. {{ ansible_user_dir }}/ansible/bin/shunit2/source/2.1/src/shunit2
