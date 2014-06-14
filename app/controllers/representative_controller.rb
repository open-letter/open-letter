class RepresentativeController < ApplicationController

    def postcode
        boundary_postcode = BoundaryPostcode.find_by(postcode: params[:postcode])
        representative = Representative.find_by(boundary_postcode: boundary_postcode)
        render json: representative.to_json(
            :include => [:boundary, :boundary_postcode, :profile, :address])
    end

end
