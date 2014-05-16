class Page < ActiveFedora::Base
  has_metadata 'pageMetadata', type: Datastreams::PageMetadata
  has_metadata 'wordMetadata', type: Datastreams::WordMetadata
  has_metadata 'letterMetadata', type: Datastreams::LetterMetadata

  belongs_to :book, :property=> :is_part_of

  has_attributes :title, datastream: 'pageMetadata', multiple: false
  has_attributes :author, datastream: 'pageMetadata', multiple: false

  has_attributes :title, datastream: 'wordMetadata', multiple: false
  has_attributes :author, datastream: 'wordMetadata', multiple: false

  has_attributes :title, datastream: 'letterMetadata', multiple: false
  has_attributes :author, datastream: 'letterMetadata', multiple: false

end
