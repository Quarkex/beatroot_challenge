require_relative 'model'
require_relative 'xml_view'
require_relative 'track'

# This model expects “tracks” to be an array of “Track” models
class Release < Model

  XML_Dictionary = {
      "ReleaseResourceReferenceList": "ReleaseResourceReference",
      "ResourceGroup": "ResourceGroupContentItem",
      "Genre": nil,
  }

  def to_s()
    xml = XML_View.new("Release", XML_Dictionary)

    model = {
      "ReleaseId": {
        "GRid": ((self.respond_to? "grid") ? self.grid : nil ),
        "EAN": ((self.respond_to? "ean") ? self.ean : nil ),
        "CatalogNumber": ( (self.respond_to? "catalogueNumber") ? self.catalogueNumber : nil ),
      },
      "ReferenceTitle": {
        "TitleText": ( (self.respond_to? "title") ? self.title : nil ),
        "SubTitle": ((self.respond_to? "subtitle") ? self.subtitle : nil ),
      },
      "ReleaseResourceReferenceList": tracks.map{|t| t.resourceReference },
      "ProductType": ( (self.respond_to? "productType") ? self.productType : nil ),
      "ArtistName": ( (self.artist.respond_to? "name") ? self.artist.name : nil ),
      "ParentalWarningType": ( (self.respond_to? "parentalWarning") ? self.parentalWarning : nil ),
      "ResourceGroup": tracks.map.with_index{|t, i| { 
        "SequenceNumber": i,
        "ReleaseResourceReference": t.resourceReference,
      } },
      "Genre": ( (self.respond_to? "tags") ? self.tags.select{|tag|
        tag.classification == 'genre'
      }.map{|tag|
        tag.name
      } : nil ),
      "OriginalReleaseDate": ( (self.respond_to? "releaseDate") ? self.releaseDate : nil ),
      "Duration": ((self.respond_to? "duration") ? self.duration : nil ), # TODO transform this to expected format: "PT00H03M45S"
      "PLine": ( (self.recordLabels.first.respond_to? "pLine") ? {
        "Year":  self.recordLabels.first.pLine.split(' ').first,
        "PLineText": self.recordLabels.first.pLine.split(' ').drop(1).join(' '),
      } : nil ),
      "CLine": ( (self.recordLabels.first.respond_to? "pLine") ? {
        "Year": self.recordLabels.first.cLine.split(' ').first,
        "CLineText": self.recordLabels.first.cLine.split(' ').drop(1).join(' '),
      } : nil ),
    }

    "<ResourceList>#{tracks.map{|t| t.to_s }.join}</ResourceList>#{xml.generate(model)}"
  end

end
