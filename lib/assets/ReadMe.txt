For AM1300 
1) we only need to run the following at the first time only to create the Radio Station and get all the shows associate with it.

rake create_kazn_shows

Because the AM1300 is messy so we need to create the shows' audioposts one by one

2a) For Today Topic we will need to run the following code in the first time only.

rake create_kazn_TodayTopic_audioposts

2b) For updating the the Today Topic

rake kazn_TodayTopic_audioposts_update

3a) For DC Wire

rake kazn_DCWire_audioposts_create

3b) Update the DC Wire

rake kazn_DCWire_audioposts_update

For AM1430
1) To Create the Radio Station

rake create_kmrb_shows

2) To create all the shows

rake create_kmrb_audioposts 

3) To update 

rake update_kmrb_audioposts