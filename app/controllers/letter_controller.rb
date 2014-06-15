class LetterController < ApplicationController

    def compose
        LetterMailer.confirmation_email().deliver
        render :text => "<h1>Hello!</h1> <p>In Alice we trust.</p>"
        # redirect_to root_url
    end

end
