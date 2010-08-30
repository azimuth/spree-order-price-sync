class PriceObserver < ActiveRecord::Observer
  observe Product, Variant
  
  def after_save(record)
    inactive_states = YAML.load Spree::Config.get(:order_price_sync_inactive_states_list)
    to_update = Order.find(:all).reject{|o| inactive_states.include? o.state }.collect {|o| o.line_items }.flatten.select{|i| i.variant_id == record.id }
    to_update.each do |l|
      if l.price != record.price
        l.price = record.price
        l.save
        l.order.update_totals
        l.order.save
      end
    end
  end
end
    