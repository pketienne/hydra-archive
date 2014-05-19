class Datastreams::MetsdcMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
    t.root(path: "mets")
    t.title(index_as: :stored_searchable)
    t.author(index_as: :stored_searchable)
  end

  def self.xml_template
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.mets("xmlns:mets"=>"http://www.loc.gov/METS",
               "xmlns:dc"=>"http://purl.org/dc/elements/1.1/",
               "xmlns:xsi"=>"http://www.w3.org/2001/XMLSchema-instance",
               :type=>"", :label=>"", :dmdid=>"") {
        xml.parent.namespace = xml.parent.namespace_definitions.first
        xml.metsHdr
        xml.dmdSec(:id=>"") {
          xml.mdWrap(:mdtype=>"DC") {
            xml.xmlData {
              xml.parent.namespace = xml.parent.namespace_definitions.first
              xml.record {
                xml['dc'].title
                xml['dc'].creator
                xml['dc'].type
                xml['dc'].format("xsi:type"=>"")
                xml['dc'].description
                xml['dc'].subject
                xml['dc'].source
                xml['dc'].rights
                xml['dc'].identifier
                xml['dc'].relation
                xml['dc'].language("xsi:type"=>"")
              }
            }
          }
        }
        xml.fileSec
        xml.structMap(:type=>"", :id=>"")
      }

    end
    return builder.doc

  end

  def prefix
    '' # add a prefix for solr index terms if you need to namespace identical terms in multiple data streams 
  end

end
