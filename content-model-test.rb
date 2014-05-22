#! /usr/bin/ruby

# Setup new EadMetadata datastream
file = File.open('ms004-ead.xml')
eadds = EadMetadata.from_xml(file)
file.close

# Setup new Ead object
e = Ead.create()
e.title = "Dune"
e.author = "Herbert, Frank"
e.save

# Setup new MetsMetadata datastream
itemds = Datastreams::MetsMetadata.new
itemds.title = "The Great Hunt"
itemds.author = "Jordan, Robert"

# Setup new Item object
i = Item.create()
i.itemMetadata.title = "The Great Hunt"
i.itemMetadata.author = "Jordan, Robert"

# Associate Item with previous Ead and save
i.ead = e
i.save
e.reload

# Commence logging
puts "\n ----- LOGGING -----\n\n"

# Log EadMetadata object to console
puts " ----- Log EadMetadata object to console -----\n"
puts eadds
puts eadds.to_solr
puts eadds.to_xml
puts "\n\n"

# Log Ead object to console
puts " ----- Log Ead object to console -----\n"
puts e
puts e.title
puts e.author
puts e.eadMetadata.content
puts e.to_solr
puts "\n\n"

# Log ItemMetadata object to console
puts " ----- Log MetsdcMetadata object to console -----\n"
puts itemds
puts itemds.title
puts itemds.author
puts itemds.to_solr
puts itemds.to_xml
puts "\n\n"

# Log Item object to console
puts " ----- Log Item object to console -----\n"
puts i
puts i.title
puts i.author
puts i.itemMetadata.title
puts i.itemMetadata.author
puts i.to_solr
puts "\n\n"

# binding.pry
