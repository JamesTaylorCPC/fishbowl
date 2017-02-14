module Fishbowl::Requests
  def self.import_rows(options = {})
    options = options.symbolize_keys

    request = format_add_part_request(options)
    Fishbowl::Objects::BaseObject.new.send_request(request, 'FbiMsgsRs')
  end

private

  def self.format_add_part_request(options)
    Nokogiri::XML::Builder.new do |xml|
      xml.request {
        xml.ImportRq {
          xml.Type options[:type]
          xml.Rows {
            options[:rows].each do |r|
              xml.Row r
            end
          }
        }
      }
    end
  end

end
