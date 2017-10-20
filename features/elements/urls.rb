module Project
  module Urls
    def self.urls
      {
          home: url('http://www.google.com/')
      }
    end

    def self.go_to(page_reference)
      if /^https?:\/\// =~ page_reference
        # This is for when passed a url, rather than a reference
        address = page_reference
      else
        # Looks through the URLs map to pull out correct reference
        all_urls = urls
        address = all_urls[:"#{page_reference}"]
      end

      address.go
    end
  end
end