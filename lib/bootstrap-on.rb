begin
  require 'padrino-gen'
  Padrino::Generators.load_paths << Dir[File.dirname(__FILE__) + '/bootstrap-on/{bs_admin,bs_admin_page}.rb']
rescue LoadError
  # Fail silently
end