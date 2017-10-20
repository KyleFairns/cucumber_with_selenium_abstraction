Expect.class_eval do
  # @param text
  # @raise When a statement is false, it will raise an exception, halting test execution.
  # @example
  #  expect(welcome.text).to.contain('Welcome back')
  #
  def contain(text)
    if self.switches[:not].value?
      # expected value does not contain the text given? return self so chaining can happen, else raise an error
      return !self.name.to_s.include?(text) ? self.reset_switches : raise("#{self.name.to_s} contains #{text.to_s}")
    else
      # expected value contains the text given? return self so chaining can happen, else raise an error
      return self.name.to_s.include?(text) ? self.reset_switches : raise("#{self.name.to_s} does not contain #{text.to_s}")
    end
  end

# @param text
# @raise When a statement is false, it will raise an exception, halting test execution.
# @example
#  expect(filter.text).that.contains('Welcome back')
#
  def contains(text)
    contain(text)
  end

# @param text
# @raise When a statement is false, it will raise an exception, halting test execution.
# @example
#  expect(filter.text).containing('Welcome back')
#
 def containing(text)
    contain(text)
  end
end