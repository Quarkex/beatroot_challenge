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
        "GRid": self.grid,
        "EAN": self.ean,
        "CatalogNumber": self.catalogueNumber,
      },
      "ReferenceTitle": {
        "TitleText": self.title,
        "SubTitle": self.subtitle,
      },
      "ReleaseResourceReferenceList": tracks.map{|t| t.resourceReference },
      "ProductType": self.productType,
      "ArtistName": self.artist.name,
      "ParentalWarningType": self.parentalWarning,
      "ResourceGroup": tracks.map.with_index{|t, i| { 
        "SequenceNumber": i,
        "ReleaseResourceReference": t.resourceReference,
      } },
      "Genre": self.tags.select{|tag|
        tag.classification == 'genre'
      }.map{|tag|
        tag.name
      },
      "OriginalReleaseDate": self.releaseDate,
      "Duration": self.duration, # TODO transform this to expected format: "PT00H03M45S"
      "PLine": {
        "Year": self.recordLabels.first.pLine.split(' ').first,
        "PLineText": self.recordLabels.first.pLine.split(' ').drop(1).join(' '),
      },
      "CLine": {
        "Year": self.recordLabels.first.cLine.split(' ').first,
        "CLineText": self.recordLabels.first.cLine.split(' ').drop(1).join(' '),
      },
    }

    "<ResourceList>#{tracks.map{|t| t.to_s }.join}</ResourceList>#{xml.generate(model)}"
  end

end
