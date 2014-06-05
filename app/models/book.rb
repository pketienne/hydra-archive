class Book < ActiveFedora::Base
  has_file_datastream 'bookContent'

end
