class people::robmccardle::applications {
  include chrome
  include onepassword
  include onepassword::chrome
  include iterm2::stable 
  include firefox
  include sourcetree
  include dropbox
  include spectacle
  include vlc
  include phantomjs
  include nmap

  # For the latest version of v2
  include sublime_text::v2
  sublime_text::v2::package { 'Emmet':
    source => 'sergeche/emmet-sublime'
  }

  #include adobe_creative_cloud
  include skype
  include php
}
