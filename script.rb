#! /usr/bin/ruby

file = File.open('../data-fulton-bag/ms004/ms004-001.xml')
eadds = Datastreams::EadMetadata.from_xml(file)
file.close

binding.pry

ead = Ead.create(archdesc: "foo")
ead.eadMetadata.content = eadds
ead.save
