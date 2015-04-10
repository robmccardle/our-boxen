class people::dotcomjohn::applications {
  
  include chrome
  include brewcask
  include virtualbox

  # Firefox is only updatable when installed via cask
  package { 'firefox': provider => 'brewcask' }
  
  #TODO split the above into team config
  #TODO add in Stretch's personal config

}
