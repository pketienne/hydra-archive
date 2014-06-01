class Item < ActiveFedora::Base
  has_metadata 'itemMetadata', type: ItemMetadata

  # Metadata for Browse Indexes
  has_attributes :title, datastream: 'itemMetadata', multiple: false
  has_attributes :dateIssued , datastream: 'itemMetadata', multiple: false

  # Metadata for Query Results
  # repeat # has_attributes :title, datastream: 'itemMetadata', multiple: false
  # repeat # has_attributes :date, datastream: 'itemMetadata', multiple: false
  has_attributes :documentType, datastream: 'itemMetadata', multiple: false
  has_attributes :uniqueId, datastream: 'itemMetadata', multiple: false
  has_attributes :description, datastream: 'itemMetadata', multiple: false

  # Metadata for Item Record
  ## Item Details
  # repeat # has_attributes :title, datastream: 'itemMetadata', multiple: false
  # repeat # has_attributes :date, datastream: 'itemMetadata', multiple: false
  # dynamic # has_attributes :creator, datastream: 'itemMetadata', multiple: false
  # dynamic # has_attributes :interviewee, datastream: 'itemMetadata', multiple: false
  # repeat # has_attributes :documentType, datastream: 'itemMetadata', multiple: false
  # repeat # has_attributes :description, datastream: 'itemMetadata', multiple: false
  has_attributes :language, datastream: 'itemMetadata', multiple: false
  has_attributes :subject, datastream: 'itemMetadata', multiple: false

  ## Rights Information
  has_attributes :copyrightHolder, datastream: 'itemMetadata', multiple: false
  has_attributes :copyrightStatus, datastream: 'itemMetadata', multiple: false
  has_attributes :rightsStatement, datastream: 'itemMetadata', multiple: false

  ## Physical Item Information
  has_attributes :physicalSize, datastream: 'itemMetadata', multiple: false
  has_attributes :extent, datastream: 'itemMetadata', multiple: false
  has_attributes :condition, datastream: 'itemMetadata', multiple: false
  has_attributes :drawingType, datastream: 'itemMetadata', multiple: false
  # repeat # has_attributes :uniqueId, datastream: 'itemMetadata', multiple: false
  has_attributes :collection, datastream: 'itemMetadata', multiple: false
  has_attributes :box, datastream: 'itemMetadata', multiple: false
  has_attributes :folder, datastream: 'itemMetadata', multiple: false

  ## Available Files
  has_attributes :type, datastream: 'itemMetadata', multiple: false
  has_attributes :resolution, datastream: 'itemMetadata', multiple: false
  has_attributes :fileName, datastream: 'itemMetadata', multiple: false
  has_attributes :format, datastream: 'itemMetadata', multiple: false
  has_attributes :size, datastream: 'itemMetadata', multiple: false

end
