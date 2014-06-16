class RepresentativesController < ApplicationController

    def postcode
        postcode = Postcode.find_by(postcode: params[:postcode])
        reprs = postcode.representatives
        reprs.each do |repr|
            p = repr.electorate.electorates_postcodes.find_by(postcode: postcode)
            repr.electorate_percent = p.electorate_percent
        end
        render json: reprs.sort_by(&:electorate_percent).reverse!.to_json(
            :include => [:electorate, :profile, :address],
            :methods => :electorate_percent)
    end

end
