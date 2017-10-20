def greater_than(higher, lower, equal = false)
  equal ? higher >= lower : higher > lower
end

def less_than(lower, higher, equal = false)
  equal ? lower <= higher : lower < higher
end

def equal_to(first, second)
  first == second
end
