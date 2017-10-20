Url.class_eval do
  def go
    paused?
    get_driver.navigate.to self.url
    return self
  end
end

