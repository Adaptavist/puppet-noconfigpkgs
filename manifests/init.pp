class noconfigpkgs(
  $default_packages = {
        'Debian' => [],
        'RedHat' => [],
      },
  $default_gems = {
        'Debian' => [],
        'RedHat' => [],
      }
  ) {

  # validate the package and gem hash
  validate_hash($default_packages)
  validate_hash($default_gems)

  # install packages
  package { $default_packages[$::osfamily] :
      ensure => installed,
  }

  # install gems
  package { $default_gems[$::osfamily] :
      ensure   => installed,
      provider => 'gem',
  }
}
