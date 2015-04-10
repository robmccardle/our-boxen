class people::stvwlkr::applications {
  
  include chrome
  include brewcask
  include virtualbox

  # Firefox is only updatable when installed via cask
  package { 'firefox': provider => 'brewcask' }
  
  #TODO split the above into team config
  #TODO add in Steve's personal config

}
