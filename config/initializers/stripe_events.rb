StripeEvent.configure do |events|
  events.subscribe 'charge.failed' do |event|
    Honeypack::SubscriptionService.charge_failed(event)
  end

  events.subscribe 'invoice.payment_succeeded' do |event|
    Honeypack::SubscriptionService.payment_succeeded(event)
  end

  events.subscribe 'customer.subscription.deleted' do |event|
    Honeypack::SubscriptionService.payment_deleted(event)
  end
end
