# == Class: apache
# Full description of class apache here.
#
# === Parameters
# === Variables
# === Examples
# === Copyright
# Copyright 2017 Your name here, unless otherwise noted.
#

class apache (
# Se cargan las variables propias de los paquetes necesarios por Apache
  $version_php          = $::apache::params::version_php,
  $version_oic          = $::apache::params::version_oic,
  $repo_php_file_name   = $::apache::params::repo_php_file_name,
  $repo_php_status      = $::apache::params::repo_php_status,
  $repo_php_description = $::apache::params::repo_php_description,
  $repo_php_baseurl     = $::apache::params::repo_php_baseurl,
  $repo_oic_file_name   = $::apache::params::repo_oic_file_name,
  $repo_oic_status      = $::apache::params::repo_oic_status,
  $repo_oic_description = $::apache::params::repo_oic_description,
  $repo_oic_baseurl     = $::apache::params::repo_oic_baseurl,
  $proxy_url            = $::apache::params::proxy_url,

# Parametros que definen los paquetes usados para montar el servidor WEB Apache
  $package_ensure                       = $::apache::params::package_ensure,
  $package_mod_php                      = $::apache::params::package_mod_php,
  $package_mod_opcache                  = $::apache::params::package_mod_opcache,
  $package_mid_mysql                    = $::apache::params::package_mid_mysql,
  $package_mod_oid_d                    = $::apache::params::package_mod_oid_d,
  $package_mod_oid_b                    = $::apache::params::package_mod_oid_b,
  $package_mod_oci8                     = $::apache::params::package_mod_oci8,
  $package_mod_php_redis                = $::apache::params::package_mod_php_redis,
  $available_mod_php                    = $::apache::params::available_mod_php,
  $available_mod_php_redis              = $::apache::params::available_mod_php_redis,
  $available_mod_oracle_instant_client  = $::apache::params::available_mod_oracle_instant_client,
  $available_mod_opcache                = $::apache::params::available_mod_opcache,
  $available_mod_oci8                   = $::apache::params::available_mod_oci8,

# Estos parametros controlan el servicio de Apache
  $httpd_service_name           = $::apache::params::httpd_service_name,
  $httpd_service_ensure         = $::apache::params::httpd_service_ensure,
  $httpd_service_enable         = $::apache::params::httpd_service_enable,
  $httpd_service_hasstatus      = $::apache::params::httpd_service_hasstatus,
  $httpd_service_reload         = $::apache::params::httpd_service_reload,
  $httpd_reload_command_name    = $::apache::params::httpd_reload_command_name,
  $httpd_reload_command         = $::apache::params::httpd_reload_command,

# Aca se configuran los puntos de montajes de los archivos usandos del sitio y los .conf usados para los virtual hosts
  $sites_mount_point_o          = $::apache::params::sites_mount_point_o,
  $sites_mount_point_d          = $::apache::params::sites_mount_point_d,
  $sites_ip_nfs_server          = $::apache::params::sites_ip_nfs_server,
  $sites_mount_ensure           = $::apache::params::sites_mount_ensure,
  $sites_mount_atboot           = $::apache::params::sites_mount_atboot,
  $sites_mount_options          = $::apache::params::sites_mount_options,
  $sites_mount_fstype           = $::apache::params::sites_mount_fstype,
  $settings_mount_point_ext_o   = $::apache::params::settings_mount_point_ext_o,
  $settings_mount_point_int_o   = $::apache::params::settings_mount_point_int_o,
  $settings_mount_point_d       = $::apache::params::settings_mount_point_d,
  $settings_ip_nfs_server       = $::apache::params::settings_ip_nfs_server,
  $settings_mount_ensure        = $::apache::params::settings_mount_ensure,
  $settings_mount_atboot        = $::apache::params::settings_mount_atboot,
  $settings_mount_options       = $::apache::params::settings_mount_options,
  $settings_mount_fstype        = $::apache::params::settings_mount_fstype,

# Estos parametros, definen el ambiente en el que se encontrara (DEV, QA, etc) y si es para servicios INT o EXT
  $ambiente             = $::apache::params::ambiente,
  $servicio_externo     = $::apache::params::servicio_externo,

# Parametros de configuracion propios de PHP
  $php_config_file              = $::apache::params::php_config_file,
  $php_config_file_mode         = $::apache::params::php_config_file_mode,
  $php_config_file_owner        = $::apache::params::php_config_file_owner,
  $php_config_file_group        = $::apache::params::php_config_file_group,
  $php_config_file_template     = $::apache::params::php_config_file_template,
  $php_display_errors           = $::apache::params::php_display_errors,
  $php_error_log                = $::apache::params::php_error_log,
  $php_error_reporting          = $::apache::params::php_error_reporting,
  $php_extension                = $::apache::params::php_extension,
  $php_memory_limit             = $::apache::params::php_memory_limit,
  $php_post_max_size            = $::apache::params::php_post_max_size,
  $php_upload_max_filesize      = $::apache::params::php_upload_max_filesize,

# Parametros referentes a la configuracion de la extension redis para php en apache
  $php_redis_extension_file             = $::apache::params::php_redis_extension_file,
  $php_redis_extension_file_mode        = $::apache::params::php_redis_extension_file_mode,
  $php_redis_extension_file_owner       = $::apache::params::php_redis_extension_file_owner,
  $php_redis_extension_file_group       = $::apache::params::php_redis_extension_file_group,
  $php_redis_extension_file_template    = $::apache::params::php_redis_extension_file_template,
  $php_redis_extension                  = $::apache::params::php_redis_extension,
  $php_redis_session_save_handler       = $::apache::params::php_redis_session_save_handler,
  $php_redis_session_save_path          = $::apache::params::php_redis_session_save_path,

# Parametros referentes a la configuracion del WEBSERVER
  $httpd_config_dir                     = $::apache::params::httpd_config_dir,
  $httpd_config_file                    = $::apache::params::httpd_config_file,
  $httpd_config_file_mode               = $::apache::params::httpd_config_file_mode,
  $httpd_config_file_owner              = $::apache::params::httpd_config_file_owner,
  $httpd_config_file_group              = $::apache::params::httpd_config_file_group,
  $httpd_config_file_template           = $::apache::params::httpd_config_file_template,
  $httpd_sysconfig_file                 = $::apache::params::httpd_sysconfig_file,
  $httpd_sysconfig_file_template        = $::apache::params::httpd_sysconfig_file_template,
  $server_root                          = $::apache::params::server_root,
  $listen_port                          = $::apache::params::listen_port,
  $include_conf_modules_dir             = $::apache::params::include_conf_modules_dir,
  $user                                 = $::apache::params::user,
  $group                                = $::apache::params::group,
  $server_admin                         = $::apache::params::server_admin,
  $directory_root                       = $::apache::params::directory_root,
  $root_allow_override                  = $::apache::params::root_allow_override,
  $root_require_all_denied              = $::apache::params::root_require_all_denied,
  $document_root                        = $::apache::params::document_root,
  $directory_content                    = $::apache::params::directory_content,
  $content_allow_override               = $::apache::params::content_allow_override,
  $content_all_granted                  = $::apache::params::content_all_granted,
  $document_root                        = $::apache::params::document_root,
  $document_root_indexes                = $::apache::params::document_root_indexes,
  $document_root_allow_override         = $::apache::params::document_root_allow_override,
  $document_root_all_granted            = $::apache::params::document_root_all_granted,
  $httpd_dir_module_enable              = $::apache::params::httpd_dir_module_enable,
  $httpd_dir_module_dir_index           = $::apache::params::httpd_dir_module_dir_index,
  $files_ht_prevent                     = $::apache::params::files_ht_prevent,
  $files_ht_prevent_requiere            = $::apache::params::files_ht_prevent_requiere,
  $error_log_file                       = $::apache::params::error_log_file,
  $access_log_file                      = $::apache::params::access_log_file,
  $log_level                            = $::apache::params::log_level,
  $httpd_log_config_module_enable       = $::apache::params::httpd_log_config_module_enable,
  $httpd_logio_module_enable            = $::apache::params::httpd_logio_module_enable,
  $httpd_log_format_custom_enable       = $::apache::params::httpd_log_format_custom_enable,
  $httpd_log_format_custom_code         = $::apache::params::httpd_log_format_custom_code,
  $httpd_log_format_custom_tag          = $::apache::params::httpd_log_format_custom_tag,
  $httpd_log_format_common_enable       = $::apache::params::httpd_log_format_common_enable,
  $httpd_log_format_common_code         = $::apache::params::httpd_log_format_common_code,
  $httpd_log_format_common_tag          = $::apache::params::httpd_log_format_common_tag,
  $httpd_log_format_combined_enable     = $::apache::params::httpd_log_format_combined_enable,
  $httpd_log_format_combined_code       = $::apache::params::httpd_log_format_combined_code,
  $httpd_log_format_combined_tag        = $::apache::params::httpd_log_format_combined_tag,
  $httpd_log_format_combinedio_enable   = $::apache::params::httpd_log_format_combinedio_enable,
  $httpd_log_format_combinedio_code     = $::apache::params::httpd_log_format_combinedio_code,
  $httpd_log_format_combinedio_tag      = $::apache::params::httpd_log_format_combinedio_tag,
  $httpd_custom_log_enable              = $::apache::params::httpd_custom_log_enable,
  $httpd_alias_module_enable            = $::apache::params::httpd_alias_module_enable,
  $script_alias_cgi_bin                 = $::apache::params::script_alias_cgi_bin,
  $httpd_mime_module_enable             = $::apache::params::httpd_mime_module_enable,
  $add_default_charset                  = $::apache::params::add_default_charset,
  $httpd_mime_magic_module_enable       = $::apache::params::httpd_mime_magic_module_enable,
  $mime_magic_file                      = $::apache::params::mime_magic_file,
  $enable_send_file                     = $::apache::params::enable_send_file,
  $include_optional_conf_d              = $::apache::params::include_optional_conf_d,
  $settings_mount_point_d               = $::apache::params::settings_mount_point_d,

) inherits apache::params {

# Aca se verifica que solo se instale apache con esta configuracion solo en equipos de la familia Red Hat superior a 7
  if $::operatingsystemmajrelease == '7' {

# Se incluyen los modulos de la clase Apache (No requiere orden especifico).
    include apache::install
    include apache::params
    include apache::service
    include apache::repos
    include apache::config
    include apache::mount_nfs

# Se llaman a cada uno de los modulos
    Class['apache::repos']
    -> Class['apache::install']
    -> Class['apache::config']
    -> Class['apache::mount_nfs']
    -> Class['apache::service']
  }
}
