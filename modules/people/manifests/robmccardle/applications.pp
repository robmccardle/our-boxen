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


  # OSX Dock tweaks

  # Use the old flat dock style
  include osx::dock::2d 

  # Automatically hide the dock
  include osx::dock::autohide
  
  # Ensures the dock only contains apps that are running
  include osx::dock::clear_dock
  
  # Disable the dock by setting a long autohide-delay
  include osx::dock::disable
  
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


  # Make the top right corner start the screen saver and the bottom left corner launch Mission Control
  class { 'osx::dock::hot_corners':
    top_right => "Start Screen Saver",
    bottom_left => "Mission Control"
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
