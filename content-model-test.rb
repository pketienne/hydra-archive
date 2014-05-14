#! /usr/bin/ruby

eds = EadMetadata.new
eds.eadheader = "empty"
eds.eadid = "MS004"

e = Ead.create(eadheader: 'empty', eadid: 'MS004')

puts e.eadMetadata
puts e.eadheader
puts e.eadid
puts e.eadMetadata.eadheader
puts e.eadMetadata.eadid
puts e.to_solr
puts e.eadMetadata.to_solr
