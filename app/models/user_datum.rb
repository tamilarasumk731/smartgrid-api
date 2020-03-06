class UserDatum < ApplicationRecord
	belongs_to :user_link

	def trigger_mail
		# binding.pry
		puts "dsds"
	end
end
