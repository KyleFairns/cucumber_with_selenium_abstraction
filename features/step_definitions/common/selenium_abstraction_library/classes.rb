Dir['function_library/*.rb'].each {|file| require_relative file }

class Switch

  def initialize(value, number)
    @order = number
    @value = value
  end

  def order(order)
    self.set({order: order})
  end

  def order?
    @order
  end

  def value(value)
    self.set({value: value})
  end

  def value?
    @value
  end

  def set(map)
    if map[:value] != nil
      @value = map[:value]
    end
    if map[:order] != nil
      @order = map[:order]
    end
  end
end

class Chain
  def initialize(name)
    @name = name
    @switches = {
        on: 0,
        double: Switch.new(false, 0),
        fill: Switch.new(false, 0),
        not: Switch.new(false, 0),
        option: Switch.new(false, 0),
        type: Switch.new(false, 0),
        new: Switch.new(false, 0),
        close: Switch.new(false, 0),
        latest: Switch.new(false, 0),
        switch: Switch.new(false, 0)
    }
  end

  def name
    @name
  end

  def locator
    @name
  end

  def switches
    @switches
  end

  def a
    self
  end

  def an
    self
  end

  def and
    self
  end

  def at
    self
  end

  def be
    self
  end

  def been
    self
  end

  def but
    self
  end

  def can
    self
  end

  def get
    self
  end

  def got
    self
  end

  def has
    self
  end

  def have
    self
  end

  def in
    self
  end

  def is
    self
  end

  def of
    self
  end

  def or
    self
  end

  def send
    self
  end

  def switch
    self
  end

  def take
    self
  end

  def that
    self
  end

  def then
    self
  end

  def to
    self
  end

  def which
    self
  end

  def with
    self
  end

  def double
    @switches[:on] += 1
    @switches[:double].set({value: true, order: @switches[:on]})
    self
  end

  def fill
    @switches[:on] += 1
    @switches[:fill].set({value: true, order: @switches[:on]})
    self
  end

  def not
    @switches[:on] += 1
    @switches[:not].set({value: true, order: @switches[:on]})
    self
  end

  def option(*info)
    @switches[:on] += 1
    if info.to_s != ''
      @switches[:option].set({value: info, order: @switches[:on]})
    else
      @switches[:option].set({value: true, order: @switches[:on]})
      self
    end
  end

  def type
    @switches[:on] += 1
    @switches[:type].set({value: true, order: @switches[:on]})
    self
  end

  def reset_switches
    @switches[:on] = 0
    @switches.each_key do |switch|
      if switch != :on
        @switches[switch].set({value: false, order: @switches[:on]})
      end
    end
    self
  end
end


class Url < Chain
  def initialize(name)
    @name = name
    require 'yaml'
    setup = YAML.load_file('setup.yml')
    base_url = setup['profiles'][setup['profile']]['base_url']
    regex = /^(https?):\/\/([\w._-]+)\/?(.*)?$/
    @split_url = /^(https?)/.match(@name) ? regex.match(@name) : regex.match("#{base_url}#{@name}")

    @switches = {
        on: 0,
        double: Switch.new(false, 0),
        fill: Switch.new(false, 0),
        not: Switch.new(false, 0),
        option: Switch.new(false, 0),
        type: Switch.new(false, 0),
    }
  end

  def protocol
    @split_url[1]
  end

  def domain
    @split_url[2]
  end

  def resource
    @split_url[3] or ''
  end

  def base
    "#{protocol}://#{domain}"
  end

  def url
    "#{base}/#{resource}"
  end
end

class Element < Chain
  def initialize(locator)
    @name = locator
    @switches = {
        on: 0,
        double: Switch.new(false, 0),
        fill: Switch.new(false, 0),
        not: Switch.new(false, 0),
        option: Switch.new(false, 0),
        type: Switch.new(false, 0),
    }
  end
end

class Select < Element
  def initialize(locator)
    @name = locator
    @switches = {
        on: 0,
        double: Switch.new(false, 0),
        fill: Switch.new(false, 0),
        not: Switch.new(false, 0),
        option: Switch.new(false, 0),
        type: Switch.new(false, 0),
    }
  end
end

class Checkbox < Element
  def initialize(locator)
    @name = locator
    @switches = {
        on: 0,
        double: Switch.new(false, 0),
        fill: Switch.new(false, 0),
        not: Switch.new(false, 0),
        option: Switch.new(false, 0),
        type: Switch.new(false, 0),
    }
  end

  def label
    Element.new("#{self.locator} label")
  end
end

class Browser < Chain
  def initialize
    @switches = {
        on: 0,
        new: Switch.new(false, 0),
        close: Switch.new(false, 0),
        latest: Switch.new(false, 0),
        switch: Switch.new(false, 0)
    }
  end

  def new
    @switches[:on] += 1
    @switches[:new].set({value: true, order: @switches[:on]})
    self
  end

  def close
    @switches[:on] += 1
    @switches[:close].set({value: true, order: @switches[:on]})
    self
  end

  def latest
    @switches[:on] += 1
    @switches[:latest].set({value: true, order: @switches[:on]})
    self
  end

  def switch
    @switches[:on] += 1
    @switches[:switch].set({value: true, order: @switches[:on]})
    self
  end
end

class Expect < Chain
  def initialize(value)
    @name = value
    @switches = {
        on: 0,
        not: Switch.new(false, 0),
        less: Switch.new(false, 0),
        more: Switch.new(false, 0),
        greater: Switch.new(false, 0),
        equal: Switch.new(false, 0),
    }
  end

  def less
    @switches[:on] += 1
    @switches[:less].set({value: true, order: @switches[:on]})
    self
  end

  def more
    @switches[:on] += 1
    @switches[:more].set({value: true, order: @switches[:on]})
    self
  end

  def greater
    @switches[:on] += 1
    @switches[:greater].set({value: true, order: @switches[:on]})
    self
  end

  def equal
    @switches[:on] += 1
    @switches[:equal].set({value: true, order: @switches[:on]})
    self
  end

end
