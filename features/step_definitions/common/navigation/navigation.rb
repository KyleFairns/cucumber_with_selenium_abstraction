urls = Project::Urls

# Page Object Model standards are included here
Given 'I navigate to the {string} page' do |page|
  urls.go_to(page.downcase)
end
