require_relative 'model'
require_relative 'xml_view'

class Track < Model

  XML_Dictionary = {}

  attr_accessor :resourceReference

  def to_s()
    xml = XML_View.new("Track", XML_Dictionary)

    model = {
      "ISRC": ( (self.respond_to? "isrc") ? self.isrc : nil ),
      "ResourceReference": ( (self.respond_to? "resourceReference") ? self.resourceReference : nil ),
      "ReferenceTitle": {
        "TitleText": ( (self.respond_to? "fullTitle") ? self.fullTitle : nil ),
        "SubTitle": ( (self.respond_to? "subtitle") ? self.subtitle : nil ),
      },
      "Duration": ( (self.respond_to? "duration") ? self.duration : nil ),
      "ArtistName": ( (self.artist.respond_to? "name") ? self.artist.name : nil ),
      "LabelName": ( (self.recordLabels.first.respond_to? "name") ? self.recordLabels.first.name : nil ),
      "PLine": ( (self.recordLabels.first.respond_to? "pLine") ? {
        "Year": self.recordLabels.first.pLine.split(' ').first,
        "PLineText": self.recordLabels.first.pLine.split(' ').drop(1).join(' '),
      } : nil ),
      "Genre": ( (self.tag.respond_to? "name") ? self.tag.name : nil ),
      "ParentalWarningType": ( (self.respond_to? 'parentalWarning') ? self.parentalWarning : nil ),
    }

    xml.generate(model)
  end

end
