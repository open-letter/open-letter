require 'csv'

namespace :ol do

    desc "Import boundaries and postcodes"
    task import_boundaries: :environment do
        CSV.foreach('tmp/Postcodes2009Boundaries_2.csv', :headers => true) do |row|
            row.each {|key, value| row[key] = value.strip}
            boundary = nil
            begin
                if row['Electoral division'] != '#N/A'
                    boundary = Boundary.create!(name: row['Electoral division'])
                    puts "Boundary: #{boundary.name}"
                end
            rescue ActiveRecord::RecordNotUnique
                boundary = Boundary.find_by(name: row['Electoral division'])
            end
            if !boundary
                raise "Boundary unknown: #{row['Electoral division']}"
            end
            postcode = BoundaryPostcode.create(
                postcode: row['Postcode'],
                percentage: row['Per cent'],
                boundary: boundary)
            puts "  #{postcode.postcode} #{postcode.percentage}"
        end
    end

    desc "Import suburbs"
    task import_suburbs: :environment do
        CSV.foreach('tmp/Australian_Post_Codes_Lat_Lon.csv', :headers => true) do |row|
            row.each {|key, value| row[key] = value.strip}
            postcode = BoundaryPostcode.find_by(postcode: row['postcode'])
            if postcode
                postcode.suburb = row['suburb']
                postcode.state = row['state']
                postcode.save
            else
                puts "No boundary, skipped postcode: #{row['postcode']}"
            end
        end
    end

end
