module SessionsHelper

  def sign_in(user)
    remember_token = User.new_token
    session[:user_id] = user.unity_id
    cookies.permanent[:session_token] = remember_token
    user.update_attribute(:session_token, remember_token)
    self.current_user = user
  end


  def current_user=(user)
    @current_user = user
  end

  def signed_in?()
    !current_user.nil?
  end
  def current_user
    session_token = cookies[:session_token]
    @current_user ||= User.find_by_session_token(session_token)
  end

  def sign_out
    reset_session
    puts session.nil?
    cookies.permanent[:session_token] = nil
  end

  def boostPostWeight(post,amount)
    new_weight = post.weight + amount
    post.update_attribute(:weight,new_weight)
  end

  def decayWeight(post,amount)
    Post.all.each do |p|
      if(p.id != post.id)
        new_weight = p.weight - amount
        p.update_attribute(:weight,new_weight)
      end
    end
  end

  def getMaxWeight(weight)
    max_weight = weight
    Post.all.each do |post|
      if post.weight > max_weight
        max_weight =  post.weight
      end
    end
    return max_weight
  end

end