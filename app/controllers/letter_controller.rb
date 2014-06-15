class LetterController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        @form = JSON.parse(request.body.read)
        repr = Representative.find_by(id: @form['representative-id'])
        email_to = "anton.beloglazov@gmail.com"
        to = "#{repr.profile.title}. #{repr.profile.first_name} #{repr.profile.last_name}, #{repr.honorific}\n#{repr.address.street}\n#{repr.address.suburb}, #{repr.address.state.upcase} #{repr.address.postcode}\n#{repr.address.phone}"
        from = "Mr. #{@form['user-name']}\n11/30 Oliver Ln\nMelbourne, VIC 3000\nkentsteer@gmail.com\nPhone: 0413627643"
        content = "Dear Sir,\n\n#{@form['letter-intro']}\n\n#{@form['letter-action']}"
        footer = "Sincerely yours,\n#{@form['user-name']}"
        regarding = "RE: #{@form['subject']}"

        LetterMailer.confirmation_email(
            email_to, to, from, content, footer, regarding).deliver

        redirect_to "/thanks.html"
    end

end
