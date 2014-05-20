class Ead < ActiveFedora::Base
  has_metadata 'eadMetadata', type: EadMetadata

  has_many :items, :property=> :is_part_of

  has_attributes :eadid, datastream: 'eadMetadata', multiple: false

end
