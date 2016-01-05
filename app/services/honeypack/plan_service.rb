module Honeypack
  class PlanService
    def self.create_stripe_plan(plan)
      secret_key = Stripe.api_key

      begin
        return Stripe::Plan.retrieve(plan.stripe_plan_id, secret_key)
      rescue Stripe::InvalidRequestError
        # fall through
      end

      Stripe::Plan.create({
        id:                plan.stripe_plan_id,
        amount:            plan.amount,
        interval:          plan.interval,
        name:              plan.name,
        interval_count:    plan.respond_to?(:interval_count) ? plan.interval_count : nil,
        currency:          plan.respond_to?(:currency) ? plan.currency : 'usd',
        trial_period_days: plan.respond_to?(:trial_period_days) ? plan.trial_period_days : nil
      }, secret_key)
    end
  end
end
