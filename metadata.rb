maintainer       "Heavy Water Operations, LLC"
maintainer_email "ops@hw-ops.com"
license          "Apache 2.0"
description      "Installs/Configures omnibus-ninefold-ruby"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

name "omnibus-ninefold"

depends "build-essential"
depends "ruby_installer"
depends "git"
depends "ubuntu"
