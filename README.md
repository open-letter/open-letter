[![Stories in Ready](https://badge.waffle.io/open-letter/open-letter.png?label=ready&title=Ready)](https://waffle.io/open-letter/open-letter)

# OpenLetter

*A platform for simple and transparent dialogue between people and their
government.*

It may surprise many people to learn that, despite the availability of electronic alternatives, the most effective way to share your
concerns and ideas with elected representatives is to send them physical mail.
But [it is
true](http://www.ted.com/talks/omar_ahmad_political_change_with_pen_and_paper).
Unfortunately, the effort involved in sending physical mail is a barrier for
most people. OpenLetter is a platform that provides a digital wrapper around the
physical postal service. Users share their thoughts, we take care of the rest.

We give users the opportunity to report back on their satisfaction with the
outcome of their letter. Did they get a response? Did their representative act?
By making this information public, and enhancing it with various levels of
analytics, we provide a clear picture of the performance of representatives,
which in turn can provide a factual basis for how people vote. These analytics
are also of value to representatives in their efforts to engage and represent
their electorates.

Over time, we will reach out to governments to promote the use of this platform
to reduce their mail management costs. Through a constituent validation service
we give electronic communications the same level of legitimacy that physical
mail currently carries. Thereby, OpenLetter will accelerate the transition to
valued and trusted electronic communication between governments and their
electorates.

Follows us: [@OpenLetterAU](http://twitter.com/OpenLetterAu)


## Data import

The data sets are included in `db/data`. To initialize the database, run:

```Bash
rake db:drop db:create db:migrate
rake ol:import_electorates_postcodes ol:import_suburbs ol:import_representatives
```


## Data sources

Electoral divisions by postcode:
http://www.aph.gov.au/~/media/05%20About%20Parliament/54%20Parliamentary%20Depts/544%20Parliamentary%20Library/BackgroundNotes/2010-11/Postcodes2009Boundaries_2.xlsx

 - Delete the first line
 - Remove spaces from the headers

Postcodes: http://www.corra.com.au/downloads/Australian_Post_Codes_Lat_Lon.zip

MPs and senators:
http://www.aph.gov.au/Senators_and_Members/Guidelines_for_Contacting_Senators_and_Members/Address_labels_and_CSV_files 

