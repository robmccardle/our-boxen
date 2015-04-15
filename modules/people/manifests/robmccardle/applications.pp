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
  include elasticsearch

  # Java 7 needed for Slack
  include java
  # Java 6 needed for Charles
  include java6
    
  package { 'firefox': provider => 'brewcask' }
  package { 'evernote': provider => 'brewcask' }
  package { 'filezilla': provider => 'brewcask' }
  package { 'charles': provider => 'brewcask' }
  package { 'packer': provider => 'brew' }
  package { 'docker': provider => 'brew' }
  package { 'vagrant': provider => 'brew' }


  # OSX Global tweaks 
  # TODO split into OSX file/class

  # Expand the print dialog by default
  include osx::global::expand_print_dialog 
  
  # Expand the save dialog by default
  include osx::global::expand_save_dialog

  # Disable remote control infrared receiver
  include osx::global::disable_remote_control_ir_receiver

  # Enable OS zoom
  include osx::universal_access::ctrl_mod_zoom

  # Disable the downloaded app quarantine
  include osx::disable_app_quarantine 

  # Disable creation of .DS_Store files on network shares
  include osx::no_network_dsstores 

  # Download and install software updates
  include osx::software_update 


  # OSX Dock tweaks

  # Use the old flat dock style
  include osx::dock::2d 

  # Automatically hide the dock
  include osx::dock::autohide
  
  # Ensures the dock only contains apps that are running
  include osx::dock::clear_dock
  
  # Disable the dashboard
  include osx::dock::disable_dashboard
  
  # Dims icons of hidden apps
  include osx::dock::dim_hidden_apps
  
  # Remove the indicator lights below running apps
  include osx::dock::hide_indicator_lights
  

  # OSX Finder tweaks

  include osx::finder::show_all_filename_extensions
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files
  include osx::finder::empty_trash_securely
  # Show all mounted drives/networks etc... on Desktop
  include osx::finder::show_all_on_desktop

  include osx::finder::show_warning_before_emptying_trash
  include osx::finder::show_warning_before_changing_an_extension
  include osx::finder::show_all_filename_extensions
  include osx::finder::no_file_extension_warnings

  # OSX 'Hot Corners' mouse over config
  class { 'osx::dock::hot_corners':
    top_left => "Application Windows",
    top_right => "Mission Control",
    bottom_left => "Put Display to Sleep",
    bottom_right => "Desktop"
  }

  # set the global ruby version
  #class { 'ruby::global': 
  #  version => '2.1.2' 
  #}
  # Causes
  # Error: Duplicate declaration: Ruby::Version[2.1.2] is already declared; cannot redeclare at 
  # /opt/boxen/repo/manifests/site.pp:76 on node robs-macbook-pro.local
  # Workaround is to manually run this after boxen run
  #  rbenv global 2.1.2


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
  # Remove the requirement for typing 'rbenv rehash' after installing gems
  ruby_gem { 'rbenv-rehash for all rubies':
    gem          => 'rbenv-rehash',
    version      => '0.3',
    ruby_version => '*',
  }


  # set the global nodejs version
  class { 'nodejs::global': 
    version => 'v0.10.31' 
  }

  # install some npm modules
  nodejs::module { 'grunt-cli':
    node_version => 'v0.10.31'
  }
  nodejs::module { 'bower':
    node_version => 'v0.10.31'
  }
  nodejs::module { 'yo':
    node_version => 'v0.10.31'
  }


  
}
