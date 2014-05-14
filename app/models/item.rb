 class Item < ActiveFedora::Base
  has_metadata 'metsMetadata', type: Datastreams::MetsMetadata
  has_metadata 'modsMetadata', type: Datastreams::ModsMetadata
  has_metadata 'dcMetadata', type: Datastreams::DcMetadata

  belongs_to :ead, :property=> :is_part_of

  has_attributes :mets, datastream: 'metsMetadata', multiple: false
  has_attributes :name, datastream: 'metsMetadata', multiple: false

  has_attributes :title, datastream: 'modsMetadata', multiple: false
  has_attributes :genre, datastream: 'modsMetadata', multiple: false
  has_attributes :identifier, datastream: 'modsMetadata', multiple: false

  has_attributes :title, datastream: 'dcMetadata', multiple: false
  has_attributes :creator, datastream: 'dcMetadata', multiple: false
  has_attributes :subject, datastream: 'dcMetadata', multiple: false

end
