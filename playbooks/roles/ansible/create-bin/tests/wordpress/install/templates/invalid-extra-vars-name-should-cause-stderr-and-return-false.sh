test_invalid_extra_vars_name_should_cause_stderr_and_return_false() {
    command="{{ ansible_user_dir }}/ansible/bin/wordpress/install/{{ item.value.name }}.sh --db_na password"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "{{ item.value.name }}.sh: illegal option -- 'db_na'" "${result}" 
}

# load shunit2
. {{ ansible_user_dir }}/ansible/bin/shunit2/shunit2
