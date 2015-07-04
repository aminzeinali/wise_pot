class ForgotPasswordMailer < ApplicationMailer
default from: "golite.tech.pot@gmail.com"
def forgot_mail_sender(email)
	@mis_user = User.find_by_email(email)
	o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
	@new_pass = (0...50).map { o[rand(o.length)] }.join
	@mis_user.password = @new_pass
	@mis_user.save
	mail(to: email, subject: 'تغیر رمز عبور')
end

end
