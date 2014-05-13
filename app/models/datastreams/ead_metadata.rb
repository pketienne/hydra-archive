class EadMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
    t.root(path: "ead")
    t.eadheader(index_as: :stored_searchable)
    t.eadid(index_as: :stored_searchable)
  end

  def self.xml_template
    Nokogiri::XML.parse("<ead/>")
  end

  def prefix
    # set a datastream prefix if you need to namespace terms that might occur in multiple data streams 
    ""
  end

end
