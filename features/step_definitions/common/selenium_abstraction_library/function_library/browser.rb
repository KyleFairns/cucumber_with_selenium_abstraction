require_relative '../classes'


Element.class_eval do
  def frame
    paused?
    get_driver.switch_to.frame(get_driver.find_element(self.locator))
    return self
  end
end

Browser.class_eval do

  # Each tab is treated as a new window to switch to. TODO: Tab switching

  def back
    paused?
    get_driver.navigate.back
    return self
  end

  def forward
    get_driver.navigate.forward
    return self
  end

  def refresh
    get_driver.navigate.refresh
    return self
  end

  def reload
    return self.refresh
  end

  def default
    get_driver.switch_to.default_content
    return self
  end

  def url(*expected)
    if self.switches[:current]
      self.reset_switches
      return get_driver.current_url
    else
      expect(self.current.url).to.be.equal.to(expected)
    end
  end
end
