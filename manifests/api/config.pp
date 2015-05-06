# this class is used to configure the salt api config file
class salt::api::config (
  $api_config_manage    = $salt::api::api_config_manage,
  $api_config_template  = $salt::api::api_config_template,
  $api_enable_cherrypy  = $salt::api::api_enable_cherrypy,
  $api_enable_tornado   = $salt::api::api_enable_tornado,
  $api_enable_wsgi      = $salt::api::api_enable_wsgi,
  $api_config        = $salt::api::api_config,
  $master_config_manage = $salt::api::master_config_manage,
) inherits salt::api {
  # installs the api config file defined in salt::params

  file { $api_config:
    ensure  => file,
    owner   => 0,
    group   => 0,
    mode    => '0664',
    content => template($api_config_template),
  }


}
