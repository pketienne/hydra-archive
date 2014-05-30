#! /usr/bin/ruby

file = File.open('sample.xml')
d = BookMetadata.from_xml(file)
file.close

binding.pry

b = Book.create(title: "foo")
b.descMetadata.content = d
b.save
