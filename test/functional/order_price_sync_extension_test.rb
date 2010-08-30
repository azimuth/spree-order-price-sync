require File.dirname(__FILE__) + '/../test_helper'

class OrderPriceSyncExtensionTest < Test::Unit::TestCase
  
  # Replace this with your real tests.
  def test_this_extension
    flunk
  end
  
  def test_initialization
    assert_equal File.join(File.expand_path(Rails.root), 'vendor', 'extensions', 'order_price_sync'), OrderPriceSyncExtension.root
    assert_equal 'Order Price Sync', OrderPriceSyncExtension.extension_name
  end
  
end
