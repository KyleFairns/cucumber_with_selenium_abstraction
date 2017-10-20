require 'selenium-webdriver'
require 'yaml'

def start_driver
  profile = get_profile
  browser = profile['browser']['name'].downcase
  prefs = {
      setAlertBehaviour: 'dismiss',
      unexpectedAlertBehaviour: 'dismiss',
      restart: 'true'
  }

  Selenium::WebDriver.for :"#{browser}", prefs: prefs
end

def get_driver
  unless $driver
    $driver = start_driver
  end

  $driver
end


