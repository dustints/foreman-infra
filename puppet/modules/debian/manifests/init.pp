# uses a (slightly modified) 3rd-party pbuilder module to create
# tgz images of the specified OSs, as well as a hook script and an
# execution script. This can be use to build a package.
#
class debian {

  package { 'gem2deb': ensure => present }

  debian::pbuilder_setup {
    "squeeze64":
      ensure     => present,
      backports  => true,
      arch       => 'amd64',
      release    => 'squeeze',
      apturl     => 'http://ftp.de.debian.org/debian',
      aptcontent => "deb http://ftp.uk.debian.org/debian/ squeeze main non-free contrib\ndeb-src http://ftp.uk.debian.org/debian/ squeeze main non-free contrib\n";
    "squeeze32":
      ensure     => present,
      backports  => true,
      arch       => 'i386',
      release    => 'squeeze',
      apturl     => 'http://ftp.de.debian.org/debian',
      aptcontent => "deb http://ftp.uk.debian.org/debian/ squeeze main non-free contrib\ndeb-src http://ftp.uk.debian.org/debian/ squeeze main non-free contrib\n";
    "wheezy64":
      ensure     => present,
      arch       => 'amd64',
      release    => 'wheezy',
      apturl     => 'http://ftp.de.debian.org/debian',
      aptcontent => "deb http://ftp.uk.debian.org/debian/ wheezy main non-free contrib\ndeb-src http://ftp.uk.debian.org/debian/ wheezy main non-free contrib\n";
    "wheezy32":
      ensure     => present,
      arch       => 'i386',
      release    => 'wheezy',
      apturl     => 'http://ftp.de.debian.org/debian',
      aptcontent => "deb http://ftp.uk.debian.org/debian/ wheezy main non-free contrib\ndeb-src http://ftp.uk.debian.org/debian/ wheezy main non-free contrib\n";
    "precise64":
      ensure     => present,
      arch       => 'amd64',
      release    => 'precise',
      apturl     => 'http://ubuntu.osuosl.org/ubuntu/',
      aptcontent => "deb http://ubuntu.osuosl.org/ubuntu/ precise main restricted\ndeb-src http://ubuntu.osuosl.org/ubuntu/ precise main restricted\n";
    "precise32":
      ensure     => present,
      arch       => 'i386',
      release    => 'precise',
      apturl     => 'http://ubuntu.osuosl.org/ubuntu/',
      aptcontent => "deb http://ubuntu.osuosl.org/ubuntu/ precise main restricted\ndeb-src http://ubuntu.osuosl.org/ubuntu/ precise main restricted\n";
    "trusty64":
      ensure     => present,
      arch       => 'amd64',
      release    => 'trusty',
      apturl     => 'http://ubuntu.osuosl.org/ubuntu/',
      aptcontent => "deb http://ubuntu.osuosl.org/ubuntu/ trusty main restricted universe\ndeb-src http://ubuntu.osuosl.org/ubuntu/ trusty main restricted universe\n";
    "trusty32":
      ensure     => present,
      arch       => 'i386',
      release    => 'trusty',
      apturl     => 'http://ubuntu.osuosl.org/ubuntu/',
      aptcontent => "deb http://ubuntu.osuosl.org/ubuntu/ trusty main restricted universe\ndeb-src http://ubuntu.osuosl.org/ubuntu/ trusty main restricted universe\n";
  }

  # Add freight setup
  include freight::uploader

  # TODO: Cleanup failed pbuilder mounts as a cron

}
