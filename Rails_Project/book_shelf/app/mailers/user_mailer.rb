class UserMailer < ApplicationMailer
	def wellcome_email(user)
		@user = user
		# @url = 
		mail(to: user.email, subject: 'login success!')
		binding.pry
	end


end