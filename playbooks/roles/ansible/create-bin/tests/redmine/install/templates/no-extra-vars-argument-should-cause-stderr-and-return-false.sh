test_db_host() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/install/{{ item.value.name }}.sh --db_host"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --db_host" "${result}" 
}

test_db_name() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/install/{{ item.value.name }}.sh --db_name"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --db_name" "${result}" 
}

test_db_password() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/install/{{ item.value.name }}.sh --db_password"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --db_password" "${result}" 
}

test_db_port() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/install/{{ item.value.name }}.sh --db_port"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --db_port" "${result}" 
}

test_db_user() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/install/{{ item.value.name }}.sh --db_user"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --db_user" "${result}" 
}

test_redmine_dir() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/install/{{ item.value.name }}.sh --redmine_dir"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --redmine_dir" "${result}" 
}

test_work_dir() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/install/{{ item.value.name }}.sh --work_dir"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --work_dir" "${result}" 
}

# load shunit2
. {{ ansible_user_dir }}/ansible/bin/shunit2/shunit2
