# Preview all emails at http://localhost:3000/rails/mailers/letter_mailer
class LetterMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/letter_mailer/confirmation_email
  def confirmation_email
    LetterMailer.confirmation_email
  end

end
