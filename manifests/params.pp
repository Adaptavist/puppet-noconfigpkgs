
class noconfigpkgs::params {
    $gitpackage = $::osfamily ? {
    RedHat => 'git',
    Debian => 'git-core',
    default => 'git'
  }

}