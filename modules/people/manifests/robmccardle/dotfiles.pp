# Dotfiles
class people::robmccardle::dotfiles inherits people::robmccardle {

	#notify { "Setting up dotfiles repo and symlinks": }

	notify {"Variable  \$my_homedir ${my_homedir} as the definition":}

	repository {
  		'/Users/rmc/.dotfiles':
    	source   => 'robmccardle/dotfiles', #short hand for github repos
    	provider => 'git';
  	}

  	# Ensure a Symlink exists to the version controlled bash profile

	notify { "Creating symlink": }

  	file { '/Users/rmc/.bash_profile':
  		ensure => 'link',
  		target => '/Users/rmc/.dotfiles/.bash_profile',
	}

	# target => '$my_homedir/.dotfiles/.bash_profile',


}