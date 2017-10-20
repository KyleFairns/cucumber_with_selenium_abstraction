require 'yaml'
require_relative '../../support/world'

Element.class_eval do
  def find
    paused?
    Browser.new.wait.for do
      get_driver.find_element(self.locator)
    end
    return self
  end

  def all
    paused?
    all_matches = get_driver.find_elements(self.locator)
    converted_matches = all_matches.collect do |match|
      unless converted_matches
        converted_matches = []
      end
      converted_matches.push(selenium_to_framework_element(match))
    end

    return converted_matches
  end

  def found
    self.find
  end

  def attribute(attrib)
    self.find
    return get_driver.find_element(self.locator).attribute(attrib)
  end
end
