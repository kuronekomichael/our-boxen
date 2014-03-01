# This file manages Puppet module dependencies.
# このファイルはPuppetモジュールの依存関係を管理します
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.3.8"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

# search to https://github.com/boxen
#      "name"         "tag"
#----------------------------
github "dnsmasq",     "1.0.1"
github "foreman",     "1.1.0"
github "gcc",         "2.0.1"
github "git",         "1.3.7"
github "go",          "2.0.1"
github "homebrew",    "1.6.0"
github "hub",         "1.3.0"
github "inifile",     "1.0.1", :repo => "puppetlabs/puppetlabs-inifile"
github "module-data", "0.0.1", :repo => "ripienaar/puppet-module-data"
github "nginx",       "1.4.3"
github "nodejs",      "3.5.0"
github "openssl",     "1.0.0"
github "phantomjs",   "2.1.0"
github "pkgconfig",   "1.0.0"
github "repository",  "2.3.0"
github "ruby",        "7.1.6"
github "stdlib",      "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",        "1.0.0"
github "xquartz",     "1.1.1"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "iterm2",             "1.0.7"
github "wget",               "1.0.1"
github "firefox",            "1.1.8"
github "charles",            "1.0.4"
github "libreoffice",        "4.1.4"
github "skype",              "1.0.8"
github "virtualbox",         "1.0.10"
github "java",               "1.2.0"
github "android",            "1.1.0"
github "hipchat",            "1.1.0"
github "onepassword",        "1.1.0"
github "dropbox",            "1.2.0"
github "alfred",             "1.1.7"
github "heroku",             "2.1.1"
github "eclipse",            "2.2.0"
github "chrome",             "1.1.2"
github "vlc",                "1.0.5"
github "sourcetree",         "1.0.0"
github "skitch",             "1.0.2"
github "sublime_text_2",     "1.1.2"
github "inkscape",           "1.0.3"
github "handbrake",          "1.0.1"
github "ghostscript",        "1.0.0"
github "nvm",                "1.0.0"
github "imagemagick",        "1.2.1"
github "better_touch_tools", "1.0.0"
github "evernote",           "2.0.5"
github "imageoptim",         "0.0.2"
github "xtrafinder",         "1.0.1"

# Keynote
# cooViewer
# iFunBox
# Google Chrome Canary (include chrome::canary)
# 0xED
# Photoshop CS6
# calibre
# ImageAlpha
# The unarchiver
# atom
# pogoplug