class AdminApplicationController < ApplicationController
  layout 'admin'
  http_basic_authenticate_with name: Conf.admin.name, password: Conf.admin.password

  def dashboard

  end
end
