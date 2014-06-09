#! /usr/bin/ruby
require 'rubygems'
require 'zip'
require 'nokogiri'


# Define Importer Class
class Importer

  def initialize(origin, destination = ".tmp")
    @origin = nil
    @root_archive = nil
    @destination = nil
    @archives = []

    calculate_origin(origin)
    calculate_archive_index(origin)
    calculate_destination(destination)
    build_archives
  end

  def calculate_origin(origin)
    # This refers to the base directory of the aip export. It is calculated by
    # capturing the path location left of the last file separator.
    @origin = origin.slice(0, origin.rindex('/'))
  end

  def calculate_archive_index(origin)
    # This refers to the path of the archive's index package. This package is named
    # by the user at the time of AIP package creation. It is calculated by capturing
    # the path location right of the last file separator.
    @root_archive = origin.slice((origin.rindex('/') + 1), origin.length)
  end

  def calculate_destination(destination)
    # This refers to the temp directory where the archive packages will be unzipped
    # and later read in. It is an optional parameter when lauching the batch import
    # tool. If absent, will default to ".tmp" of the origin directory.
    if destination == ".tmp"
      @destination = "#{@origin}/#{destination}"
    else
      @destination = destination
    end
  end

  def build_archives
    # This creates an array of Archive objects built from references to the archival
    # packages found within the specified filesystem location.
    archive_files = Dir.enteries(@origin).delete(".").delete("..").delete(@destination)
    archive_files.each do |arc|
      origin = "#{@origin}/#{arc}"
      folder = arc.gsub('.zip','')
      destination = "#{@destination}/#{folder}"
      @archives << Archive.new(origin, destination)
    end
  end

end


# Define Archive Class
class Archive

  def initialize(origin, destination)
    @origin_path = origin
    @origin_file = nil
    @destination_path = destination
    @destination_file = nil
    @metadata_file = nil
    @contents_files = nil

    # process
  end

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
class ImportIndex

  def initialize(dir, name, file)
    f = File.open("#{dir}/#{UNZIP_DIR}/#{name}/mets.xml")
    @doc = Nokogiri::XML(f)
    @doc.remove_namespaces!
    f.close
    @xpath = "/mets/structMap[@LABEL='DSpace Object']/div[@TYPE='DSpace Object Contents']/div[@TYPE='DSpace ITEM']/mptr[@LOCTYPE='URL']"
    @items = []

    @doc.xpath(@xpath).each do |r|
      puts r.xpath('@href')
      file = File.open(
      @items << ItemRecord.new
    end
  end

end


# Define Community Class
class Community
end


# Define Collection Class
class Collection
end


# Define Item Class
class Item
end


Importer.new("import/ROOT@1853.zip")
