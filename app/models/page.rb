class Page < ActiveFedora::Base
  has_metadata 'descMetadata', type: Datastreams::PageMetadata

  belongs_to :book, :property=> :is_part_of

  has_attributes :title, datastream: 'descMetadata', multiple: false
  has_attributes :author, datastream: 'descMetadata', multiple: false

end
