class SessionsController < ApplicationController

    def create
    binding.pry
    auth = request.env['omniauth.auth']
    # Find an authentication or create an authentication
    @authorization = Authorization.find_with_omniauth(auth)

    if @authorization.nil?
      # If no authentication was found, create a brand new one here
      @authorization = Authorization.create_with_omniauth(auth)
    end

    if signed_in?
      if @authorization.user == current_user
        # User is signed in so they are trying to link an authentication with their
        # account. But we found the authentication and the user associated with it
        # is the current user. So the authentication is already associated with
        # this user. So let's display an error message.
        redirect_to root_path, notice: "You have already linked this account"
      else
        # The authentication is not associated with the current_user so lets
        # associate the authentication
        @authorization.user = current_user
        @authorization.save
        redirect_to root_path, notice: "Account successfully authenticated"
      end
    else # no user is signed_in
      binding.pry
      if @authorization.user.present?
        # The authentication we found had a user associated with it so let's
        # just log them in here
        self.current_user = @authorization.user
        redirect_to root_path, notice: "Signed in!"
      else
        # The authentication has no user assigned and there is no user signed in
        # Our decision here is to create a new account for the user
        # But your app may do something different (eg. ask the user
        # if he already signed up with some other service)
        # if @authorization.provider == 'identity'
          # u = User.find(@authorization.uid)
          # If the provider is identity, then it means we already created a user
          # So we just load it up
        # else
          # otherwise we have to create a user with the auth hash
          u = User.create_with_omniauth(auth)
          binding.pry
          # NOTE: we will handle the different types of data we get back
          # from providers at the model level in create_with_omniauth
        # end
        # We can now link the authentication with the user and log him in
        u.authorizations << @authorization
        self.current_user = u
        binding.pry
        redirect_to root_path, notice: "Welcome to The app!"
      end
    end
  end

  def destroy
    self.current_user = nil
    redirect_to root_path, notice: "Signed out!"
  end

  def failure
    redirect_to root_path, alert: "Authentication failed, please try again."
  end


end
