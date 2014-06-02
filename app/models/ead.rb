class Ead < ActiveFedora::Base
  has_metadata 'eadMetadata', type: Datastreams::EadMetadata

  has_attributes :title, datastream: 'eadMetadata', multiple: false
  has_attributes :author, datastream: 'eadMetadata', multiple: false

end
