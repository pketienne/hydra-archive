class EadMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
    t.root(path: "fields")
  end

  def self.xml_template
    Nokogiri::XML.parse("<fields/>")
  end

  def prefix
    # set a datastream prefix if you need to namespace 
    # terms that might occur in multiple data streams
    
    # DEPRECATION WARNING: In active-fedora 8 the solr fields created by EadMetadata will be prefixed
    # with "ead_metadata__".  If you want to maintain the existing behavior, you must override 
    # EadMetadata.#prefix to return an empty string.

    ""
  end

end
