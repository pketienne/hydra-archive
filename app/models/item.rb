class Item < ActiveFedora::Base
  has_metadata 'metsMetadata', type: Datastreams::MetsMetadata
  has_metadata 'modsMetadata', type: Datastreams::ModsMetadata
  has_metadata 'dcMetadata', type: Datastreams::DcMetadata
  has_metadata 'metsmodsMetadata', type: Datastreams::MetsmodsMetadata
  has_metadata 'metsdcMetadata', type: Datastreams::MetsdcMetadata

  # pdf, txt, jpg, or tif
  has_file_datastream "itemContent"

  belongs_to :ead, :property=> :is_part_of

  has_attributes :title, datastream: 'metsMetadata', multiple: false
  has_attributes :author, datastream: 'metsMetadata', multiple: false

  has_attributes :title, datastream: 'modsMetadata', multiple: false
  has_attributes :author, datastream: 'modsMetadata', multiple: false

  has_attributes :title, datastream: 'dcMetadata', multiple: false
  has_attributes :author, datastream: 'dcMetadata', multiple: false

  has_attributes :title, datastream: 'metsmodsMetadata', multiple: false
  has_attributes :author, datastream: 'metsmodsMetadata', multiple: false

  has_attributes :title, datastream: 'metsdcMetadata', multiple: false
  has_attributes :author, datastream: 'metsdcMetadata', multiple: false

end
