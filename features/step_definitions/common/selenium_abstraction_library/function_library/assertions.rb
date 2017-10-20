Element.class_eval do

  # @raise When a statement is false, it will raise an exception, halting test execution.
  # @example
  #  Element.new({id: 'save_and_continue'}).is.displayed
  #
  def displayed
    paused?
    if self.switches[:not].value?
      expect(self.is.displayed?).to.be.equal.to('false')
    else
      expect(self.is.displayed?).to.be.equal.to('true')
    end
    return self.reset_switches
  end

  # @raise When a statement is false, it will raise an exception, halting test execution.
  # @example
  #  Element.new({css: 'select.title option[value="Mrs"]'}).is.selected
  #  Element.new({css: 'input[value="2017"]'}).is.selected
  #
  def selected
    paused?
    if self.switches[:option].value?
      if self.switches[:not].value?
        expect(self.option.selected?).to.be.equal.to(self.switches[:option])
      else
        expect(self.option.selected?).to.not.be.equal.to(self.switches[:option])
      end

    else
      if self.switches[:not].value?
        expect(self.is.selected?).to.be.equal.to('false')
      else
        expect(self.is.selected?).to.be.equal.to('true')
      end
    end
    return self.reset_switches
  end
end
