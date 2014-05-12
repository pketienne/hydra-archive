class Met < ActiveFedora::Base
  has_metadata 'descMetadata', type: Datastreams::MetMetadata

  belongs_to :ead, :property=> :is_part_of

  has_attributes :title, datastream: 'descMetadata', multiple: false
  has_attributes :author, datastream: 'descMetadata', multiple: false

end
