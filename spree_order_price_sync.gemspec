Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_order_price_sync'
  s.version     = '0.60.1'
  s.summary     = 'Updates existing line items in unfinished orders when product prices change.'
  s.description = ''
  s.author            = 'Christopher Maujean'
  s.email             = 'christopher@azimuthonline.com'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency('spree_core', '>= 0.60.1')
end
