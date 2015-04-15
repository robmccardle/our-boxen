# Symlinks file
class people::robmccardle::symlinks inherits people::robmccardle {

	notify { "Setting up symlinks": }

  	# Ensure a Symlink exists to the version controlled bash profile

  	#file { '$my_homedir/.bash_profile':
  	#	ensure => 'link',
  	#	target => '$my_homedir/.dotfiles/.bash_profile',
	#}

}