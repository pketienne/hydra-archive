class EadMetadata < ActiveFedora::OmDatastream

  set_terminology do |t|
    # t.root(:path => "ead")
    t.eadheader {
      t.eadid(index_as: :stored_searchable)
      t.filedesc
      t.profiledesc
      t.revisiondesc
    }
    t.archdesc {
      t.did
      t.odd
      t.acqinfo
      t.accessrestrict
      t.userestrict
      t.separatedmaterial
      t.prefercite
      t.processinfo
      t.bioghist
      t.arrangement
      t.scopecontent
      t.relatedmaterial
      t.altformavail
      t.accruals
      t.bibliography
      t.otherfindaid
      t.phystech
      t.fileplan
      t.controlaccess
      t.dsc
    }

  end

  def self.xml_template
    Nokogiri::XML.parse("<ead/>")

=begin
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.ead {
        xml.eadheader {
          xml.eadid
          xml.filedesc
          xml.profiledesc
          xml.revisiondesc
        }
        xml.archdesc {
          xml.did
          xml.odd
          xml.acqinfo
          xml.accessrestrict
          xml.userestrict
          xml.separatedmaterial
          xml.prefercite
          xml.processinfo
          xml.bioghist
          xml.arrangement
          xml.scopecontent
          xml.relatedmaterial
          xml.altformavail
          xml.accruals
          xml.bibliography
          xml.otherfindaid
          xml.phystech
          xml.fileplan
          xml.controlaccess
          xml.dsc
        }
      }
    end
=end

  end

  def prefix
    # set a datastream prefix if you need to namespace terms that might occur in multiple data streams 
    ""
  end

end
