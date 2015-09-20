class PostPolicy
  attr_reader :user, :post


  def initialize(user,post)
    # raise Pundit::NotAuthorizedError, "شما باید ابتدا عضوی از گیاهداران باشید" unless user
    @user = user
    @post = post
  end


  def show?
    return true
  end

  def new?
    # raise Pundit::NotAuthorizedError, "شما باید ابتدا عضوی از گیاهداران باشید" unless @user

  # user.admin?
  end

  def edit?
    user == post.user
  end

  def create?
    user.admin?
  end

  def destroy?
    user.present? and ( user.admin? or user == post.user )
  end

  def update?
    user.admin?
  end


end