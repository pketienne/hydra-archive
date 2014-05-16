#! /usr/bin/ruby

# Setup new EadMetadata datastream
em = EadMetadata.new
em.title = "The Eye of the World"
em.author = "Jordan, Robert"

# Setup new Ead object
e = Ead.create(title: "The Eye of the World", author: "Jordan, Robert")

# Setup new PageMetadata datastream
pm = Datastreams::PageMetadata.new
pm.title = "The Great Hunt"
pm.author = "Jordan, Robert"

# Setup new WordMetadata datastream
wm = Datastreams::WordMetadata.new
wm.title = "The Dragon Reborn"
wm.author = "Jordan, Robert"

# Setup new LetterMetadata datastream
lm = Datastreams::LetterMetadata.new
lm.title = "The Fires of Heaven"
lm.author = "Jordan, Robert"

# Setup new Page object
p = Page.create()
p.pageMetadata.title = "The Great Hunt"
p.pageMetadata.author = "Jordan, Robert"
p.wordMetadata.title = "The Dragon Reborn"
p.wordMetadata.author = "Jordan, Robert"
p.letterMetadata.title = "The Fires of Heaven"
p.letterMetadata.author = "Jordan, Robert"

# Associate Page with previous Ead and save
p.ead = e

# Commence logging
puts "\n ----- LOGGING -----\n\n"

# Log EadMetadata object to console
puts " ----- Log EadMetadata object to console -----\n"
puts em
puts em.title
puts em.author
puts em.to_solr
puts em.to_xml
puts "\n\n"

# Log Ead object to console
puts " ----- Log Ead object to console -----\n"
puts e
puts e.title
puts e.author
puts e.eadMetadata.title
puts e.eadMetadata.author
puts e.to_solr
puts "\n\n"

# Log PageMetadata object to console
puts " ----- Log PageMetadata object to console -----\n"
puts pm
puts pm.title
puts pm.author
puts pm.to_solr
puts pm.to_xml
puts "\n\n"

# Log WordMetadata object to console
puts " ----- Log WordMetadata object to console -----\n"
puts wm
puts wm.title
puts wm.author
puts wm.to_solr
puts wm.to_xml
puts "\n\n"

# Log LetterMetadata object to console
puts " ----- Log LetterMetadata object to console -----\n"
puts lm
puts lm.title
puts lm.author
puts lm.to_solr
puts lm.to_xml
puts "\n\n"

# Log Page object to console
puts " ----- Log Page object to console -----\n"
puts p
puts p.title
puts p.author
puts p.pageMetadata.title
puts p.pageMetadata.author
puts p.wordMetadata.title
puts p.wordMetadata.author
puts p.letterMetadata.title
puts p.letterMetadata.author
puts p.to_solr
puts "\n\n"
