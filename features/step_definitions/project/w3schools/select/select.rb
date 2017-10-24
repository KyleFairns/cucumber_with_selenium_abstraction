w3schools = Project::Pages::W3schools

Given 'I should be able to select {string} from the W3Schools test selector' do |option|
  w3schools.select_option(option)
end