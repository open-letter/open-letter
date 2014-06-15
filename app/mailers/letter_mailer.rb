class LetterMailer < ActionMailer::Base
    default from: "robot@openletter.cfapps.io"

    # Subject can be set in your I18n file at config/locales/en.yml
    # with the following lookup:
    #
    #   en.letter_mailer.confirmation_email.subject
    #
    def confirmation_email
        @greeting = "Hi"
        attachments['data.csv'] = File.read('db/data/StateRepsCSV.csv')
        mail to: "anton.beloglazov@gmail.com"
    end
end
