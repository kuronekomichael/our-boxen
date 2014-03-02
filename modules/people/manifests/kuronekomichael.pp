class people::kuronekomichael {

  # Puppetfile で定義したもの
  include chrome
  include chrome::canary
  include iterm2::stable
  include wget
  include firefox
  include charles
  include skype
  include virtualbox
  include java
  include android
  include hipchat
  include onepassword
  include dropbox
  include alfred
  include heroku
  include eclipse::java
  include vlc
  include sourcetree
  include skitch
  include sublime_text_2
  include inkscape
  include handbrake
  include better_touch_tools
  include evernote
  include imageoptim
  include xtrafinder

  # homebrew でインストールするもの
  package {
    [
      'coreutils',
      'tmux',
      'reattach-to-user-namespace',
      'pidof',
      'ctags',
      'autoconf',
      'ffmpeg',
      'gnutls',
      'libebml',
      'libusb',
      'mongodb',
      'phantomjs',
      'tig',
      'automake',
      'flac',
      'gpac',
      'libgcrypt',
      'libvo-aacenc',
      'nettle',
      'pkg-config',
      'tree',
      'bison',
      'fontconfig',
      'jbig2dec',
      'libgpg-error',
      'libvorbis',
      'nkf',
      'popt',
      'unrar',
      'boost',
      'freetype',
      'jpeg',
      'libmatroska',
      'libvpx',
      'node',
      'readline',
      'weechat',
      'casperjs',
      'fribidi',
      'lame',
      'libogg',
      'libyaml',
      'nvm',
      'rtmpdump',
      'cmake',
      'gdbm',
      'lha',
      'libpng',
      'little-cms2',
      'opencore-amr',
      'x264',
      'gettext',
      'libao',
      'libsndfile',
      'lzo',
      'openssl',
      'sox',
      'xvid',
      'curl',
      'ghostscript',
      'libass',
      'libtasn1',
      'mad',
      'optipng',
      'ssh-copy-id',
      'xz',
      'dvdbackup',
      'git-flow',
      'libdvdcss',
      'libtiff',
      'maven',
      'p11-kit',
      'texi2html',
      'yasm',
      'faac',
      'gmp',
      'libdvdread',
      'libtool',
      'p7zip',
      'youtube-dl',
      'nicovideo-dl',
      'imagemagick',
    ]:
    ensure => 'latest',
  }

#      'mkvtoolnix',
# 'GoogleJapaneseInput': source => "http://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg", provider => pkgdmg;

  $home     = "/Users/${::boxen_user}"
  $dotfiles = "${home}/.dotfiles"

  file { $home:
    ensure  => directory
  }

  # git clone git@github.com:kuronekomichael/dotfiles.git
  repository { $dotfiles:
    source  => 'kuronekomichael/dotfiles',
    require => File[$home]
  }

  # git-cloneしたら install.sh を走らせる
  exec { "sh ${dotfiles}/install.sh":
    cwd => $dotfiles,
    creates => "${home}/.bashrc",
    require => Repository[$dotfiles],
  }
}