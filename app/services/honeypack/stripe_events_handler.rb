module Honeypack
  class StripeEventsHandler

    def initialize(events)
      handle_events = [
        'charge.failed',
        'invoice.payment_succeeded',
        'customer.subscription.deleted',
        'plan.deleted'
      ]

      handle_events.each do |handle_event|
        events.subscribe handle_event do |event|
          self.send handle_event.gsub('.', '_').to_sym, event
        end
      end
    end

    private

    def charge_failed(event)

    end

    def invoice_payment_succeeded(event)

    end

    def customer_subscription_deleted(event)
      subscription = find_subscription_from_event(event)
      subscription.user.try(:cancel)
    end

    def plan_deleted(event)
      plan = Plan.find_by_stripe_plan_id(event.data.object['id'])
      plan.destroy
    end

    def find_subscription_from_event(event)
      Subscription.find_by_stripe_customer_id(event.data.object['customer'])
    end
  end
end
