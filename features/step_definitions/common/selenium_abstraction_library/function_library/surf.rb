Element.class_eval do
  def click
    self.find
    if self.switches[:double].value?
      get_driver.find_element(self.locator).double_click
    else
      get_driver.find_element(self.locator).click
    end
    return self.reset_switches
  end

  def hover
    self.find
    get_driver.find_element(self.locator).hover
    return self
  end
end
