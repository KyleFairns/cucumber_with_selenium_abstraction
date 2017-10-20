Browser.class_eval do
  def maximise
    paused?
    get_driver.manage.window.maximize
  end

  def size(width, height)
    paused?
    get_driver.manage.window.size(width, height)
  end
end

Element.class_eval do
  def size
    paused?
    get_driver.find_element(self.locator).size
  end

  def width
    paused?
    size.width
  end

  def height
    paused?
    size.height
  end
end
