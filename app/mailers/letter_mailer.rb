require 'date'
require_relative '../helpers/letter_pdf_gen'

class LetterMailer < ActionMailer::Base
    default from: "robot@openletter.cfapps.io"

    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.letter_mailer.confirmation_email.subject
    #
    def confirmation_email(email_to, to, from, content, footer, regarding)
        path = "tmp/letter-#{DateTime.now.strftime('%Y-%m-%d-%H-%M-%S')}.pdf"
        # generate_pdf("Mr. Kent Steer\n406B Altona Nort, 3011\nPhone: 0413627643\nEmail: kentsteer@gmail.com", "Mr. Kent Steer\n406B Altona Nort, 3011\nPhone: 0413627643\nEmail: kentsteer@gmail.com", "Dear Minister,\n\n" + ("The quick brown fox jumps over the lazy dog.  The quick brown fox jumps over the lazy dog." *15), "Sincerely Yours,\nErmyas Abebe", "RE: Pot holes in Altona North", path)
        generate_pdf(from, to, content, footer, regarding, path)
        @greeting = "Hi"
        attachments['letter.pdf'] = File.read(path)
        mail(to: email_to,
             subject: 'OpenLetter: your letter is ready to be dispatched!')
    end
end
