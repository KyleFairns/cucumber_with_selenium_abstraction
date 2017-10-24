urls = Project::Urls

# Page Object Model standards are included here
Given 'I navigate to (the ){string}( page)' do |page|
  urls.go_to(page.gsub(' ', '_').downcase)
end

Given 'I should be on (the ){string}( page)' do |page|
  expect(browser.current.url).to.be.equal.to(urls.validate_url(page))
end