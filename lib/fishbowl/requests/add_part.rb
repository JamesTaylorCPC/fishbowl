module Fishbowl::Requests
  def self.add_part(options = {})
    options = options.symbolize_keys

    request = format_add_part_request(options)
    Fishbowl::Objects::BaseObject.new.send_request(request)
  end

private

  def self.format_add_part_request(options)
    Nokogiri::XML::Builder.new do |xml|
      xml.request {
        xml.ImportRq {
          xml.Type 'ImportPart'
          xml.Rows {
            xml.Row '"FOO-1001","The First Foo","","ea","","Inventory","","","","","","","","","","","","","","","",""'
          }
        }
      }
    end
  end

end
