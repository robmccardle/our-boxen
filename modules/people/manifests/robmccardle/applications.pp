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
  #include osx
  
  # 1.) These items should be split out as 'team' config

  
    # Set the global default nodejs version
    class { 'nodejs::global': version => 'v0.10' }
  
    # Ensure an additional specific nodejs version (on top of the defaults 6,8,10) is available
#    nodejs::version { 'v0.12': }
  
    # Install global npm modules are installed for the ones we actually use (8,10,12) 
    $global_nodejs_modules = [
      'grunt-cli',
      'bower',
      'yo'
    ]


 #   nodejs::module { $global_nodejs_modules :
 #     node_version => 'v0.8',
 #   }

    nodejs::module { $global_nodejs_modules :
      node_version => 'v0.10',
    }

#    nodejs::module { $global_nodejs_modules :
#      node_version => 'v0.12',
#    }
  
    
    # Firefox is only updatable when installed via cask
    package { 'firefox': provider => 'brewcask' }
  

  # These items are genuinely personal 'robmccardle' config

  # Evernote is only available via cask
  package { 'evernote': provider => 'brewcask' }
  
  
  include osx::finder::show_all_filename_extensions
  include osx::finder::unhide_library

  #include osx::finder::show_warning_before_emptying_trash
  #include osx::global::enable_keyboard_control_access
  #include osx::global::expand_print_dialog
  #include osx::global::expand_save_dialog
  #include osx::global::disable_remote_control_ir_receiver

  # Dock Settings
  #include osx::dock::2d
  #include osx::dock::autohide
  #include osx::dock::clear_dock
  #include osx::dock::disable
  #include osx::dock::disable_dashboard
  #include osx::dock::dim_hidden_apps
  #include osx::dock::hide_indicator_lights


#      # Configure Hot Corners
#    class { 'osx::dock::hot_corners':
#      top_left => 'Desktop',
#      top_right => 'Mission Control',
#      bottom_right => 'Application Windows',
#      bottom_left => 'Put Display to Sleep'
#    }
  
#    # Overide Puppet OSXs default behaviour for zoom
#    class { 'osx::mouse::smart_zoom':
#      enabled => true
#    }

  #include osx::recovery_message { 'If this Mac is found, please call UK number 01628 580058': }
  

  # Set the global default ruby (auto-installs it if it can)
  class { 'ruby::global':
    version => '1.9.3'
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
