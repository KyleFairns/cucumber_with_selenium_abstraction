require 'selenium-webdriver'
Browser.class_eval do

  def wait(*seconds)
    if seconds.join('').to_i > 0
      sleep(seconds.join('').to_i)
    end
    return self
  end

  def for(seconds = get_profile['timeouts']['step'] ? get_profile['timeouts']['step'].to_i : 20)
    wait = Selenium::WebDriver::Wait.new(:timeout => seconds)
    wait.until {
      yield
    }
  end

  def until(*seconds)
    self.wait.for(*seconds) {
      yield
    }
  end
end
