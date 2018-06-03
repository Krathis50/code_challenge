class User < ApplicationRecord
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end
  # This portion of the script allows the coder to write
  #user.admin?
  #user.admin!
  #user.role
  #user.user?
  # roles are sorted by integers when assigning via console.
  # user.role = 1 is admin.
  # user.role = 0 is default user, which is assigned at creation.
  # for their booleans to check for admins or users.

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
