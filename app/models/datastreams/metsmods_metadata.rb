class Datastreams::MetsmodsMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
    t.root(path: "mods")
    t.title(index_as: :stored_searchable)
    t.author(index_as: :stored_searchable)
  end

  def self.xml_template
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.mets("xmlns:mets"=>"http://www.loc.gov/METS",
               "xmlns:mods"=>"http://www.loc.gove/mods/v3",
               :objid=>"", :type=>"", :label=>"") {
        xml.parent.namespace = xml.parent.namespace_definitions.find{|ns|ns.prefix=="mets"}
        xml.metsHdr
        xml.dmdSec(:id=>"") {
          xml.mdWrap(:mdtype=>"MODS") {
            xml.xmlData {
              xml['mods'].mods {
                xml['mods'].titleInfo
                xml['mods'].typeOfResource
                xml['mods'].genre(:authority=>"")
                xml['mods'].originInfo
                xml['mods'].language
                xml['mods'].physicalDescription
                xml['mods'].abstract
                xml['mods'].relatedItem(:type=>"", :displayLabel=>"")
                xml['mods'].identifier
                xml['mods'].accessCondition(:type=>"copyright owner")
                xml['mods'].accessCondition(:type=>"status")
                xml['mods'].accessCondition(:type=>"statement")
                xml['mods'].name(:type=>"")
                xml['mods'].subject(:authority=>"")
                xml['mods'].accessCondition(:type=>"public status")
              }
            }
          }
        }
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
