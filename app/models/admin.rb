class Admin < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable

  after_create :assign_default_role

  has_many :tasks
  has_many :supports

  validates :first_name, presence: true
  validates :last_name, presence: true

  def fullname
  	admin_full_name = first_name + " " + last_name
  	admin_full_name.titlecase
  end

  def admin_role
    admin_admin_role = roles.first.name
    admin_admin_role.titlecase
  end

  def assign_default_role
    add_role(:moderator) if self.roles.blank?
  end
end