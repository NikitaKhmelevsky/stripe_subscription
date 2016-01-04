class Plan < ActiveRecord::Base

  before_create :create_stripe_plan

  has_many :subscriptions

  validates_presence_of :amount
  validates_presence_of :interval
  validates_presence_of :stripe_plan_id
  validates_presence_of :name

  validates_uniqueness_of :stripe_plan_id

  def create_stripe_plan
    Honeypack::PlanService.create_stripe_plan
  end

end
