class PlanterPolicy
  attr_reader :user, :planter


  def initialize(user,planter)
    # raise Pundit::NotAuthorizedError, "شما باید ابتدا عضوی از گیاهداران باشید" unless user
    @user = user
    @planter = planter
  end


  def new?
    user.admin?
  end

  def edit?
    user.admin?
  end

  def create?

    user.admin?
  end

  def destroy?

    user.admin?
  end

  def update?

    user.admin?
  end


end