#! /usr/bin/ruby

file = File.open('sample.xml')
d = BookMetadata.from_xml(file)
file.close
d.title= "ZOIA! Memoirs of Zoia Horn, Battler for the People's Right to Know."
d.author= "Horn, Zoia"

binding.pry

b = Book.new
b.descMetadata.content= d.content
b.save


