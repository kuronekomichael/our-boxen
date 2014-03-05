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

  package {
      'GoogleJapaneseInput':
        source => "http://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg",
        provider => pkgdmg;
      'RemoteDesktopConnectionClient':
        source => "http://download.microsoft.com/download/C/F/0/CF0AE39A-3307-4D39-9D50-58E699C91B2F/RDC_2.1.1_ALL.dmg",
        provider => pkgdmg;
      'iFunBox':
        source => "http://dl.i-funbox.com/mac/ifunboxmac.dmg",
        provider => appdmg;
      'calibre':
        source => "http://download.calibre-ebook.com/1.26.0/calibre-1.26.0.dmg",
        provider => appdmg;
      'Pogoplug':
        source => "http://download.pogoplug.com/install/mac/pogoplugbackup.pkg",
        provider => pkgdmg;
      'LibreOffice':
        source => "http://download.documentfoundation.org/libreoffice/stable/4.2.1/mac/x86/LibreOffice_4.2.1_MacOS_x86.dmg",
        provider => appdmg;
      'GenyMotion':
        source => "http://files2.genymotion.com/genymotion/genymotion-2.1.1/genymotion-2.1.1.dmg",
        provider => appdmg;
# manual install
#      'cooViewer':
#        source => "http://www.geocities.jp/coo_ona/cooviewer1.2b24.dmg",
#      '0xED':
#        source => "http://www.suavetech.com/cgi-bin/download.cgi?0xED.tar.bz2",
#        provider => ;
#      'ImageAlpha':
#        source => "http://pngmini.com/ImageAlpha1.3.5.tar.bz2",
#        provider => ;
#      'TheUnarchiver':
#        source => "http://theunarchiver.googlecode.com/files/TheUnarchiver3.9.1.zip",
#        provider => ;
    }

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