class Datastreams::MetsMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
    t.root(path: "mets")
    t.title(index_as: :stored_searchable)
    t.author(index_as: :stored_searchable)
  end

  def self.xml_template
    Nokogiri::XML.parse("<mets/>")
  end

  def prefix
    # set a datastream prefix if you need to namespace terms that might occur in multiple data streams 
    ""
  end

end
