class ItemMetadata < ActiveFedora::OmDatastream

  XML_NS = 'http://www.w3.org/2001/XMLSchema-instance'
  XLINK_NS = 'http://www.w3.org/1999/xlink'
  METS_NS = 'http://www.loc.gov/METS/'
  MODS_NS = 'http://www.loc.gov/mods/v3'
  METS_SCHEMA = 'http://www.loc.gov/standards/mets/mets.xsd'
  MODS_SCHEMA = 'http://www.loc.gov/standards/mods/v3/mods-3-3.xsd'
  PARAMS = {
    'xmlns:xsi' => "#{XML_NS}"
    'xmlns:xlink' => "#{XLINK_NS}"
    'xmlns:mets' => "#{METS_NS}"
    'xmlns:mods' => "#{MODS_NS}"
    'xsi:schemaLocation' => "#{METS_NS} #{METS_SCHEMA} #{MODS_NS} #{MODS_SCHEMA}"
  }

  set_terminology do |t|
    t.root(:path => "mets",
           :xmlns => "#{METS_NS}",
           :schema = >"#{METS_SCHEMA}",
           :namespace_prefix=>"mets")
    t.dmd_sec(:path => "dmdSec") {
      t.md_wrap(:path => "mdWrap") {
        t.xml_data(:path => "xmlData") {
          t.mods(:xmlns => "#{MODS_NS}",
                 :schema => "#{MODS_SCHEMA}",
                 :namespace_prefix=>"mods") {
            t.title_info(:path => "titleInfo") {
              t.title(index_as: :stored_searchable) # indexed
            }
            t.genre(index_as: :stored_searchable) # indexed
            t.origin_info(:path => "originInfo") {
              t.date_issued(:path => "dateIssued",
                           :attributes => {:point=>"start"},
                           index_as: :stored_searchable) # indexed
            }
            t.language {
              t.language_term(:path => "languageTerm", index_as: :stored_searchable) # indexed
            }
            t.physical_description(:path => "physicalDescription") {
              t.extent(index_as: :stored_searchable)
              t.note_condition(:path => "note",
                               :attributes => {:type=>"condition"},
                               index_as: :stored_searchable) # indexed
              t.note_source_dimensions(:path => "note",
                             :attributes => {:type=>"source dimensions"},
                             index_as: :stored_searchable) # indexed
            }
            t.abstract(index_as: :stored_searchable) # indexed
            t.related_item(:path => "relatedItem") {
              t.identifier(index_as: :stored_searchable) # indexed
              t.part {
                t.detail_box(:path => "detail", :attributes => {:type="box"}) {
                  t.box_number(:path => "number", index_as: :stored_searchable) # indexed
                }
                t.detail_folder(:path => "detail", :attributes => {:type="folder"}) {
                  t.folder_number(:path => "number", index_as: :stored_searchable) # indexed
                }
              }
            }
            t.identifier(index_as: :stored_searchable) # indexed
            t.access_condition_copyright_owner(:path => "accessCondition",
                              :attributes => {:status => "copyright owner"},
                              index_as: :stored_searchable) # indexed
            t.access_condition_status(:path => "accessCondition",
                              :attributes => {:status=>"status"},
                              index_as: :stored_searchable) # indexed
            t.access_condition_statement(:path => "accessCondition",
                              :attributes => {:status=>"statement"},
                              index_as: :stored_searchable) # indexed
            t.name {
              # this section will need to be modified in order to capture appropriate data.
              # See references and proxies area below.
              t.role {
                t.role_term(:path => "roleTerm")
                t.name_part(:path => "namePart")
                t.display_form(:path => "displayFrom")
              }
            }
            t.subject {
              t.topic(index_as: :stored_searchable) # indexed
            }
          }
        }
      }
    }
    t.file_sec(:path => "fileSec") {
      t.file_grp(:path => "fileGrp") {
        t.file {
          # The resolution attribute does not yet exist but would be a sufficient solution for
          # capturing resolution data. Also, the file elements for the related fileGrp elements
          # are missing for the jpg files.
          # t.resolution(:path => {:attribute => "resolution"}, index_as: :stored_searchable)
          t.id(:path => {:attribute => "ID"}, index_as: :stored_searchable) # indexed
          t.mimetype(:path => {:attribute => "MIMETYPE"}, index_as: :stored_searchable) # indexed
          t.size(:path => {:attribute => "SIZE"}, index_as: :stored_searchable) # indexed
        }
      }
    }

    # References section
    t.name_creator(:ref => :name, :path => 'role[roleTerm = "creator"]')
    t.name_interviewee(:ref => :name, :path => 'role[roleTerm = "Interviewee"]')
    
    # Proxies section
    t.creator(:proxy => [:name_creator, :role, :role_term])
    t.interviewee(:proxy => [:name_intervieww, :role, :role_term])

  end

  def self.xml_template
    Nokogiri::XML.parse("<mets/>")
  end

end
