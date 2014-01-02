class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :hacks
  has_one :upload
  has_one :user_type

  after_create :create_upload_and_type

  def create_upload_and_type
  	Upload.create(:user_id => self.id, :n => 0)
    
    this_user = self
    this_user.user_type_id = UserType.first.id
    this_user.save
  end

end
