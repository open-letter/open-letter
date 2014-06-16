class LettersController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        puts params
        repr = Representative.find_by(id: params['representative-id'])
        email_to = 'kent.steer@gmail.com'
        to = "#{repr.profile.title}. #{repr.profile.first_name} #{repr.profile.last_name}, #{repr.honorific}\n#{repr.address.street}\n#{repr.address.suburb}, #{repr.address.state.upcase} #{repr.address.postcode}\n#{repr.address.phone}"
        from = "Mr. #{params['user-name']}\n11/30 Oliver Ln\nMelbourne, VIC 3000\nkentsteer@gmail.com\nPhone: 0413627643"
        content = "Dear Sir,\n\n#{params['letter-intro']}\n\n#{params['letter-action']}"
        footer = "Sincerely yours,\n#{params['user-name']}"
        regarding = "RE: #{params['subject']}"

        LetterMailer.confirmation_email(
            email_to, to, from, content, footer, regarding).deliver

        redirect_to "/thanks.html"
    end

end
