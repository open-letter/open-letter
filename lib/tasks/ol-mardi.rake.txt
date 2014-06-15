require 'csv'

namespace :ol do

    desc "Import boundaries and postcodes"
    task import_boundaries: :environment do
    
        
        
        CSV.foreach('db/data/Postcodes2009Boundaries_2.csv', :headers => true) do |row| 
            
            // get row data
        
            // import electorates (aka boundaries). just electorate-names only
            if row.electorateDivision !exist in boundaries
            
               // electorate does not exist, so create it
               boundaries.id = (give some id)
               boundaries.name = row.electoralDivision
            
            else
               // electorate already exists, so skip.
               skip
            
        
            hash = doHash(row.postcode + row.electoralDivision)
            
            if hash !exist in boundary_postcodes
               boundary_postcodes.id = hash
               boundary_postcodes.postcode = row.postcode
               boundary_postcodes.suburb = ?? // import later.
               boundary_postcodes.state = ?? // import later.
               boundary_postcodes.electorate_id = electorate.id
               boundary_postcodes.percentage = row.perCent
        
            else
               // error... should not happen (electorate + postcode) should be unique
            
            
            
            
        CSV.foreach('db/data/Postcodes2009Boundaries_2.csv', :headers => true) do |row|
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
        CSV.foreach('db/data/Australian_Post_Codes_Lat_Lon.csv', :headers => true) do |row|
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

    desc "Import representatives"
    task import_representatives: :environment do
        CSV.foreach('db/data/StateRepsCSV.csv', :headers => true) do |row|
            row.each {|key, value| row[key] = value.strip}
            boundary = Boundary.find_by(name: row['"Electorate"'])
            if !boundary
                raise "Boundary #{boundary.naem} not found"
            end
            postcode = BoundaryPostcode.find_by(
                boundary: boundary,
                postcode: row['"Electorate Office Postal PostCode"'])
            gender = 'NA'
            if row['"Gender"'] == 'FEMALE'
                gender = 'f'
            elsif row['"Gender"'] == 'MALE'
                gender = 'm'
            end
            profile = Profile.create(
                preferred_name: row['"Preferred Name"'],
                first_name: row['"First Name"'],
                last_name: row['"Surname"'],
                screen_name: row['"First Name"'],
                title: row['"Salutation"'],
                gender: gender)
            address = Address.create(
                profile: profile,
                street: row['"Electorate Office Postal Address"'],
                state: row['"Electorate Office Postal State"'],
                postcode: row['"Electorate Office Postal PostCode"'],
                suburb: row['"Electorate Office Postal Suburb"'],
                country: 'Australia',
                phone: row['"Electorate Office Phone"'])
            representative = Representative.create(
                boundary: boundary,
                boundary_postcode: postcode,
                profile: profile,
                address: address,
                honorific: row['"Honorific"'],
                parlamentary_title: row['"Parliamentary Titles"'],
                parlamentary_title_short: row['""'],
                party: row['"Political Party"'])
            puts "#{profile.first_name} #{profile.last_name}"
        end
    end

end
