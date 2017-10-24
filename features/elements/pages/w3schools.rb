module Project
  module Pages
    module W3schools
      def self.elements
        {
            iframe: element({id: 'iframeResult'}),
            select: select_box({css: 'select'})
        }
      end

      # Selects the option given in the W3Schools example of the select box
      def self.select_option(option)
        w3frame = elements[:iframe]
        w3select = elements[:iframe]

        browser.wait.for {
          w3frame.to.be.displayed
        }

        w3frame.switch.to.frame
        w3select.select(option)
      end
    end
  end
end