#! /usr/bin/ruby

binding.pry

book = Book.new
book.bookContent.content = File.open('/home/petienne3/Projects/data-fulton-bag/ms004/ms004-001.pdf')
book.save
