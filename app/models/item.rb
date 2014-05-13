class Item < ActiveFedora::Base
  has_metadata 'mets-metadata', type: Datastreams::MetsMetadata
  has_metadata 'mods-metadata', type: Datastreams::ModsMetadata
  has_metadata 'dc-metadata', type: Datastreams::DcMetadata

  belongs_to :ead, :property=> :is_part_of

  has_attributes :mets, datastream: 'mets-metadata', multiple: false
  has_attributes :name, datastream: 'mets-metadata', multiple: false

  has_attributes :title, datastream: 'mods-metadata', multiple: false
  has_attributes :genre, datastream: 'mods-metadata', multiple: false
  has_attributes :identifier, datastream: 'mods-metadata', multiple: false

  has_attributes :title, datastream: 'dc-metadata', multiple: false
  has_attributes :creator, datastream: 'dc-metadata', multiple: false
  has_attributes :subject, datastream: 'dc-metadata', multiple: false

end
