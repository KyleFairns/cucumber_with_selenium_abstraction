Element.class_eval do
  # @param property
  # @raise When a statement is false, it will raise an exception, halting test execution.
  # @example
  #  text_box_color = Element.new({css: 'input[name="q"]'}).style('color')
  #
  def style(property)
    self.find
    return get_driver.find_element(self.locator).style(property)
  end
end
