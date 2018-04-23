# Policy for OperativePlan model
class OperativePlanPolicy < ControllerPolicy
  attr_reader :user, :objects

  def initialize(user, objects)
    @user = user
    @objects = objects
  end
end
