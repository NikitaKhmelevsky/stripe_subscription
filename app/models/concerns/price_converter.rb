module PriceConverter
  module ClassMethods
    def get_real_price
      self.amount.to_f / 100.0
    end
  end
end
