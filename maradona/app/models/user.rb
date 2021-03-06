require 'digest'
class User < ActiveRecord::Base

# Need this to do mass-assignment
  attr_accessible :email, :password, :password_confirmation, :user_id
#  :prerequisite_attributes
  attr_accessor :password
  
  has_many :posts, dependent: :destroy
  
  validates :email, :uniqueness => true, 
                    :length => { :within => 5..50 }, 
                    :format => { :with => /^[^@][\w.-]+@[\w.-]+[.][a-z]{2,4}$/i },
                    :presence => true
                    
  validates :password, :confirmation => true,
                       :length => { :within => 4..20 },
                       :presence => true,
                       :if => :password_required?

  before_save :encrypt_new_password
  
  has_one :profile
  #These are requests made by user to other users 
  has_many :peer_requests
  has_many :subscriptions
  
  has_many :peerships
  has_many :peers, :through => :peerships
  has_many :items, :foreign_key => :owner_id

  has_and_belongs_to_many :groups

  
  def self.authenticate(email, password)
    user = find_by_email(email)
    return user if user && user.authenticated?(password)
  end

  def authenticated?(password)
    self.hashed_password == encrypt(password)
  end

  protected
    def encrypt_new_password
      return if password.blank?
      self.hashed_password = encrypt(password)
    end

    def password_required?
      hashed_password.blank? || password.present?
    end

    def encrypt(string)
      Digest::SHA1.hexdigest(string)
    end
  
end
