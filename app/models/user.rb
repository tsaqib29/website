class User < ApplicationRecord
    
    validates :name, presence: true
    validates :phone, presence: true, uniqueness: true, numericality: true
    validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

    has_secure_password

    before_save { self.email = email.downcase }
    before_create :create_remember_token

    validates :name, presence: true, length: { maximum: 50 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, 
              format: { with: VALID_EMAIL_REGEX },
              uniqueness: { case_sensitive: false }
    has_secure_password
    validates :password, length: { minimum: 6 }, on: :create
    #ask at one point, wherther I can continue to validate password and password_confirmation, on update, but allow password_reset to work
    has_one :common_app, dependent: :destroy


    has_one :video, dependent: :destroy

    def User.new_remember_token
      SecureRandom.urlsafe_base64
    end

    def User.encrypt(token)
      Digest::SHA1.hexdigest(token.to_s)
    end

    def send_password_reset
      generate_token(:password_reset_token)
      self.password_reset_sent_at = Time.zone.now
      save!
      UserMailer.password_reset(self).deliver
      # This sends an e-mail with a link for the user to reset the password
    end
    # This generates a random password reset token for the user
    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end

    private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
