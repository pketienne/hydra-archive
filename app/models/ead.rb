class Ead < ActiveFedora::Base
  has_metadata 'descMetadata', type: EadMetadata

  has_many :mets, :property=> :is_part_of

  has_attributes :title, datastream: 'descMetadata', multiple: false
  has_attributes :author, datastream: 'descMetadata', multiple: false

end
