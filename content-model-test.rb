#! /usr/bin/ruby

# Setup new EadMetadata datastream
eadds = EadMetadata.new
# eadds.eadheader = "blah"

# Setup new Ead object
e = Ead.create()
# e.eadheader = "blah"
e.save

# Setup new MetsMetadata datastream
metsds = Datastreams::MetsMetadata.new
metsds.title = "The Great Hunt"
metsds.author = "Jordan, Robert"

# Setup new ModsMetadata datastream
modsds = Datastreams::ModsMetadata.new
modsds.title = "The Dragon Reborn"
modsds.author = "Jordan, Robert"

# Setup new DcMetadata datastream
dcds = Datastreams::DcMetadata.new
dcds.title = "The Fires of Heaven"
dcds.author = "Jordan, Robert"

# Setup new MetsmodsMetadata datastream
metsmodsds = Datastreams::MetsmodsMetadata.new
metsmodsds.title = "The Fires of Heaven"
metsmodsds.author = "Jordan, Robert"

# Setup new MetsdcMetadata datastream
metsdcds = Datastreams::MetsdcMetadata.new
metsdcds.title = "The Fires of Heaven"
metsdcds.author = "Jordan, Robert"

# Setup new Item object
i = Item.create()
i.metsMetadata.title = "The Great Hunt"
i.metsMetadata.author = "Jordan, Robert"
i.modsMetadata.title = "The Dragon Reborn"
i.modsMetadata.author = "Jordan, Robert"
i.dcMetadata.title = "The Shadow Rising"
i.dcMetadata.author = "Jordan, Robert"
i.metsmodsMetadata.title = "The Fires of Heaven"
i.metsmodsMetadata.author = "Jordan, Robert"
i.metsdcMetadata.title = "Lord of Chaos"
i.metsdcMetadata.author = "Jordan, Robert"

# Associate Item with previous Ead and save
i.ead = e
i.save
e.reload

# Commence logging
puts "\n ----- LOGGING -----\n\n"

# Log EadMetadata object to console
puts " ----- Log EadMetadata object to console -----\n"
puts eadds
puts eadds.eadheader
puts eadds.to_solr
puts eadds.to_xml
puts "\n\n"

# Log Ead object to console
puts " ----- Log Ead object to console -----\n"
puts e
puts e.eadheader
puts e.eadMetadata.eadheader
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

# Log DcMetadata object to console
puts " ----- Log DcMetadata object to console -----\n"
puts dcds
puts dcds.title
puts dcds.author
puts dcds.to_solr
puts dcds.to_xml
puts "\n\n"

# Log MetsmodsMetadata object to console
puts " ----- Log MetsmodsMetadata object to console -----\n"
puts metsmodsds
puts metsmodsds.title
puts metsmodsds.author
puts metsmodsds.to_solr
puts metsmodsds.to_xml
puts "\n\n"

# Log MetsdcMetadata object to console
puts " ----- Log MetsdcMetadata object to console -----\n"
puts metsdcds
puts metsdcds.title
puts metsdcds.author
puts metsdcds.to_solr
puts metsdcds.to_xml
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
puts i.metsmodsMetadata.title
puts i.metsmodsMetadata.author
puts i.metsdcMetadata.title
puts i.metsdcMetadata.author
puts i.to_solr
puts "\n\n"
