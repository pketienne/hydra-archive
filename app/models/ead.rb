class Ead < ActiveFedora::Base
  has_metadata 'ead-metadata', type: EadMetadata

  has_many :items, :property=> :is_part_of

  has_attributes :eadheader, datastream: 'ead-metadata', multiple: false
  has_attributes :eadid, datastream: 'ead-metadata', multiple: false

end
