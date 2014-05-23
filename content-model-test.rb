#! /usr/bin/ruby

# Open file
file = File.open('MS004-ead.xml')

# Setup new EadMetadata datastream
eadds = Datastreams::EadMetadata.from_xml(file)

# Close file
file.close

# Setup new Ead object
ead = Ead.new
ead.eadMetadata.content = eadds
ead.save

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
puts ead
puts ead.eadMetadata
puts ead.eadMetadata.content
puts ead.to_solr
puts "\n\n"

binding.pry
