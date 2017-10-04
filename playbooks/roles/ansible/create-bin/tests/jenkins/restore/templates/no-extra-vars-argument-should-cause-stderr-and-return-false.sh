test_jenkins_backup_data_dir() {
    command="{{ ansible_user_dir }}/ansible/bin/jenkins/restore/{{ item.value.name }}.sh --jenkins_backup_data_dir"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --jenkins_backup_data_dir" "${result}" 
}

test_jenkins_backup_data_host() {
    command="{{ ansible_user_dir }}/ansible/bin/jenkins/restore/{{ item.value.name }}.sh --jenkins_backup_data_host"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --jenkins_backup_data_host" "${result}" 
}

test_jenkins_installed_dir() {
    command="{{ ansible_user_dir }}/ansible/bin/jenkins/restore/{{ item.value.name }}.sh --jenkins_installed_dir"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --jenkins_installed_dir" "${result}" 
}

test_jenkins_restore_work_dir() {
    command="{{ ansible_user_dir }}/ansible/bin/jenkins/restore/{{ item.value.name }}.sh --jenkins_restore_work_dir"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --jenkins_restore_work_dir" "${result}" 
}

# load shunit2
. {{ ansible_user_dir }}/ansible/bin/shunit2/shunit2
