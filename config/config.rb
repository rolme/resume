# TODO METHODIZE THESE
config_path = File.expand_path('./config')
config_file = File.exists?(File.join(config_path, 'application.yml')) ? 'application.yml' : 'application.template.yml'
CONFIG = YAML.load(File.read(File.expand_path(File.join(config_path, config_file), __FILE__)))
CONFIG.merge! CONFIG.fetch(Rails.env, {})
CONFIG.symbolize_keys!

data_path = File.expand_path('./data')
data_file = File.exists?(File.join(data_path, 'cv.yml')) ? 'cv.yml' : 'cv.template.yml'
CV = YAML.load(File.read(File.expand_path(File.join(data_path, data_file), __FILE__)))
CV.symbolize_keys!
