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
  include sublime_text_2
  include skype
  include php
  include brewcask
  include virtualbox
  package { 'evernote': provider => 'brewcask' }
}
