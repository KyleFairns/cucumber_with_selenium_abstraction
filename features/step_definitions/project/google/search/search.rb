google = Project::Pages::Google

When 'I search for {string}' do |search_term|
  @search_term = search_term
  google.search_for @search_term
end

Then 'I should see a result' do
  google.find_result
  google.follow_result(@search_term)
end