Rails.configuration.stripe = {
  :publishable_key => StripeData['publishable_key'],
  :secret_key      => StripeData['secret_key']
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]
