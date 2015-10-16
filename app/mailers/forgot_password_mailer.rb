class ForgotPasswordMailer < ApplicationMailer

default from: "amvaleh@gmail.com"

	def forgot_mail_sender(email)
		@mis_user = User.find_by_email(email)
			o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
			@new_pass = (0...10).map { o[rand(o.length)] }.join
			@mis_user.password = @new_pass
			@mis_user.save
			puts email.to_s
			mail(to: email, subject: 'تغیر رمز عبور')
	end




	def order_confirmed_mail(email)

		puts email.to_s

		mail(to: email, subject: 'سفارش در گلوگرام')

	end


	def new_order_mail

		email = "amvaleh@gmail.com"
		mail(to: email, subject: "سفارش جدید")


	end






end
