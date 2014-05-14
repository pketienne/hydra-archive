#! /usr/bin/ruby

# Setup new EadMetadata datastream
eadds = EadMetadata.new
eadds.eadheader = "empty"
eadds.eadid = "MS004"

# Setup new Ead object
ead = Ead.create(eadheader: 'empty', eadid: 'MS004')

# Test outputs from EadMetadata and Ead objects
puts ead.eadMetadata
puts ead.eadheader
puts ead.eadid
puts ead.eadMetadata.eadheader
puts ead.eadMetadata.eadid
puts ead.to_solr
puts ead.eadMetadata.to_solr

# Setup new MetsMetadata datastream
itemmetsds = MetsMetadata.new
itemmetsds.mets = "ms004-001"
itemmetsds.name = "Archives and Records Management"

item = Item.create()
# item = Item.create(mets: "ms004-001", name: "Archives and Records Management")

# Setup new ModsMetadata datastream
# itemmodsds = ModsMetadata.new
# itemmodsds.title = "Testimony of Minnie B. Ware"
# itemmodsds.genre = "Testimony"
# itemmodsds.identifier = "MS004"

# Setup new DcMetadata datastream
# itemdcds = DcMetadata.new
# itemdcds.title = "An Impression of the Pi Beta Phi Settlement School and its Vicinity"
# itemdcds.creator = "Moorehead, Rosemary"
# itemdcds.subject = "Student Life"

# Setup new Item object
# item = Item.create(mets: "ms004-001", name: "Archives and Records Management", title: "Testimony of Minnie B. Ware", genre: "Testimony", identifier: "MS004", creator: "Moorehead, Rosemary", subject: "Student Life")

# Test outputs from MetsMetadata
# puts item.metsMetadata
# puts item.metsMetadata.mets
# puts item.metsMetadata.name

# Test outputs from ModsMetadata
# puts item.modsMetadata
# puts item.modsMetadata.title
# puts item.modsMetadata.genre
# puts item.modsMetadata.identifier

# Test outputs from DcMetadata
# puts item.dcMetadata
# puts item.dcMetadata.title
# puts item.dcMetadata.creator
# puts item.dcMetadata.subject

