StripeEvent.configure do |events|
  Honeypack::StripeEventsHandler.new(events)
  # events.subscribe 'plan.deleted' do |event|
  #   byebug
  #   plan = Plan.find_by_stripe_plan_id(event.data.object['id'])
  # end
end
