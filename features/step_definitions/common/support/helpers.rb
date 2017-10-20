require 'yaml'

def get_profile
  setup = YAML.load_file('setup.yml')

  setup['profiles'][setup['profile']]
end