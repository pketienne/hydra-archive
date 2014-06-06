#! /usr/bin/ruby

book = Book.new
book.bookContent.content = File.open('../../data-fulton-bag/ms004/ms004-001.pdf')
ds = book.create_datastream(ActiveFedora::Datastream, "bookContent01")
book.add_datastream(ds)
book.datastreams['bookContent01'].content = File.open('../../data-fulton-bag/ms004/ms004-002.pdf')
book.save
