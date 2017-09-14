# Class: apache::repos
#
# This class config repo of the application.
#
class apache::repos {

# Listado de variables que manejan los repositorios a configurar e instalar
  $repo_php_file_name                   = $::apache::repo_php_file_name
  $repo_php_status                      = $::apache::repo_php_status
  $repo_php_description                 = $::apache::repo_php_description
  $repo_php_baseurl                     = $::apache::repo_php_baseurl
  $repo_oic_file_name                   = $::apache::repo_oic_file_name
  $repo_oic_status                      = $::apache::repo_oic_status
  $repo_oic_description                 = $::apache::repo_oic_description
  $repo_oic_baseurl                     = $::apache::repo_oic_baseurl
  $available_mod_php                    = $::apache::available_mod_php
  $available_mod_oracle_instant_client  = $::apache::available_mod_oracle_instant_client
  $available_mod_opcache                = $::apache::available_mod_opcache
  $available_mod_oci8                   = $::apache::available_mod_oci8
  $proxy_url                            = $::apache::proxy_url

# El siguiente bloque de codigo, valida si hemos habilitado la instalacion del modulo de PHP y el de Oracle Instant Client
  if $available_mod_php { # Chequea de instalar PHP
    if $repo_php_baseurl {
      if $available_mod_oracle_instant_client { # Chequea de instalar Oracle Instant Client
        if $available_mod_oracle_instant_client {
          yumrepo { $repo_php_file_name: # Configura el repositorio para PHP
            enabled         => $repo_php_status,
            descr           => $repo_php_description,
            baseurl         => $repo_php_baseurl,
            gpgcheck        => 0,
            proxy           => $proxy_url,
          }
          yumrepo { $repo_oic_file_name: # Configura el repositorio para Oracle Instant Client
            enabled         => $repo_oic_status,
            descr           => $repo_oic_description,
            baseurl         => $repo_oic_baseurl,
            gpgcheck        => 0,
            proxy           => $proxy_url,
          }
        }
      }
    }
    # En este punto, se ingresa si solo se habilito la instalacion del PHP
    else {
      if $repo_php_baseurl {
        yumrepo { $repo_php_file_name:
          enabled         => $repo_php_status,
          descr           => $repo_php_description,
          baseurl         => $repo_php_baseurl,
          gpgcheck        => 0,
          proxy           => $proxy_url,
        }
      }
    }
  }
  # Aca solo se procede a configurar el repositorio para Oracle Instant Client si se habilito
  else {
    if $available_mod_oracle_instant_client {
      if $repo_oic_baseurl {
        yumrepo { $repo_oic_file_name:
          enabled         => $repo_oic_status,
          descr           => $repo_oic_description,
          baseurl         => $repo_oic_baseurl,
          gpgcheck        => 0,
          proxy           => $proxy_url,
        }
      }
    }
  }
}
