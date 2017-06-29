test_backup_data_dir() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/create_backup/{{ item.key }} --backup_data_dir"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --backup_data_dir" "${result}" 
}

test_backup_work_dir() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/create_backup/{{ item.key }} --backup_work_dir"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --backup_work_dir" "${result}" 
}

test_db_host() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/create_backup/{{ item.key }} --db_host"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --db_host" "${result}" 
}

test_db_name() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/create_backup/{{ item.key }} --db_name"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --db_name" "${result}" 
}

test_db_password() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/create_backup/{{ item.key }} --db_password"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --db_password" "${result}" 
}

test_db_port() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/create_backup/{{ item.key }} --db_port"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --db_port" "${result}" 
}

test_db_user() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/create_backup/{{ item.key }} --db_user"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --db_user" "${result}" 
}

test_git_archive_file() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/create_backup/{{ item.key }} --git_archive_file"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --git_archive_file" "${result}" 
}

test_git_dir() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/create_backup/{{ item.key }} --git_dir"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --git_dir" "${result}" 
}

test_git_parent_dir() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/create_backup/{{ item.key }} --git_parent_dir"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --git_parent_dir" "${result}" 
}

test_pg_dump_data_file() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/create_backup/{{ item.key }} --pg_dump_data_file"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --pg_dump_data_file" "${result}" 
}

test_redmine_media_archive_file() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/create_backup/{{ item.key }} --redmine_media_archive_file"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --redmine_media_archive_file" "${result}" 
}

test_redmine_dir() {
    command="{{ ansible_user_dir }}/ansible/bin/redmine/create_backup/{{ item.key }} --redmine_dir"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --redmine_dir" "${result}" 
}

# load shunit2
. {{ ansible_user_dir }}/ansible/bin/shunit2/source/2.1/src/shunit2
