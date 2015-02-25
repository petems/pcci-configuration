
$packages = [
  'pip',
  'virtualbox',
  'ruby-dev',
]

package { $packages:
  ensure => latest,
}


user { 'pcci':
  ensure     => present,
  managehome => true,
} ->

file { '/home/pcci/.ssh':
  ensure => directory,
  owner  => 'pcci',
  mode   => '0700',
} ->

ssh_authorized_key { 'nibz-key':
  ensure => present,
  type   => 'ssh-rsa',
  key    => 'AAAAB3NzaC1yc2EAAAADAQABAAACAQDW+WftKW0GvHKnIAZuE+WCcgLYzSj5LaJ1BEg1DXtBU8yKpTmdunjtJ47F0nVap/6nmbi3Xif4KHYEMoSkmyU+hqEbpFX/GzoJ0i69Kf+FYHfP5ZC8MD9NjdZ7pyPNIXvKTqRUc+ghDVwyDdtVOEiUtOTVrzDsKrDheZi9TvXTZ4fHj4ykuwDQeNwUoEBuhYZSg6/82+Bsqv/l5lOuZrOOOLikOK733KhBvXhEaeChxT2Tc0biaUuJFa7w+i/lc7uBuF3jY8H5cSd/FpKNgAMd4VaebX6m0WqYSWz+VlLARqyz8AP0jlK/2cHiB8Yu0zK34Q+os1tBzc6dc8jyxyjUA5ydDsUnRXaYlHAwsPGygb5EyCgll78EXR2MjSCWX6kfbG4NTM1T00Ezftld0jbcNG5t6skkYPnZQhTpesnauwc6Kj+ME+kftHpyd1HxWM24IeCRG0PznJuxNxBp8PlSMWDZtf1f5+ez7Z9rj0Qxi0Jd53EOMGSfYQUuMXRpnk7M/rX50J9wRts/+OnoH/4AxUAU5yB2ELzi6f4lt2Scqruj7Xp78SW++0nbdQQwYTqiNfLA789jIGaM2r1GAn06oX7jyEpniglaNf/9KGZVb+Y4WWLV4Wr8xfPrsQf1i5YK94qhN4C8NrXOG7hEcYT7Rvu2jKZ4dhwGxh4SmWNY0Q==',
  comment => 'nibz@maxwell',
}

vcsrepo { '/opt/pcci':
  ensure   => latest,
  provider => git,
  revision => 'master',
  source   => 'https://github.com/nibalizer/pcci.git',
}

vcsrepo { '/root/pcci-configuration':
  ensure   => latest,
  provider => git,
  revision => 'master',
  source   => 'https://github.com/nibalizer/pcci-configuration.git',
}
