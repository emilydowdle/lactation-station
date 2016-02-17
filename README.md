## Lactation Station

##### [Explore the site](https://lactationstation.herokuapp.com/)

#### The Problem

Breastfeeding moms can't take certain medications. But doctors don't always know which medications are safe. 

[LactMed](http://toxnet.nlm.nih.gov/newtoxnet/lactmed.htm) is a database by NIH and has great information on drugs and their observed effects on lactation and breastfed infants. 

I created an easy-to-use resource for moms to search medications and receive detailed information. 

#### Challenges

LactMed doesn't have an API. So, I worked with what I had, downloaded their data as a text file and used regex to transform it into a YAML file. Then, I used `rake` to import the data into my database -- all 1186 drugs. Finally, I created an API so I could use AJAX to call my database and make the site extra snappy. 

To make the information even better, I consumed the OpenFDA API so when a mom searches by a drug, she receives information regarding the medication's effect on lactation, but also information on the drug's usage. 

Which sparked another idea: What if a mom could search by an ailment, like migraines, to find out which medications her doctor might prescribe? 

Overall, Lactation Station uses 3 APIs: the API I built from LactMed's data, OpenFDA and Twitter. 

#### Features

**Search By Name:**
When a user searches for 'amoxicillin', an AJAX call is sent to my API to pull the following information: 
* Drug summary
* Drug levels in the mother and infant
* Effects in breastfed infants
* Effects on lactation and breastmilk
* Drug classes this medication belongs to

Then an AJAX call is sent to OpenFDA to respond with the following information: 
* Warnings for nursing mothers 
* Drug description 
* Usage information 
* Manufacturer

**Search By Usage:**
A user can search for an ailment, such as migraines, and receive information on 10 drugs typically prescribed for migraines.

**View All Medications:**
Paginated index of all the drugs in my database.

**Twitter Integration:**
Lactation Station uses the Twitter gem to provide the user the following features:
* OAuth Twitter signin 
* Twitter profile
    * Photo
    * Username
    * Most recent tweets with the keyword 'breastfeeding'
* The ability to send a tweet directly from Lactation Station

For more information about other projects, visit [EmilyDowdle.com](www.emilydowdle.com)

![Lactation Station Features In Action](http://g.recordit.co/4Z91XFlpDW.gif)
