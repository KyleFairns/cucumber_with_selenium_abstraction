module Project
  module Urls
    def self.urls
      {
          home: url('http://www.google.com/'),
          facebook_home: url('https://en-gb.facebook.com/')
      }
    end

    def self.validate_url(page_reference)
      if /^https?:\/\// =~ page_reference
        # This is for when passed a url, rather than a reference
        address = url(page_reference)
      else
        # Looks through the URLs map to pull out correct reference
        all_urls = urls
        address = all_urls[:"#{page_reference}"]
      end

      address
    end

    def self.go_to(page_reference)
      validate_url(page_reference).go
    end
  end
end