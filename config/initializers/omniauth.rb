Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, Conf.facebook.id, Conf.facebook.key
  provider :vkontakte, Conf.vkontakte.id, Conf.vkontakte.key
  # provider :identity, fields: [:name, :email], model: User, on_failed_registration: lambda { |env|
    # UsersController.action(:new).call(env)
  # }
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}
