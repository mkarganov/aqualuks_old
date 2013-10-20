class User < ActiveRecord::Base

  has_many :authorizations, dependent: :destroy

  def self.create_with_omniauth(auth)
    binding.pry
    create(name: auth['info']['name'], email: auth['info']['email'], password_digest: rand(10**36).to_s(36))
  end

  # def send_password_reset
  #   generate_token(:password_reset_token)
  #   self.password_reset_sent_at = Time.zone.now
  #   save!
  #   UserMailer.password_reset(self).deliver
  # end

  private

  def generate_token(column)
    self[column] = SecureRandom.urlsafe_base64
  end

end
