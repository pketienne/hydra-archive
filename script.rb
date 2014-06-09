#! /usr/bin/ruby
require 'rubygems'
require 'zip'
require 'nokogiri'


# Define Importer Class
class Importer

  # Define constant for unzip location
  DESTINATION = ".tmp"

  # Define Instance Variables
  @base = nil
  @filename = nil
  @extension = nil
  @fs_filelist = []
  @md_filelist = []
  @index = nil
  
  # Initialize Class Instance
  def initialize(filepath)

    # Set @base to archive base directory
    @base = filepath.slice(0, filepath.rindex('/'))

    # Set @extension to archive file extension name
    @extension = filepath.slice((filepath.rindex('.') + 1), filepath.length)

    # Set @filename to archive file name, sans extension
    @filename = filepath.gsub("#{@base}/",'').gsub(".#{@extension}",'')

    # Make sure temp directory is fresh
    FileUtils.rm_rf("#{@base}/#{DESTINATION}")

    # Populate @fs_filelist with list of archives found on the filesystem
    @fs_filelist = Dir.entries(@base).reject { |e| e == "." || e == ".." }

    # Slice off @fs_filelist entries' file extensions
    @fs_filelist.map! { |f| f.gsub(".#{@extension}","") }

    # Create new Index object to parse metadata, compare to filesystem, and hold records
    @index = Index.new(@base, @filename, @extension, DESTINATION)

    # puts "Base = #{@base}\n\n"
    # puts "Filename = #{@filename}\n\n"
    # puts "Extension = #{@extension}\n\n"
    # puts "Filesystem File List =\n#{@fs_filelist}"
  end

end


# Define Archive Class
class Utility

  def unzip_file(file, destination)
    Zip::File.open(file) { |zip_file|
      zip_file.each { |f|
        f_path=File.join(destination, f.name)
        FileUtils.mkdir_p(File.dirname(f_path))
        zip_file.extract(f, f_path) unless File.exist?(f_path)
      }
    }
  end

end


# Define Index Class
class Index < Utility

  # Define Class Readers, Writers, & Accessors
  attr_reader :md_filelist

  # Define Class Constants
  XPATH = "/mets/structMap[@LABEL='DSpace Object']/div[@TYPE='DSpace Object Contents']/div[@TYPE='DSpace ITEM']/mptr[@LOCTYPE='URL']"

  # Define Instance Variables
  @doc = nil
  @md_filelist = []
  @communities = []
  @collections = []
  @items = []

  def initialize(base, filename, extension, destination)
    from_path = "#{base}/#{filename}.#{extension}"
    to_path = "#{base}/#{destination}/#{filename}"
    unzip_file(from_path, to_path)

    f = File.open("#{to_path}/mets.xml")
    @doc = Nokogiri::XML(f)
    f.close

    @doc.xpath(XPATH).each do |e|
      href = e.xpath("@href")
      href.slice!(href.rindex("."), href.length)
      puts href
      # md_filelist << e.xpath("@href")
    end
  end

end


# Define Community Class
class Community < Utility
end


# Define Collection Class
class Collection < Utility
end


# Define Item Class
class Item < Utility
end


Importer.new("import/ROOT@1853.zip")
