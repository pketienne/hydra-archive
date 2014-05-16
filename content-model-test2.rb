#! /usr/bin/ruby

# Setup new EadMetadata datastream
eadds = EadMetadata.new
eadds.title = "The Eye of the World"
eadds.author = "Jordan, Robert"

# Setup new Ead object
e = Ead.create(title: "The Eye of the World", author: "Jordan, Robert")

# Setup new PageMetadata datastream
metsds = Datastreams::MetsMetadata.new
metsds.title = "The Great Hunt"
metsds.author = "Jordan, Robert"

# Setup new WordMetadata datastream
modsds = Datastreams::ModsMetadata.new
modsds.title = "The Dragon Reborn"
modsds.author = "Jordan, Robert"

# Setup new LetterMetadata datastream
dcds = Datastreams::DcMetadata.new
dcds.title = "The Fires of Heaven"
dcds.author = "Jordan, Robert"

# Setup new Page object
i = Item.create()
i.metsMetadata.title = "The Great Hunt"
i.metsMetadata.author = "Jordan, Robert"
i.modsMetadata.title = "The Dragon Reborn"
i.modsMetadata.author = "Jordan, Robert"
i.dcMetadata.title = "The Fires of Heaven"
i.dcMetadata.author = "Jordan, Robert"

# Associate Page with previous Ead and save
i.ead = e
i.save
e.reload

# Commence logging
puts "\n ----- LOGGING -----\n\n"

# Log EadMetadata object to console
puts " ----- Log EadMetadata object to console -----\n"
puts eadds
puts eadds.title
puts eadds.author
puts eadds.to_solr
puts eadds.to_xml
puts "\n\n"

# Log Ead object to console
puts " ----- Log Ead object to console -----\n"
puts e
puts e.title
puts e.author
puts e.eadMetadata.title
puts e.eadMetadata.author
puts e.to_solr
puts "\n\n"

# Log MetsMetadata object to console
puts " ----- Log MetsMetadata object to console -----\n"
puts metsds
puts metsds.title
puts metsds.author
puts metsds.to_solr
puts metsds.to_xml
puts "\n\n"

# Log ModsMetadata object to console
puts " ----- Log ModsMetadata object to console -----\n"
puts modsds
puts modsds.title
puts modsds.author
puts modsds.to_solr
puts modsds.to_xml
puts "\n\n"

# Log LetterMetadata object to console
puts " ----- Log DcMetadata object to console -----\n"
puts dcds
puts dcds.title
puts dcds.author
puts dcds.to_solr
puts dcds.to_xml
puts "\n\n"

# Log Item object to console
puts " ----- Log Item object to console -----\n"
puts i
puts i.title
puts i.author
puts i.metsMetadata.title
puts i.metsMetadata.author
puts i.modsMetadata.title
puts i.modsMetadata.author
puts i.dcMetadata.title
puts i.dcMetadata.author
puts i.to_solr
puts "\n\n"
