class Datastreams::MetsMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
    t.root(path: "mets")
    t.title(index_as: :stored_searchable)
    t.author(index_as: :stored_searchable)
  end

  def self.xml_template
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.mets(:objid=>"", :type=>"", :label=>"") {
        xml.metsHdr
        xml.dmdSec(:id=>"")
        xml.amdSec
        xml.fileSec
        xml.structMap
        xml.behaviorSec
      }
    end
    return builder.doc

  end

  def prefix
    '' # add a prefix for solr index terms if you need to namespace identical terms in multiple data streams 
  end

end
