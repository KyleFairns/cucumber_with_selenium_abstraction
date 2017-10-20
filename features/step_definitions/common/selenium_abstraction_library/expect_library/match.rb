Expect.class_eval do

  # @param regex
  # @raise When a statement is false, it will raise an exception, halting test execution.
  # @example
  #  expect(calculation_result).to.match(/^\d+$/)
  #
  def match(regex)
    if self.switches[:not].value?
      # expected value does not match the regex given? return self so chaining can happen, else raise an error
      return regex !~ self.name ? self.reset_switches : raise("#{self.name.to_s} matches the regex #{regex.to_s}")
    else
      # expected value matches the text given? return self so chaining can happen, else raise an error
      return regex =~ self.name ? self.reset_switches : raise("#{self.name.to_s} does not match the regex #{regex.to_s}")
    end
  end

  # @param regex
  # @raise When a statement is false, it will raise an exception, halting test execution.
  # @example
  #  expect(a_calculation_result).that.matches(/^\d+$/)
  def matches(regex)
    match(regex)
  end

  # @param regex
  # @raise When a statement is false, it will raise an exception, halting test execution.
  # @example
  #  expect(calculation_result).to.be.matching(/^\d+$/)
  #
  def matching(regex)
    match(regex)
  end
end
