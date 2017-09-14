# Class: apache::params
#
# This class provides a number of parameters.
#

class apache::params {

# Se configuran repos dinamicos
  $version_php          = 56
  $version_oic          = "12.2"
  $repo_php_file_name   = "php"
  $repo_php_status      = 1
  $repo_php_description = "PHP el7 ${version_php} x86_64"
  $repo_php_baseurl     = undef
  $repo_oic_file_name   = "oracle_instant_client"
  $repo_oic_status      = 1
  $repo_oic_description = "Oracle Instant Client ${version_oic} x86_64"
  $repo_oic_baseurl     = undef
  $proxy_url            = "http://proxy.net:8080"

# Parametros referentes a paquetes
  $package_httpd                        = "httpd.x86_64"
  $package_mod_php                      = "php.x86_64"
  $package_mod_opcache                  = "php-opcache.x86_64"
  $package_mod_oic_b                    = "oracle-instantclient${version_oic}-basic.x86_64"
  $package_mod_oic_d                    = "oracle-instantclient${version_oic}-devel.x86_64"
  $package_mod_oci8                     = "php-oci8.x86_64"
  $package_mod_php_redis                = "php-pecl-redis"
  $package_ensure                       = "installed"
  $available_mod_php                    = true
  $available_mod_php_redis              = true
  $available_mod_opcache                = true
  $available_mod_oracle_instant_client  = true
  $available_mod_oci8                   = true

# Parametros referentes a configuracion
  $httpd_config_dir                     = "/etc/httpd/conf"
  $httpd_config_file                    = "/etc/httpd/conf/httpd.conf"
  $httpd_config_file_mode               = "644"
  $httpd_config_file_owner              = "root"
  $httpd_config_file_group              = "root"
  $httpd_sysconfig_file                 = "/etc/sysconfig/httpd"
  $httpd_sysconfig_file_template        = "apache/etc_sysconfig_httpd.erb"
  if $::operatingsystemmajrelease >= '7' { $httpd_config_file_template  = "apache/rhel7_httpd.conf.erb" }
  else { $httpd_config_file_template    = "apache/rhel6_httpd.conf.erb" }

# Parametros referentes al punto de montaje por red.
# Sites, hace referencia a los archivos propios de la aplicacion WEB (codigo fuente, imagenes, etc).
  $nfs_mount_point_d_owner      = undef
  $sites_mount_point_o          = "/nfs/p1/webs"
  $sites_mount_point_d          = "/var/www/html"
  $sites_mount_ensure           = "mounted"
  $sites_mount_atboot           = true
  $sites_mount_options          = "defaults"
  $sites_mount_fstype           = "nfs"
# Settings, se refiere a la configuracion puntal del virtual host
  $settings_mount_point_ext_o   = "/nfs/p1/conf/externos/activo"
  $settings_mount_point_int_o   = "/nfs/p1/conf/internos/activo"
  $settings_mount_point_d       = "/etc/httpd/sites.d"
  $settings_mount_ensure        = "mounted"
  $settings_mount_atboot        = true
  $settings_mount_options       = "defaults"
  $settings_mount_fstype        = "nfs"

# Parametros referentes a los servicios
  $httpd_service_ensure         = "running"
  $httpd_service_enable         = true
  $httpd_service_hasstatus      = true
  if $::operatingsystemmajrelease >= '7' { $httpd_service_name = "httpd.service" }
  else { $httpd_service_name = "httpd" }
  $httpd_service_reload         = false
  $httpd_reload_command_name    = "httpd_reload"
  $httpd_reload_command         = "/usr/bin/systemctl reload httpd.service"

# Variables de ambiente
  $ambiente             = undef
  $servicio_externo     = undef

# Parametros referente al archivo php y sus extensiones
  $php_config_file              = "/etc/php.ini"
  $php_config_file_mode         = "644"
  $php_config_file_owner        = "root"
  $php_config_file_group        = "root"
  $php_config_file_template     = "apache/etc_php_ini.erb"

# Parametros configurables, referentes al php.ini
  $php_display_errors                   = undef
  $php_error_log                        = undef
  $php_error_reporting                  = undef
  $php_extension                        = undef
  $php_memory_limit                     = undef
  $php_post_max_size                    = undef
  $php_upload_max_filesize              = undef

# Parametros de la extension redis para php
  $php_redis_extension_file             = "/etc/php.d/50-redis.ini"
  $php_redis_extension_file_mode        = "644"
  $php_redis_extension_file_owner       = "root"
  $php_redis_extension_file_group       = "root"
  $php_redis_extension_file_template    = "apache/etc_php_d_50_redis.ini.erb"
  $php_redis_extension                  = "redis.so"
  $php_redis_session_save_handler       = "redis"
  $php_redis_session_save_path          = undef

# Parametros de configuracion del archivo httpd.conf
  if $::operatingsystemmajrelease >= '7' {
    $server_root                        = undef
    $listen_port                        = undef
    $include_conf_modules_dir           = undef
    $user                               = undef
    $group                              = undef
    $server_admin                       = undef
    $directory_root                     = undef
    $root_allow_override                = undef
    $root_require_all_denied            = undef
    $directory_content                  = undef
    $content_allow_override             = undef
    $content_all_granted                = undef
    $document_root                      = undef
    $document_root_indexes              = undef
    $document_root_allow_override       = undef
    $document_root_all_granted          = undef
    $httpd_dir_module_enable            = undef
    $httpd_dir_module_dir_index         = undef
    $files_ht_prevent                   = undef
    $files_ht_prevent_requiere          = undef
    $error_log_file                     = undef
    $access_log_file                    = 'logs/access_log'
    $log_level                          = undef
    $httpd_log_config_module_enable     = true
    $httpd_logio_module_enable          = true
    $httpd_log_format_custom_enable     = true
    $httpd_log_format_custom_code       = '%A %v %{X-Forwarded-For}i %t \"%r\" %>s %B \"%{Referer}i\" \"%{User-Agent}i\" %D'
    $httpd_log_format_custom_tag        = 'custom_tag'
    $httpd_log_format_combinedio_enable = undef
    $httpd_log_format_combinedio_code   = '%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %I %O'
    $httpd_log_format_combinedio_tag    = 'combinedio'
    $httpd_log_format_common_enable     = undef
    $httpd_log_format_common_code       = '%h %l %u %t \"%r\" %>s %b'
    $httpd_log_format_common_tag        = 'common'
    $httpd_log_format_combined_enable   = undef
    $httpd_log_format_combined_code     = '%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"'
    $httpd_log_format_combined_tag      = 'combined'
    $httpd_custom_log_enable            = true
    $httpd_alias_module_enable          = undef
    $script_alias_cgi_bin               = undef
    $httpd_mime_module_enable           = undef
    $add_default_charset                = undef
    $httpd_mime_magic_module_enable     = undef
    $mime_magic_file                    = undef
    $enable_send_file                   = undef
    $include_optional_conf_d            = undef
  }

}
