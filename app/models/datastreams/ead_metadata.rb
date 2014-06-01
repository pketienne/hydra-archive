class EadMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
    t.root(path: "ead")
  end

  def self.xml_template
    Nokogiri::XML.parse("<ead/>")
  end

end
