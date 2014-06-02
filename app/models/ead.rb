class Ead < ActiveFedora::Base
  has_metadata 'eadMetadata', type: EadMetadata

end
