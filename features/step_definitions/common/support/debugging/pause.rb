# Checks for a pause command in the command line
def paused?
  if get_profile['slow']
    if STDIN.ready?
      last_input = STDIN.gets
      while last_input == 'p'
        sleep 1
      end
    end
  end
end

# Pauses for debugging, will continue when enter is pressed
def pause
  print 'p'
  last_input = STDIN.gets
  while last_input == 'p'
    sleep 1
  end
end