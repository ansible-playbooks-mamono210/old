test_db_host() {
    command="{{ ansible_user_dir }}/ansible/bin/wordpress/install/{{ item.key }} --db_host"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --db_host" "${result}" 
}

test_db_name() {
    command="{{ ansible_user_dir }}/ansible/bin/wordpress/install/{{ item.key }} --db_name"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --db_name" "${result}" 
}

test_db_password() {
    command="{{ ansible_user_dir }}/ansible/bin/wordpress/install/{{ item.key }} --db_password"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --db_password" "${result}" 
}

test_db_prefix() {
    command="{{ ansible_user_dir }}/ansible/bin/wordpress/install/{{ item.key }} --db_prefix"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --db_prefix" "${result}" 
}

test_db_user() {
    command="{{ ansible_user_dir }}/ansible/bin/wordpress/install/{{ item.key }} --db_user"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --db_user" "${result}" 
}

test_mariadb_root_password() {
    command="{{ ansible_user_dir }}/ansible/bin/wordpress/install/{{ item.key }} --mariadb_root_password"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --mariadb_root_password" "${result}" 
}

test_wp_admin_email() {
    command="{{ ansible_user_dir }}/ansible/bin/wordpress/install/{{ item.key }} --wp_admin_email"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --wp_admin_email" "${result}" 
}

test_wp_admin_password() {
    command="{{ ansible_user_dir }}/ansible/bin/wordpress/install/{{ item.key }} --wp_admin_password"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --wp_admin_password" "${result}" 
}

test_wp_admin_user() {
    command="{{ ansible_user_dir }}/ansible/bin/wordpress/install/{{ item.key }} --wp_admin_user"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --wp_admin_user" "${result}" 
}

test_wp_host() {
    command="{{ ansible_user_dir }}/ansible/bin/wordpress/install/{{ item.key }} --wp_host"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --wp_host" "${result}" 
}

test_wp_httpd_conf() {
    command="{{ ansible_user_dir }}/ansible/bin/wordpress/install/{{ item.key }} --wp_httpd_conf"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --wp_httpd_conf" "${result}" 
}

test_wp_install_dir() {
    command="{{ ansible_user_dir }}/ansible/bin/wordpress/install/{{ item.key }} --wp_install_dir"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --wp_install_dir" "${result}" 
}

test_wp_title() {
    command="{{ ansible_user_dir }}/ansible/bin/wordpress/install/{{ item.key }} --wp_title"
    result="$(${command} 2>&1)"
    
    assertEquals 1 $?
    assertEquals "RPROGRAM: option requires an argument -- --wp_title" "${result}" 
}

# load shunit2
. {{ ansible_user_dir }}/ansible/bin/shunit2/source/2.1/src/shunit2
