class people::robmccardle {

  	notify { 'class people::robmccardle declared': }
	
	include people::robmccardle::applications
	include people::robmccardle::dotfiles

	# Set git credentials

    include git

    git::config::global { 'user.email':
        value  => 'rob@enigma-marketing.co.uk'
    }
    git::config::global { 'user.name' :
        value  => 'Rob McCardle'
    }

    # Set Home DIR value for use in other scripts
    $my_homedir = "Users/rmc"

}