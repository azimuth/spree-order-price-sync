# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class OrderPriceSyncExtension < Spree::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/order_price_sync"

  # Please use order_price_sync/config/routes.rb instead for extension routes.

  # def self.require_gems(config)
  #   config.gem "gemname-goes-here", :version => '1.2.3'
  # end
  
  def activate
    @price_observer = PriceObserver.instance
    if not Spree::Config.get(:order_price_sync_inactive_states_list) 
      Spree::Config.set(:order_price_sync_inactive_states_list => ['shipped', 'paid', 'canceled', 'awaiting_return', 'credit_owed'])
    end
  end
end
