class Item < ActiveFedora::Base
  has_metadata 'metsMetadata', type: Datastreams::MetsMetadata
  has_metadata 'modsMetadata', type: Datastreams::ModsMetadata
  has_metadata 'dcMetadata', type: Datastreams::DcMetadata

  belongs_to :ead, :property=> :is_part_of

  has_attributes :title, datastream: 'metsMetadata', multiple: false
  has_attributes :author, datastream: 'metsMetadata', multiple: false

  has_attributes :title, datastream: 'modsMetadata', multiple: false
  has_attributes :author, datastream: 'modsMetadata', multiple: false

  has_attributes :title, datastream: 'dcMetadata', multiple: false
  has_attributes :author, datastream: 'dcMetadata', multiple: false

end
