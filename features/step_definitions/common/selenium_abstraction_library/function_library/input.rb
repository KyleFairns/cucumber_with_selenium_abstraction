Element.class_eval do

  def keys(first, *text)
    paused?
    get_driver.find_element(self.locator).send_keys(first, text)
    return self
  end

  def key(first, *text)
    paused?
    return self.keys(first, text)
  end

  def clear
    self.find
    get_driver.find_element(self.locator).clear
    return self
  end

  def with(text)
    self.clear
    self.switches[:fill].value? === true ? self.send.keys(text) : text.split('').each do |letter|
      self.send.keys(letter)
    end
    return self.reset_switches
  end

  def select(option_text)
    self.find
    Selenium::WebDriver::Support::Select.new(get_driver.find_element(self.locator)).select_by(:text, option_text)
    return self
  end
end
