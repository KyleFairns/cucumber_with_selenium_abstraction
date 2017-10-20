Element.class_eval do
  def drag_and_drop_to(framework_element)
    driver = get_driver
    startpoint = driver.find_element(self.locator)
    endpoint = driver.find_element(framework_element.locator)

    driver.action.drag_and_drop(startpoint, endpoint).perform
  end
end