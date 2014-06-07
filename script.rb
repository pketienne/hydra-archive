#! /usr/bin/ruby

# Setup a set of records to use as samples
record_set = [{:type => "ead",
                :metadata => "MS004-ead.xml"},
              {:type => "ead",
                :metadata => "VAM004-ead.xml"},
              {:type => "ms",
                :metadata => "001.xml",
                :contents => ["001.pdf", "b001.tif", "b001a.tif", "b001b.tif", "b001c.tif",
                              "b001d.tif", "b001_75.jpg", "b001_300.jpg", "b001_thumb.jpg"]},
              {:type => "ms",
                :metadata => "002.xml",
                :contents => ["002.pdf", "b002.tif", "b002a.tif", "b002b.tif", "b002c.tif",
                              "b002d.tif", "b002_75.jpg", "b002_300.jpg", "b002_thumb.jpg"]},
              {:type => "ms",
                :metadata => "003.xml",
                :contents => ["003.pdf", "b003.tif", "b003a.tif", "b003b.tif", "b003_75.jpg",
                              "b003_300.jpg", "b003_thumb.jpg"]},
              {:type => "ms",
                :metadata => "004.xml",
                :contents => ["004.pdf", "b004.tif", "b004a.tif", "b004b.tif", "b004_75.jpg",
                              "b004_300.jpg", "b003_thumb.jpg"]},
              {:type => "vam",
                :metadata => "002.xml",
                :contents => ["002_75.jpg", "002_300.jpg", "002_thumb.jpg"]},
              {:type => "vam",
                :metadata => "003.xml",
                :contents => ["003_75.jpg", "003_300.jpg", "003_thumb.jpg"]},
              {:type => "vam",
                :metadata => "004.xml",
                :contents => ["004_75.jpg", "004_300.jpg", "004_thumb.jpg"]},
              {:type => "vam",
                :metadata => "005.xml",
                :contents => ["005_75.jpg", "005_300.jpg", "005_thumb.jpg"]}
             ]


# Setup a better organized set of samples
record_set = [
              :root_path => "/home/petienne3/Projects",
              [
               :folder => "/data-fulton-bag",
               :files => ["MS004-ead.xml", "VAM004-ead.xml"]
              {
                
              }
             ]



# Define the RecordParser class
class RecordParser
 
  def initialize(record_set)
    @record_set = record_set
    self.parse
  end

  def parse
    @record_set.each do |i|
      if i[:contents]
        Record.new(i[:type], i[:metadata], i[:contents])
      else
        Record.new(i[:type], i[:metadata])
      end
    end
  end

end


# Define the Record class
class Record

  # Constants for file paths
  ROOT_PREFIX = '../data-fulton-bag'
  VAM_PREFIX = 'vam004/vam004'
  MS_PREFIX = 'ms004/ms004'

  def initialize(type, metadata, contents = nil)
    @type = type
    @metadata = metadata
    @contents = contents
    @item = nil
    @metadata_datastream
    
    # Working with paths here is a little sketchy, but only because I can't at this point
    # read info from the filesystem but instead have to use the above record_set. This will
    # become cleaner when I refactor the code toward the batch import tool goals.
    case type
    when "ms"
      metadata_path = "#{ROOT_PREFIX}/#{MS_PREFIX}-#{@metadata}"
      self.create_om_datastream(path, ItemMetadata)
      self.create_base(Item, "itemMetadata")
      self.populate_content_datastreams(path)
    when "vam"
      metadata_path = "#{ROOT_PREFIX}/#{VAM_PREFIX}-#{@metadata}"
      self.create_om_datastream(path, ItemMetadata)
      self.create_base(Item, "itemMetadata")
      self.populate_content_datastreams(path)
    when "ead"
      path = "#{ROOT_PREFIX}/#{@metadata}"
      self.create_om_datastream(path, EadMetadata)
      self.create_base(Ead, "eadMetadata")
    end

    @item.save
  end

  def create_om_datastream(path, metadata_klass)
    file = File.open(path)
    @metadata_datastream = metadata_klass.from_xml(file)
    file.close
  end

  def create_base(klass, stream_name)
    @item = klass.new
    @item.datastreams[stream_name].content = @metadata_datastream.content
  end

  def populate_content_datastreams(path)
    @contents.each do |i|
      path = "#{path}-#{i}"

=begin
book = Book.new
book.bookContent.content = File.open('../../data-fulton-bag/ms004/ms004-001.pdf')
ds = book.create_datastream(ActiveFedora::Datastream, "bookContent01")
book.add_datastream(ds)
book.datastreams['bookContent01'].content = File.open('../../data-fulton-bag/ms004/ms004-002.pdf')
book.save
=end

    end
  end

end

RecordParser.new(record_set)
