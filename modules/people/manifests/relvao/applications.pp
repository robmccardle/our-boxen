class people::relvao::applications {
  
  include chrome
  include brewcask
  include virtualbox

  # Firefox is only updatable when installed via cask
  package { 'firefox': provider => 'brewcask' }
  
  #TODO split the above into team config
  #TODO add in Tiago's personal config

}
