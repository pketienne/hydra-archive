#! /usr/bin/ruby

# Define Importer Class
class Importer

  def initialize(index_file_path)
    @import_file_path = index_file_path
    @import_dir_path = nil
    @unzip_dir_path = nil

    calculate_paths
  end

  def calculate_paths
    if @index_path.include?('/')
      @import_dir_path = @index_path.slice(0, @index_path.rindex('/'))
    else 
      @import_dir_path = ""
    end
  end

end

# Define Index Class
class ImportIndex
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
