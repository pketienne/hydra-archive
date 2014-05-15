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

# Setup new PageMetadata datastream
pm = Datastreams::PageMetadata.new
pm.title = "blatherskite"
pm.author = "Happy families are all alike; every unhappy family is unhappy in its own way."

# Setup new Page object
p = Page.create(title: "blatherskite", author: "Happy families are all alike; every unhappy family is unhappy in its own way.")

# Associate Page with previous Book and save
p.book = b
p.save
b.reload

# Display details about newly created datastream and object
puts pm.to_xml
puts p.descMetadata
puts p.title
puts p.author
puts p.descMetadata.title
puts p.descMetadata.author
puts p.to_solr
puts p.descMetadata.to_solr
