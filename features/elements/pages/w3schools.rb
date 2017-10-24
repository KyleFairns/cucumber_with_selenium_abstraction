module Project
  module Pages
    module W3schools
      def self.elements
        {
            iframe: element({id: 'iframeResult'}),
            select: select_box({css: 'select'})
        }
      end

      def self.select_option(option)
        browser.wait.for {
          elements[:iframe].to.be.displayed
        }

        elements[:iframe].switch.to.frame
        elements[:select].select(option)
      end
    end
  end
end