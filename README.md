# OpenLetter


## Data import

The data sets are included in `db/data`. To initialize the database, run:

```Bash
rake db:drop db:create db:migrate
rake ol:import_boundaries ol:import_suburbs ol:import_representatives
```


## Data sources

Electoral divisions by postcode:
http://www.aph.gov.au/~/media/05%20About%20Parliament/54%20Parliamentary%20Depts/544%20Parliamentary%20Library/BackgroundNotes/2010-11/Postcodes2009Boundaries_2.xlsx

 - Delete the first line
 - Remove spaces from the headers

Postcodes: http://www.corra.com.au/downloads/Australian_Post_Codes_Lat_Lon.zip

MPs and senators:
http://www.aph.gov.au/Senators_and_Members/Guidelines_for_Contacting_Senators_and_Members/Address_labels_and_CSV_files 

