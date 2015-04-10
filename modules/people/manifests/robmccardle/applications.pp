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
  include osx
  
  # 1.) These items should be split out as 'team' config

  
    # Ensure an additional specific nodejs version (on top of the defaults 6,8,10) is available
#    nodejs::version { 'v0.12': }
  
    # Install global npm modules are installed for the ones we actually use (8,10,12) 
    $global_nodejs_modules = [
      'grunt-cli',
      'bower',
        'yo'
    ]
  
    nodejs::module { $global_nodejs_modules :
      node_version => 'v0.8',
    }
    nodejs::module { $global_nodejs_modules :
      node_version => 'v0.10',
    }
#    nodejs::module { $global_nodejs_modules :
#      node_version => 'v0.12',
#    }
  
    # Set the global default nodejs version
    #class { 'nodejs::global': version => 'v0.10' }
  
    # Firefox is only updatable when installed via cask
    package { 'firefox': provider => 'brewcask' }
  

  # These items are genuinely personal 'robmccardle' config

    # Evernote is only available via cask
    package { 'evernote': provider => 'brewcask' }
  
  #include osx::finder::show_all_filename_extensions
  include osx::finder::show_warning_before_emptying_trash

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

#    osx::recovery_message { 'If this Mac is found, please call UK number 01628 580058': }
  

}
