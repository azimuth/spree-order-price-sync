require 'price_change_job'
require 'delayed_job'

class PriceObserver < ActiveRecord::Observer
  observe Product, Variant
  
  def after_save(record)
    Delayed::Job.enqueue PriceChangeJob.new(record)
  end
end