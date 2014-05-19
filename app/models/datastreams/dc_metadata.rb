class Datastreams::DcMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
    t.root(path: "record")
    t.title(index_as: :stored_searchable)
    t.author(index_as: :stored_searchable)
  end

  def self.xml_template
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.record {
        xml.title
        xml.creator
        xml.dateCreated
        xml.type
        xml.format(:type=>"")
        xml.description
        xml.subject
        xml.source
        xml.rights
        xml.identifier
        xml.relation
        xml.language(:type=>"")
      }
    end
    return builder.doc

  end

  def prefix
    # set a datastream prefix if you need to namespace terms that might occur in multiple data streams 
    ""
  end

end
