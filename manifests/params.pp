# This class will set all parameters for salt master/minion/api
class salt::params {
  case $::osfamily {
    'redhat'    : {

    }
    'archlinux' : {

    }
    'suse'      : {

    }
    'debian'    : {

    }
    default     : {
      case $::operatingsystem {
        default : { fail("Unsupported platform: ${::osfamily}/${::operatingsystem}") }
      }
    }
  }

  $minion_config_manage = true
  $minion_config = '/etc/salt/minion'
  $minion_config_template = 'salt/minion.erb'
  $minion_package_name = 'salt-minion'
  $minion_package_ensure = 'present'
  $minion_service_name = 'salt-minion'
  $minion_service_ensure = 'running'
  $minion_service_manage = true
  $minion_service_enable = true

  $master_config_manage = true
  $master_config_basedir = '/etc/salt'
  $master_config_incdir = "$master_config_basedir/master.d"
  $master_config = "$master_config_basedir/master"
  $master_config_template = 'salt/master.erb'
  $master_package_name = 'salt-master'
  $master_package_ensure = 'present'
  $master_service_name = 'salt-master'
  $master_service_ensure = 'running'
  $master_service_manage = true
  $master_service_enable = true

  ###############################################
  # master defaults:
  ###############################################
  $master_interface = '0.0.0.0'
  $master_ipv6 = false
  $master_publish_port = 4505
  $master_user = 'root'
  $master_max_open_files = 100000
  $master_worker_threads = 5
  $master_ret_port = 4506
  $master_pid_file = '/var/run/salt-master.pid'
  $master_root_dir = '/'
  $master_pki_dir = ' /etc/salt/pki/master'
  $master_cachedir = '/var/cache/salt/master'
  $master_verify_env = true
  $master_keep_jobs = 24
  $master_timeout = 5
  $master_loop_interval = 60
  $master_output = 'nested'
  $master_show_timeout = false
  $master_color = true
  $master_strip_colors = true
  $master_sock_dir = '/var/run/salt/master'
  $master_enable_gpu_grains = false
  $master_job_cache = true
  $master_minion_data_cache = true
  $master_max_event_size = 1048576
  $master_ping_on_rotate = false
  $master_preserve_minion_cache = false
  $master_con_cache = false
  $master_sign_pubkey = false
  $master_sign_key_name = undef

  # master security:
  $master_open_mode = false
  $master_auto_accept = false
  $master_autosign_timeout = 120
  $master_autosign_file = '/etc/salt/autosign.conf'
  $master_autoreject_file = '/etc/salt/autoreject.conf'
  $master_permissive_pki_access = false
  $master_token_expire = 43200
  $master_file_recv = false
  $master_file_recv_max_size = 100
  $master_sign_pub_messages = false

  # master module management
  $master_cython_enable = false

  # master state system settings
  $master_state_top = 'top.sls'
  $master_external_nodes = 'None'
  $master_renderer = 'yaml_jinja'
  $master_jinja_trim_blocks = false
  $master_jinja_lstrip_blocks = false
  $master_failhard = false
  $master_state_verbose = true
  $master_state_output = 'full'

  # master file server settings
  $master_hash_type = 'md5'
  $master_file_buffer_size = '1048576'

  # master logging settings
  $master_log_file = '/var/log/salt/master'
  $master_key_logfile = '/var/log/salt/key'
  $master_log_level = 'warning'
  $master_log_level_logfile = 'warning'

