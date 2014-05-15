class Page < ActiveFedora::Base
  has_metadata 'descMetadata', type: Datastreams::PageMetadata

  has_attributes :number, datastream: 'descMetadata', multiple: false
  has_attributes :text, datastream: 'descMetadata', multiple: false

end
