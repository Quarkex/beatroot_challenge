require_relative 'model'
require_relative 'xml_view'

class Track < Model

  XML_Dictionary = {}

  attr_accessor :resourceReference

  def to_s()
    xml = XML_View.new("Track", XML_Dictionary)

    model = {
      "ISRC": self.isrc,
      "ResourceReference": self.resourceReference,
      "ReferenceTitle": {
        "TitleText": self.fullTitle,
        "SubTitle": self.subtitle,
      },
      "Duration": self.duration,
      "ArtistName": self.artist.name,
      "LabelName": self.recordLabels.first.name,
      "PLine": {
        "Year": self.recordLabels.first.pLine.split(' ').first,
        "PLineText": self.recordLabels.first.pLine.split(' ').drop(1).join(' '),
      },
      "Genre": self.tag.name,
      "ParentalWarningType": self.parentalWarning,
    }

    xml.generate(model)
  end

end
