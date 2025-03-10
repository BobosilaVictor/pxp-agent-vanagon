platform 'debian-9-i386' do |plat|
  plat.defaultdir '/etc/default'
  plat.servicetype 'systemd', servicedir: '/lib/systemd/system'
  plat.servicetype 'sysv', servicedir: '/etc/init.d'
  plat.codename 'stretch'

  plat.add_build_repository "http://pl-build-tools.delivery.puppetlabs.net/debian/pl-build-tools-release-#{plat.get_codename}.deb"
  plat.provision_with 'export DEBIAN_FRONTEND=noninteractive; apt-get update -qq; apt-get install -qy --no-install-recommends build-essential devscripts make quilt pkg-config debhelper rsync fakeroot'
  plat.install_build_dependencies_with 'DEBIAN_FRONTEND=noninteractive; apt-get install -qy --no-install-recommends '
  plat.vmpooler_template 'debian-9-i386'
end
