class Mets < ActiveFedora::Base
  has_metadata 'descMetadata', type: MetsMetadata

  has_attributes :title, datastream: 'descMetadata', multiple: false
  has_attributes :author, datastream: 'descMetadata', multiple: false

end
