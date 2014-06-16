require 'csv'

namespace :ol do

    desc "Import electorates and postcodes"
    task import_electorates_postcodes: :environment do
        path = 'db/data/Postcodes2009Boundaries_2.csv'
        CSV.foreach(path, :headers => true) do |row|
            row.each {|key, value| row[key] = value.strip}
            electorate = Electorate.find_or_create_by(name: row['Electoral division'])
            postcode = Postcode.find_or_create_by(postcode: row['Postcode'])
            electorate.postcodes << postcode
            join = electorate.electorates_postcodes.find_by(postcode: postcode)
            join.electorate_percent = row['Per cent']
            join.save
        end
    end

    desc "Import suburbs"
    task import_suburbs: :environment do
        path = 'db/data/Australian_Post_Codes_Lat_Lon.csv'
        CSV.foreach(path, :headers => true) do |row|
            row.each {|key, value| row[key] = value.strip}
            postcode = Postcode.find_by(postcode: row['postcode'])
            if postcode
                postcode.suburbs << Suburb.find_or_create_by(
                    name: row['suburb'],
                    state: row['state'])
            else
                puts "No postcode, skipped: #{row}"
            end
        end
    end

    desc "Import representatives"
    task import_representatives: :environment do
        path = 'db/data/StateRepsCSV.csv'
        CSV.foreach(path, :headers => true) do |row|
            row.each {|key, value| row[key] = value.strip}
            electorate = Electorate.find_by(name: row['"Electorate"'])
            if !electorate
                raise "Electorate #{row['"Electorate"']} not found"
            end
            gender = 'NA'
            if row['"Gender"'] == 'FEMALE'
                gender = 'F'
            elsif row['"Gender"'] == 'MALE'
                gender = 'M'
            end
            profile = Profile.create(
                preferred_name: row['"Preferred Name"'],
                first_name: row['"First Name"'],
                last_name: row['"Surname"'],
                other_names: row['"Other Names"'],
                initials: row['"Initials"'],
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
                electorate: electorate,
                profile: profile,
                address: address,
                courtesy_title: row['"Courtesy Title"'],
                honorific: row['"Honorific"'],
                parlamentary_titles: row['"Parliamentary Titles"'],
                parlamentary_titles_short: row['""'],
                party: row['"Political Party"'])
            puts "#{profile.first_name} #{profile.last_name}"
        end
    end

end
