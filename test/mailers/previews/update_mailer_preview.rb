# Preview all emails at http://localhost:3000/rails/mailers/update_mailer
class UpdateMailerPreview < ActionMailer::Preview

  def create_welcome
    UpdateMailer.create_welcome(2);
  end

end
