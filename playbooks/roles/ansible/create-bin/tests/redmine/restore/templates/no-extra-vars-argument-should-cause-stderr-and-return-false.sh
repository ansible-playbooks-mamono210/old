test_backup_data_dir() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/restore/{{ item.value.name }}.sh --backup_data_dir"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --backup_data_dir" "${result}" 
}

test_backup_data_host() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/restore/{{ item.value.name }}.sh --backup_data_host"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --backup_data_host" "${result}" 
}

test_db_host() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/restore/{{ item.value.name }}.sh --db_host"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --db_host" "${result}" 
}

test_db_name() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/restore/{{ item.value.name }}.sh --db_name"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --db_name" "${result}" 
}

test_db_password() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/restore/{{ item.value.name }}.sh --db_password"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --db_password" "${result}" 
}

test_db_user() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/restore/{{ item.value.name }}.sh --db_user"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --db_user" "${result}" 
}

test_redmine_dir() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/restore/{{ item.value.name }}.sh --redmine_dir"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --redmine_dir" "${result}" 
}

test_restore_work_dir() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/restore/{{ item.value.name }}.sh --restore_work_dir"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --restore_work_dir" "${result}" 
}

# load shunit2
. {{ ansible_user_dir }}/ansible/bin/shunit2/shunit2
