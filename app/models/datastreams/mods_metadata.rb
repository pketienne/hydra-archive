class Datastreams::ModsMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
    t.root(path: "mods")
    t.title(index_as: :stored_searchable)
    t.author(index_as: :stored_searchable)
  end

  def self.xml_template
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.mods {
        xml.titleInfo
        xml.typeOfResource
        xml.genre(:authority=>"")
        xml.originInfo
        xml.language
        xml.physicalDescription
        xml.abstract
        xml.relatedItem(:type=>"", :displayLabel=>"")
        xml.identifier
        xml.accessCondition(:type=>"copyright owner")
        xml.accessCondition(:type=>"status")
        xml.accessCondition(:type=>"statement")
        xml.name(:type=>"personal")
        xml.subject(:authority=>"")
        xml.accessCondition(:type=>"public status")
      }
    end
    return builder.doc

  end

  def prefix
    # set a datastream prefix if you need to namespace terms that might occur in multiple data streams 
    ""
  end

end
