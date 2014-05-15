#! /usr/bin/ruby

# Setup new BookMetadata datastream
bm = BookMetadata.new
bm.title = "The Eye of the World"
bm.author = "Jordan, Robert"

# Setup new Book object
b = Book.create(title: "The Eye of the World", author: "Jordan, Robert")

# Display details about newly created datastream and object
puts bm.to_xml
puts b.descMetadata
puts b.title
puts b.author
puts b.descMetadata.title
puts b.descMetadata.author
puts b.to_solr
puts b.descMetadata.to_solr

p = Page.new(number: 1, text: "Happy families are all alike; every unhappy family is unhappy in its own way.")
p.book = b
p.save
b.reload
puts b.pages
