class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.crypto_provider = Authlogic::CryptoProviders::Sha512
    c.session_class = UserSession
    c.require_password_confirmation = false
    c.login_field = :email
  end
end
