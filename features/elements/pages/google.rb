module Project
  module Pages
    module Google
      def self.elements
        {
            search: element({css: 'input[name="q"]'}),
            result: element({css: 'h3.r a'})
        }
      end

      # Sends search term to the search box on google, and presses enter
      def self.search_for(search_term)
        search = elements[:search]

        search.fill.with(search_term).then.send.key(:enter)
      end

      # Checks for any result to be displayed
      def self.find_result
        result = elements[:result]

        browser.wait.for {
          result.to.be.displayed
        }
      end

      #WiP
      def self.follow_result(text)
        all_results = elements[:result].find.all
        result = false

        all_results[0].each do |element|
          if element.text.include? text
            result = element
            break
          end
        end

        result.click
        browser.wait 5
      end
    end
  end
end