  ###############################################
  # minion defaults
  ###############################################
  $minion_master = 'salt'
  $minion_random_master = false
  $minion_ipv6 = false
  $minion_retry_dns = 30
  $minion_master_port = $master_ret_port
  $minion_user = 'root'
  $minion_pidfile = '/var/run/salt-minion.pid'
  $minion_root_dir = '/'
  $minion_pki_dir = '/etc/salt/pki/minion'
  $minion_id = undef
  $minion_append_domain = undef
  $minion_cachedir = '/var/cache/salt/minion'
  $minion_verify_env = true
  $minion_cache_jobs = false
  $minion_sock_dir = '/var/run/salt/minion'
  $minion_output = 'nested'
  $minion_color = true
  $minion_strip_colors = true
  $minion_acceptance_wait_time = 10
  $minion_acceptance_wait_time_max = 0
  $minion_rejected_retry = false
  $minion_random_reauth_delay = 10
  $minion_auth_timeout = 60
  $minion_auth_tries = 7
  $minion_auth_safemode = false
  $minion_ping_interval = 0
  $minion_recon_default = 1000
  $minion_recon_max = 10000
  $minion_recon_randomize = true
  $minion_loop_interval = 60
  $minion_dns_check = true
  $minion_grains_refresh_every = 0
  $minion_grains_cache = false
  $minion_grains_cache_expiration = 300
  $minion_ipc_mode = 'ipc'
  $minion_tcp_pub_port = 4510
  $minion_tcp_pull_port = 4511
  $minion_max_event_size = 1048576
  $minion_master_alive_interval = 0
  $minion_startup_states = undef

  # minion module management
  $minion_cython_enable = false
  $minion_modules_max_memory = -1

  # minion state management settings
  $minion_renderer = 'yaml_jinja'
  $minion_failhard = false
  $minion_autoload_dynamic_modules = true
  $minion_clean_dynamic_modules = true
  $minion_environment = 'None'
  $minion_state_top = 'top.sls'

  # minion security settings
  $minion_open_mode = false
  $minion_permissive_pki_access = false
  $minion_state_verbose = true
  $minion_state_output = 'full'
  $minion_master_finger = ''
  $minion_verify_master_pubkey_sign = false
  $minion_always_verify_signature = false

  # minion thread settings
  $minion_multiprocessing = true

  # File Directory Settings
  $minion_hash_type = md5
  $minion_fileserver_limit_traversal = false
  $minion_state_output_diff = false

  # minion logging settings
  $minion_log_file = '/var/log/salt/minion'
  $minion_key_logfile = '/var/log/salt/key'
  $minion_log_level = 'warning'
  $minion_log_level_logfile = 'warning'

  # minion keepalive settings
  $minion_tcp_keepalive = true
  $minion_tcp_keepalive_idle = 300
  $minion_tcp_keepalive_cnt = '-1'
  $minion_tcp_keepalive_intvl = '-1'

  ###############################################
  # api defaults
  ###############################################

  $api_config_manage = true
  $api_config = "$master_config_incdir/api.conf"
  $api_config_template = 'salt/api.erb'
  $api_enable_cherrypy = false
  $api_enable_tornado = false
  $api_enable_wsgi = false
  $api_package_ensure = 'present'
  $api_package_name = 'salt-api'
  $api_service_name = 'salt-api'
  $api_service_ensure = 'running'
  $api_service_manage = true
  $api_service_enable = true

  $api_pki_dir = '/etc/salt/pki/api'
  $api_cherrypy_port = 8000
  $api_cherrypy_host = '0.0.0.0'
  $api_cherrypy_debug = false
  $api_cherrypy_ssl_crt = "$api_pki_dir/server.crt"
  $api_cherrypy_ssl_key = "$api_pki_dir/server.key"
  $api_cherrypy_disable_ssl = false
  $api_cherrypy_webhook_disable_auth = false
  $api_cherrypy_webhook_url = '/hook'
  $api_cherrypy_thread_pool = 100
  $api_cherrypy_socket_queue_size = 30
  $api_cherrypy_max_request_body_size = 1048576
  $api_cherrypy_collect_stats = false
  $api_cherrypy_static = 'static'
  $api_cherrypy_static_path = '/static'
  $api_cherrypy_app = 'app'
  $api_cherrypy_app_path = '/app'
  $api_cherrypy_root_prefix = '/'

  $api_tornado_port = 8001
  $api_tornado_ssl_crt = '/etc/pki/api/certs/server.crt'
  $api_tornado_ssl_key = '/etc/pki/api/certs/server.key'
  $api_tornado_debug = false
  $api_tornado_disable_ssl = false

  $api_wsgi_port = 8002

}
