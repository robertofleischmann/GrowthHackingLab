class Hack < ActiveRecord::Base
	belongs_to :user
	mount_uploader :photo, AvatarUploader
	after_create :update_upload

	def update_upload
		current_user = self.user
		n_ups = current_user.hacks.count

		if current_user.upload.nil? 
			Upload.create(:user_id => current_user.id, :n => n_ups)
		else
			current_up = current_user.upload
			current_up.n = n_ups
			current_up.save
		end

		# :update_user_type
		current_user = self.user
		current_user_type = UserType.where(:id => current_user.user_type_id).last

		UserType.all.each do |type|
			if type.uploads_needed <= current_user.hacks.count
				if current_user_type.nil? or type.uploads_needed > current_user_type.uploads_needed
					current_user.user_type_id = type.id
					current_user_type = type
					current_user.save
				end
			end
		end
	end

	def update_user_type
		current_user = self.user
		current_user_type = UserType.where(:id => current_user.user_type_id).last

		UserType.all.each do |type|
			if type.uploads_needed <= current_user.hacks.count
				if current_user_type.nil? or type.uploads_needed > current_user_type.uploads_needed
					current_user.user_type_id = type.id
					current_user_type = type
					current_user.save
				end
			end
		end
	end

end
