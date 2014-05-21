class EadMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
    t.root(path: "ead")
    t.ead
  end

  def self.xml_template
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.ead {
        xml.eadheader(:findaidstatus=>"",
                      :repositoryenchoding=>"",
                      :countryencoding=>"",
                      :dateencoding=>"",
                      :langencoding=>"") {
          xml.eadid
          xml.filedesc {
            xml.titlestmt
            xml.publicationstmt
            xml.notestmt
          }
          xml.profiledesc {
            xml.creation
            xml.langusage
            xml.descrules
          }
          xml.revisiondesc {
            xml.change
          }
        }
        xml.archdesc {
          xml.did
          xml.odd(:id=>"")
          xml.acqinfo(:id=>"")
          xml.accessrestrict(:id=>"")
          xml.userrestrict(:id=>"")
          xml.separatedmaterial(:id=>"")
          xml.prefercite(:id=>"")
          xml.processinfo(:id=>"")
          xml.bioghist(:id=>"")
          xml.arrangement(:id=>"")
          xml.scopecontent(:id=>"")
          xml.relatedmaterial(:id=>"")
          xml.altformavail(:id=>"")
          xml.accurals(:id=>"")
          xml.bibliography(:id=>"")
          xml.otherfindaid(:id=>"")
          xml.phystech(:id=>"")
          xml.fileplan(:id=>"")
          xml.controlaccess
          xml.dsc
        }
      }
    end
    return builder.doc

  end

  def prefix
    # set a datastream prefix if you need to namespace terms that might occur in multiple data streams 
    ""
  end

end
