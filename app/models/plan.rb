class Plan < ActiveRecord::Base
  include PriceConverter

  before_create :create_stripe_plan

  has_many :subscriptions

  validates_presence_of :amount
  validates_presence_of :interval
  validates_presence_of :stripe_plan_id
  validates_presence_of :name

  validates_uniqueness_of :stripe_plan_id

  scope :by_price, -> { order(amount: :desc)}

  def create_stripe_plan
    Honeypack::PlanService.create_stripe_plan(self)
  end

end
