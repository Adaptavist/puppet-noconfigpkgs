class noconfigpkgs::git(
    $gitpackage = $noconfigpkgs::params::gitpackage,
    ) inherits noconfigpkgs::params {

  package { $gitpackage:
    ensure => 'latest',
  }
}
