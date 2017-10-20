require_relative './classes.rb'

def browser
  Browser.new
end

def checkbox(locator)
  Checkbox.new(locator)
end

def element(locator)
  Element.new(locator)
end

def expect(value)
  Expect.new(value)
end

def select_box(locator)
  Select.new(locator)
end

def url(name)
  Url.new(name)
end

# def time_with_scenario_context # For use in reporter (may add this to screenshot capability)
#   "#{$scenario.feature.name.sub(' ', '_')}_#{$scenario.name.sub(' ', '_')}_#{Time.now.strftime('%H_%M_%S')}"
# end

def collect_attributes(selenium_element, parent = false)
  css = selenium_element.tag_name
  attributes_to_collect = parent ? %w(class id name alt href src title) : %w(class id name value alt href src title) # Do not need value for parent
  attributes_to_collect.each {
      |attrib|
    attribute_found = selenium_element.attribute(attrib)
    if attribute_found.to_s.length >=1
      css += "[#{attrib}='#{attribute_found}']"
    end
  }
  css
end

def selenium_to_framework_element(selenium_element)
  selenium_css = collect_attributes(selenium_element)
  parent_css = collect_attributes(selenium_element.find_element({xpath: 'parent::*'}), true)
  Element.new({css: "#{parent_css} #{selenium_css}"})
end