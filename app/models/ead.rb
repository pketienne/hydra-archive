class Ead < ActiveFedora::Base
  has_metadata 'eadMetadata', type: Datastreams::EadMetadata

  has_attributes :eadheader, datastream: 'eadMetadata', multiple: false
  has_attributes :archdesc, datastream: 'eadMetadata', multiple: false

end
