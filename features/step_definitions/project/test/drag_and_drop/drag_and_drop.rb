Given 'I drag and drop the image' do
  test_page = Url.new('https://www.w3schools.com/html/html5_draganddrop.asp')
  image = Element.new({css: '#drag1'})
  drop_location = Element.new({css: '#div2'})

  test_page.go_to
  image.drag_and_drop_to(drop_location)
end

When 'I wait 5 seconds' do
  browser.wait(5)
end