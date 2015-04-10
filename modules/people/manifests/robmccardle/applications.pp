class people::robmccardle::applications {
  
  include chrome
  include onepassword
  include iterm2::stable 
  include sourcetree
  include dropbox
  include spectacle
  include vlc
  include phantomjs
  include nmap
  include sublime_text_2
  include skype
  include php
  include mongodb
  include brewcask
  include virtualbox
  
  package { 'firefox': provider => 'brewcask' }
  package { 'evernote': provider => 'brewcask' }
  package { 'filezilla': provider => 'brewcask' }
  package { 'charles': provider => 'brewcask' }

  # OSX tweaks
  include osx::finder::show_all_filename_extensions
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files

  # Make the top right corner start the screen saver and the bottom left corner launch Mission Control
  class { 'osx::dock::hot_corners':
    top_right => "Start Screen Saver",
    bottom_left => "Mission Control"
  }

  # Enable OS Zoom
  class { 'osx::mouse::smart_zoom':
    enabled => true
  }

  # Ensure bundler gem is installed for all ruby versions
  ruby_gem { 'bundler for all rubies':
    gem          => 'bundler',
    version      => '~> 1.0',
    ruby_version => '*',
  }

  # Ensure specific Capistrano gem is installed for all ruby versions
  ruby_gem { 'Specific version of Capistrano for all rubies':
    gem          => 'capistrano',
    version      => '2.15.5',
    ruby_version => '*',
  }

}
