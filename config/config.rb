config_path = File.expand_path('./config')
config_file = File.exists?(File.join(config_path, 'application.yml')) ? 'application.yml' : 'application.template.yml'

CONFIG = YAML.load(File.read(File.expand_path(File.join(config_path, config_file), __FILE__)))
CONFIG.merge! CONFIG.fetch(Rails.env, {})
CONFIG.symbolize_keys!