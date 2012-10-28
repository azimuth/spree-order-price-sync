class PriceChangeJob < Struct.new(:record)
  def perform
    inactive_states = YAML.load Spree::Config.get(:order_price_sync_inactive_states_list)
    to_update = LineItem.joins(:order).where(:variant_id => record).where("orders.state not in (?)", inactive_states)
    to_update.each do |l|
      puts "Invoking with #{l.inspect}"
      if l.price != record.price
        puts "Price changed #{l.price}"
        item = LineItem.find(l.id)
        item.price = record.price
        puts item.save

        order = item.order
        order.update_totals
        order.save
      end
    end
  end
end