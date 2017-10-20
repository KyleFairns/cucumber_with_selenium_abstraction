Expect.class_eval do

  # @param text
  # @raise When a statement is false, it will raise an exception, halting test execution.
  # @example
  #  expect(google.search.text).to.be.equal.to('Hello, World!')
  #  expect(google.search.text.length).to.be.greater.than.or.equal.to(5)
  #
  def to(*text)
    text=text.join('')
    if text.to_s === ''
      return self
    end

    # Greater than
    if self.switches[:greater].value? === true or self.switches[:more].value? === true
      if self.switches[:equal].value? === true
        print greater_than(self.name.to_i, text.to_i, true)
        # text greater than OR equal to the value given? return self so chaining can happen, else raise an error
        return greater_than(self.name.to_i, text.to_i, true) ? self.reset_switches : raise("#{text.to_s} is not more than or equal to #{self.name.to_s}")
      else
        # text greater than the value given? return self so chaining can happen, else raise an error
        return greater_than(self.name.to_i, text.to_i) ? self.reset_switches : raise("#{text.to_s} is not more than #{self.name.to_s}")

      end
    else

      # Less than
      if self.switches[:less].value? === true
        if self.switches[:equal].value?
          # text less than OR equal to the value given? return self so chaining can happen, else raise an error
          return less_than(self.name.to_i, text.to_i, true) ? self.reset_switches : raise("#{text.to_s} is not less than or equal to #{self.name.to_s}")
        else
          # text less than the value given? return self so chaining can happen, else raise an error
          return greater_than(self.name.to_i, text.to_i) ? self.reset_switches : raise("#{text.to_s} is not less than #{self.name.to_s}")
        end
      else
        # Equal to
        if self.switches[:equal].value?
          # text equal to the value given? return self so chaining can happen, else raise an error
          return equal_to(text.to_s, self.name.to_s) ? self.reset_switches : raise("#{text.to_s} does not equal #{self.name.to_s}")
        end
      end
    end
  end

  # @param text
  # @raise When a statement is false, it will raise an exception, halting test execution.
  # @example
  #  expect(calculation_result).to.be.greater.than(4)
  #
  def than(*text)
    to(text)
  end

  # @param text
  # @raise When a statement is false, it will raise an exception, halting test execution.
  # @example
  #  expect(welcome.text).to.be("Welcome back, #{user.full_name}!")
  #
  def be(*text)
    to(text)
  end

end
