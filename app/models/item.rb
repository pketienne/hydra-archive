class Item < ActiveFedora::Base
  has_metadata 'itemMetadata', type: ItemMetadata

  # Metadata for Browse Indexes
  has_attributes :title, datastream: 'itemMetadata', multiple: false
  has_attributes :date_issued , datastream: 'itemMetadata', multiple: false

  # Metadata for Query Results
  # repeat # has_attributes :title, datastream: 'itemMetadata', multiple: false
  # repeat # has_attributes :date_issued, datastream: 'itemMetadata', multiple: false
  has_attributes :genre, datastream: 'itemMetadata', multiple: false
  has_attributes :identifier, datastream: 'itemMetadata', multiple: false
  has_attributes :abstract, datastream: 'itemMetadata', multiple: false

  # Metadata for Item Record
  ## Item Details
  # repeat # has_attributes :title, datastream: 'itemMetadata', multiple: false
  # repeat # has_attributes :date_issued, datastream: 'itemMetadata', multiple: false
  has_attributes :creator, datastream: 'itemMetadata', multiple: false
  has_attributes :interviewee, datastream: 'itemMetadata', multiple: false
  # repeat # has_attributes :genre, datastream: 'itemMetadata', multiple: false
  # repeat # has_attributes :abstract, datastream: 'itemMetadata', multiple: false
  has_attributes :language, datastream: 'itemMetadata', multiple: false
  has_attributes :subject, datastream: 'itemMetadata', multiple: false

  ## Rights Information
  has_attributes :access_condition_copyright_owner, datastream: 'itemMetadata', multiple: false
  has_attributes :access_condition_status, datastream: 'itemMetadata', multiple: false
  has_attributes :access_condition_statement, datastream: 'itemMetadata', multiple: false

  ## Physical Item Information
  has_attributes :note_source_dimensions, datastream: 'itemMetadata', multiple: false
  has_attributes :extent, datastream: 'itemMetadata', multiple: false
  has_attributes :note_condition, datastream: 'itemMetadata', multiple: false
  # n/a # has_attributes :drawing_type, datastream: 'itemMetadata', multiple: false
  # repeat # has_attributes :identifier, datastream: 'itemMetadata', multiple: false
  has_attributes :related_item_identifier, datastream: 'itemMetadata', multiple: false
  has_attributes :box_number, datastream: 'itemMetadata', multiple: false
  has_attributes :folder_number, datastream: 'itemMetadata', multiple: false

  ## Available Files
  # n/a # has_attributes :type, datastream: 'itemMetadata', multiple: false
  # n/a # has_attributes :resolution, datastream: 'itemMetadata', multiple: false
  has_attributes :id, datastream: 'itemMetadata', multiple: false
  has_attributes :mimetype, datastream: 'itemMetadata', multiple: false
  has_attributes :size, datastream: 'itemMetadata', multiple: false

end
