Order Price Sync - 0.11-stable
================

This extension adds an observer that watches product and variant records for price changes. 
When a price changes, all relevant line items in all active (unfinised) orders have their 
prices changed accordingly, are saved, and the order is retotaled and saved.

Configuration
-------------

In your site extension activate method:

    Spree::Config.set(:order_price_sync_inactive_states_list => ['shipped', 'paid', 'canceled', 'awaiting_return', 'credit_owed'])

If your site extension defines `:order_price_sync_inactive_states_list`, this extension will not overwrite it.

