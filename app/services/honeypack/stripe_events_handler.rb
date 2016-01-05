module Honeypack
  class StripeEventsHandler

    def initialize(events)
      events.subscribe 'charge.failed' do |event|
        charge_failed(event)
      end

      events.subscribe 'invoice.payment_succeeded' do |event|
        payment_succeeded(event)
      end

      events.subscribe 'customer.subscription.deleted' do |event|
        subscription_deleted(event)
      end
    end

    private

    def charge_failed(event)

    end

    def payment_succeeded(event)

    end

    def subscription_deleted(event)
      subscription = find_subscription_from_event(event)
      subscription.user.try(:cancel)
    end

    def find_subscription_from_event(event)
      Subscription.find_by_stripe_customer_id(event.data.object['customer'])
    end
  end
end
