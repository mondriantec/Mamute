require 'digest/sha1'

class Usuario < ActiveRecord::Base
  
  has_and_belongs_to_many :perfis
  belongs_to :entidade, :polymorphic => true  
  has_many :documentos
  belongs_to :cadastrado_por, :class_name => 'Usuario', :foreign_key => 'cadastrado_por_id'
  
  include Authentication
  include Authentication::ByPassword
  include Authentication::ByCookieToken

  #before_save :setar_login

  #validates_presence_of     :login
  #validates_length_of       :login,    :within => 3..40
  #validates_uniqueness_of   :login
  #validates_format_of       :login,    :with => Authentication.login_regex, :message => Authentication.bad_login_message

  #validates_format_of       :nome,     :with => Authentication.name_regex,  :message => Authentication.bad_name_message, :allow_nil => true
  #validates_length_of       :nome,     :maximum => 100

  #validates_presence_of     :email
  #validates_length_of       :email,    :within => 6..100 #r@a.wk
  #validates_uniqueness_of   :email
  #validates_format_of       :email,    :with => Authentication.email_regex, :message => Authentication.bad_email_message

  

  # HACK HACK HACK -- how to do attr_accessible from here?
  # prevents a user from submitting a crafted form that bypasses activation
  # anything else you want your user to change should be added here.
  attr_accessible :login, :email, :nome, :password, :password_confirmation

  def name
    self.nome
  end


  # Authenticates a user by their login  and unencrypted password.  Returns the user or nil.
  #
  # uff.  this is really an authorization, not authentication routine.  
  # We really need a Dispatch Chain here or something.
  # This will also let us return a human error message.
  #
  def self.authenticate(login, password)
    return nil if login.blank? || password.blank?
    u = find_by_login(login.downcase) # need to get the salt
    u && u.authenticated?(password) ? u : nil
  end

  def login=(value)
    write_attribute :login, (value ? value.downcase : nil)
  end

  def email=(value)
    write_attribute :email, (value ? value.downcase : nil)
  end

  private
  def setar_login
	self.login = self.cpf
  end
  
end
