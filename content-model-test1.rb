#! /usr/bin/ruby

# Setup new EadMetadata datastream
eadds = EadMetadata.new
eadds.title = "The Eye of the World"
eadds.author = "Jordan, Robert"

# Setup new Ead object
ead = Ead.create(title: "The Eye of the World", author: "Jordan, Robert")

# Test outputs from EadMetadata
puts eadds.to_xml

# Test outputs from Ead
puts ead.eadMetadata
puts ead.title
puts ead.author
puts ead.eadMetadata.title
puts ead.eadMetadata.author
puts ead.to_solr
puts ead.eadMetadata.to_solr

# Setup new MetsMetadata datastream
metsds = Datastreams::MetsMetadata.new
metsds.title = "The Eye of the World"
metsds.author = "Jordan, Robert"

# Setup new ModsMetadata datastream
modsds = Datastreams::ModsMetadata.new
modsds.title = "The Eye of the World"
modsds.author = "Jordan, Robert"

# Setup new DcMetadata datastream
dcds = Datastreams::DcMetadata.new
dcds.title = "The Eye of the World"
dcds.author = "Jordan, Robert"

puts "test"

# Setup new Item object
item = Item.create(title: "The Eye of the World", author: "Jordan, Robet")

# Test outputs from MetsMetadata
puts metsds.to_xml

# Test outputs from ModsMetadata
puts modsds.to_xml

# Test outputs from DcMetadata
puts dcds.to_xml

# Test outputs from Item
puts item.metsMetadata
puts item.modsMetadata
puts item.dcMetadata
puts item.title
puts item.author
puts item.metsMetadata.title
puts item.modsMetadata.title
puts item.dcMetadata.title
puts item.metsMetadata.author
puts item.modsMetadata.author
puts item.dcMetadata.author
puts item.to_solr
puts item.metsMetadata.to_solr
puts item.modsMetadata.to_solr
puts item.dcMetadata.to_solr

