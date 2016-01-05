StripeEvent.configure do |events|
  Honeypack::StripeEventsHandler.new(events)
end
