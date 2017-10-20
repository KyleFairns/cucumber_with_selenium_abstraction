require 'fileutils'


Element.class_eval do
  def attribute(attrib)
    self.find
    return get_driver.find_element(self.locator).attribute(attrib)
  end

  def tag
    self.find
    return get_driver.find_element(self.locator).tag_name
  end

  def value
    return self.get.attribute('value')
  end

  def text
    self.find
    if get_driver.find_element(self.locator).text != ''
      return get_driver.find_element(self.locator).text
    else
      if self.get.value != ''
        return self.get.value
      else
        return ''
      end
    end
  end

  def location?
    self.find
    return get_driver.find_element(self.locator).location
  end

  def displayed?
    self.find
    return get_driver.find_element(self.locator).displayed?
  end

  def selected?
    self.find
    if self.switches[:option].value? === true
      return selenium_to_framework_element(Selenium::WebDriver::Support::Select.new(get_driver.find_element(self.locator)).first_selected_option)
    else
      if self.switches[:option].value?
        return selenium_to_framework_element(Selenium::WebDriver::Support::Select.new(get_driver.find_element(self.locator)).first_selected_option).text
      else
        return get_driver.find_element(self.locator).selected?
      end
    end
  end
end

# TODO
def create_folder(folder)
  unless File.directory?(folder)
    FileUtils.mkdir_p(folder)
  end
end

Browser.class_eval do
  def screenshot
    screenshots_dir = File.expand_path 'features/../screenshots/'
    path = "#{screenshots_dir}/#{Time.now.strftime('%Y/%m/%d/')}"
    FileUtils.mkdir_p(path) unless File.exists?(path)
    screenshot_path = "#{path}/#{time_with_scenario_context}.png"
    get_driver.save_screenshot(screenshot_path)
  end
end
