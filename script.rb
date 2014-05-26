#! /usr/bin/ruby

# binding.pry

# Setup new EadMetadata datastream
file = File.open('../data-fulton-bag/ms004/ms004-001.xml')
eadds = Datastreams::EadMetadata.from_xml(file)
from_content = eadds.instance_variable_get(:@content)
eadds.instance_variable_set(:@datastream_content, from_content)
eadds.datastream_content = eadds.content
file.close
=begin
eadds = Datastreams::EadMetadata.new
eadds.eadheader = "blatherskite"
eadds.archdesc = "foo"
=end

# Setup new Ead object
ead = Ead.new
ead.eadheader = "blatherskite"
ead.archdesc = "foo"
ead.save

# Commence logging
puts "\n ----- LOGGING -----\n\n"

# Log EadMetadata object to console
puts " ----- Log EadMetadata object to console -----\n"
puts eadds
puts eadds.eadheader
puts eadds.archdesc
puts eadds.to_solr
puts eadds.to_xml
puts "\n\n"

# Log Ead object to console
puts " ----- Log Ead object to console -----\n"
puts ead
puts ead.eadheader
puts ead.archdesc
puts ead.eadMetadata
puts ead.eadMetadata.eadheader
puts ead.eadMetadata.archdesc
puts ead.to_solr
puts "\n\n"

# binding.pry
