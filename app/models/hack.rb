class Hack < ActiveRecord::Base
	mount_uploader :photo, AvatarUploader
end
