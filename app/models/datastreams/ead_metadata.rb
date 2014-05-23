 class Datastreams::EadMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
    t.root(path: "fields")
    t.eadheader {
      t.eadid(index_as: :stored_searchable)
      t.filedesc
      t.profiledesc
      t.revisiondesc
    }
    t.archdesc
  end

  def self.xml_template
    Nokogiri::XML.parse("<fields/>")
  end

  def prefix
    # set a datastream prefix if you need to namespace terms that might occur in multiple data streams 
    ""
  end

end
