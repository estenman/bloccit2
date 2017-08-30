class User < ActiveRecord::Base
  before_save { self.email = email.downcase if email.present? }
  before_save { self.name = user_name(self.name.to_s)}

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true
  validates :email,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 254 }

  has_secure_password

  def user_name (name)
    new_name = []
    name.split(' ').map do |word|
      new_name.push(word.capitalize)
    end
    new_name.join(' ')
  end

end
