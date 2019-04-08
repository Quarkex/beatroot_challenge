require 'xml_view'
require 'json'

track_json = <<~HEREDOC.strip
{
    "track": {
        "id": 50022,
        "title": "Cruel World",
        "subtitle": null,
        "mix_version": null,
        "searchable": true,
        "recording_token": "ee60b96d-b04e-432f-8bae-0b7e2316ddc9",
        "recording_file_name": "1438201755_CruelWorld.mp3",
        "recording_custom_file_name": null,
        "bit_rate": 266,"channels": null,
        "sample_rate": null,
        "codec": "mp3",
        "duration": 399,
        "created_at": "2015-07-29T20:29:18.521Z",
        "updated_at": "2017-02-17T13:23:19.148Z",
        "waveform": [],
        "sentiment": "negative",
        "musical_work_type": "track",
        "inherit_parent_track_data": false,
        "playlists_count": 5,
        "releases_count": 2,
        "preview_start": null,
        "preview_duration": null,
        "url_token": "4e56fa4a-e6a0-443b-b720-82294b0eab32",
        "explicit": false,
        "parental_warning": "not_explicit",
        "isrc": null,
        "iswc": null,
        "prs_tunecode": null,
        "catalogue_number": null,
        "recording_territory": "US",
        "recording_date": "2016-08-02",
        "publishing_territory": "AC",
        "publishing_date": "2016-08-11",
        "commissioning_territory": "US",
        "key": "1A",
        "bpm": 133,
        "intensity": 0,
        "lyrics": null,
        "notes": null,
        "comments": null,
        "cover": false,
        "represented_recording_rights": null,
        "represented_publishing_rights": null,
        "artist": {
            "id": 2090,
            "writer": false,
            "name": "Bob Marley and The Wailers",
            "key_name": null,
            "image_token": "1431717a-a09e-4de7-80c3-5e009fb7b55a",
            "image_colours": ["030201", "1a0703", "4a1607", "252115", "241207", ... ],
            "tracks_count": 9,
            "searchable": true,
            "created_at": "2017-07-27T13:19:10.633Z",
            "updated_at": "2017-08-23T15:16:02.526Z",
            "image_crop_x": 0,
            "image_crop_y": 0,
            "image_crop_width": 0,
            "image_file_name": "1501161580_c7775e59213c4d8e8012fb957dbc326b.png","location": null,
            "releases_count": 3,
            "biography": "<p>Bob Marley and the Wailers were a Jamaican reggae band led
            by Bob Marley which developed from the earlier ska vocal group, the Wailers,
            created by Marley with Peter Tosh and Bunny Wailer in 1963. By late 1963 singers
            Junior Braithwaite, Beverley Kelso, and Cherry Smith had joined the Wailers. By
            the early 1970s, Marley and Bunny Wailer had learned to play some instruments and
            brothers Aston \"Family Man\" Barrett (bass) and Carlton Barrett (drums), had
            joined the band. After Bunny Wailer and Peter Tosh left the band in 1974, Marley
            began touring with new band members. His new backing band included the Barrett
            brothers, Junior Marvin and Al Anderson on lead guitar, Tyrone Downie and Earl
            \"Wya\" Lindo on keyboards, and Alvin \"Seeco\" Patterson on percussion. The \"I
            Threes\", consisting of Judy Mowatt, Marcia Griffiths, and Marley's wife, Rita,
            provided backing vocals.... <a
            href=\"https://en.wikipedia.org/wiki/Bob_Marley_and_the_Wailers\"
            target=\"_blank\">Wikipedia</a></p>",
            "notes": "Sync Only.",
            "cae": null,
            "collaborators": [
                {
                    "id": 2091,
                    "name": "Bob Marley",
                    "featured": false,
                    "image_token": "68901709-2499-4c4e-b1e4-52f57f481723",
                    "image_colours": ["b3b7ad", "030202", "612404", ... ],
                    "image_crop_x": 0,
                    "image_crop_y": 0,
                    "image_crop_width": 0
                },
                {
                    "id": 2093,
                    "name": "The Wailers Band",
                    "featured": false,
                    "image_token": "b5b74a42-da85-4293-9756-bc3c347067aa",
                    "image_colours": ["030405", "070e12", "1c0607", ... ],
                    "image_crop_x": 0,
                    "image_crop_y": 0,
                    "image_crop_width": 0
                }
            ],
            "featured_tracks": [
                {
                    "id": 53875,
                    "title": "Three little birds",
                    "full_title": "Three little birds",
                    "bpm": 178,
                    "duration": 5,
                    "waveform": [28, 54, 52, 37, 48, 35, 35, 38, 26, 35, ... ],
                    "web_transcoding": {
                        "id": 1146,
                        "codec": "mp4",
                        "bit_rate": 128,
                        "sample_rate": 44100,
                        "file_token": "d1f41d70-d99b-47b7-8e29-d74f0db233b7",
                        "for_web": true
                    }
                },
                {
                    "id": 53879,
                    "title": "Could You Be Loved",
                    "full_title": "Could You Be Loved",
                    "bpm": 178,
                    "duration": 5,
                    "waveform": [28, 54, 52, 37, 48, 35, 35, 38, 26, ... ],
                    "web_transcoding": {"id": 1149,
                        "codec": "mp4",
                        "bit_rate": 128,
                        "sample_rate": 44100,
                        "file_token": "78f6d72d-42af-4218-b945-35f5367ae19f",
                        "for_web": true
                    }
                },
                {
                    "id": 53880,
                    "title": "Buffalo Soldier",
                    "full_title": "Buffalo Soldier",
                    "bpm": 178,
                    "duration": 5,
                    "waveform": [28, 54, 52, 37, 48, 35, 35, 38, 26, 35, ... ],
                    "web_transcoding": {
                        "id": 1152,
                        "codec": "mp4",
                        "bit_rate": 128,
                        "sample_rate": 44100,
                        "file_token": "ba8c8e98-86d9-455e-bdda-7cea34ab5658",
                        "for_web": true
                    }
                }
            ],
            "tags": [
                {
                    "id": 1419,
                    "primary": false,
                    "score": 100,
                    "name": "Reggae",
                    "classification": "genre"
                },
                {
                    "id": 674,
                    "primary": false,
                    "score": 3,
                    "name": "Mellow",
                    "classification": "mood"
                },
                {
                    "id": 2584,
                    "primary": false,
                    "score": 2,
                    "name": "Chillout",
                    "classification": "genre"
                },
                {
                    "id": 2087,
                    "primary": false,
                    "score": 1,
                    "name": "Peace",
                    "classification": "meaning"
                },
                {
                    "id": 1610,
                    "primary": false,
                    "score": 1,
                    "name": "Love",
                    "classification": "meaning"
                },
            ],
            "social_standing": [
                {
                    "handle": "BobMarley","service": "twitter",
                    "total_count": null,
                    "custom_service_name": null
                },
                {
                    "handle": "Bob_Marley_and_the_Wailers",
                    "service": "wikipedia",
                    "total_count": null,
                    "custom_service_name": null
                },
                {
                    "handle": "c296e10c-110a-4103-9e77-47bfebb7fb2e",
                    "service": "musicbrainz",
                    "total_count": null,
                    "custom_service_name": null
                }
            ]
        },
        "web_transcoding": {
            "id": 87,
            "codec": "mp4",
            "bit_rate": 128,
            "sample_rate": 44100,
            "file_token": "823edfe7-f2eb-4aeb-a89d-4a27ef9bdeab",
            "for_web": true
        },
        "parent_track": null,
        "transcodings": [
            {
                "id": 87,
                "codec": "mp4",
                "bit_rate": 128,
                "sample_rate": 44100,
                "file_token": "823edfe7-f2eb-4aeb-a89d-4a27ef9bdeab",
                "for_web": true
            }
        ],
        "tag": {
            "id": 1425,
            "primary": true,
            "score": 11,
            "name": "Rock",
            "classification": "genre"
        },
        "key_release": null,
        "covered": null,
        "variations": [],"publishers": [
            {
                "id": 13,
                "territories": [
                    "GB"
                ],
                "start_date": null,
                "end_date": null,
                "split": 12,
                "territory_of_control": [
                    "GB"
                ],
                "name": "One Music Publishing"
            }
        ],
        "record_labels": [
            {
                "id": 35,
                "territories": [
                    "GB"
                ],
                "start_date": null,
                "end_date": null,
                "contract_type": null,
                "c_line": "234",
                "p_line": "234",
                "name": "Beatroot Records",
                "imprint": {
                    "id": 1,
                    "name": "Imprinted"
                }
            }
        ],
        "deals": [],
        "writers": [],
        "contributors": [],
        "tags": [
            {
                "id": 1425,
                "primary": true,
                "score": 11,
                "name": "Rock",
                "classification": "genre"
            }
        ]
    }
}
HEREDOC

track_xml = <<~HEREDOC.strip
<Track>
    <ISRC></ISRC>
    <ResourceReference></ResourceReference>
    <ReferenceTitle>
        <TitleText>Cruel World</TitleText>
        <SubTitle></SubTitle>
    </ReferenceTitle>
    <Duration>399</Duration>
    <ArtistName>Bob Marley and The Wailers</ArtistName>
    <LabelName>Beatroot Records</LabelName>
    <PLine>
        <Year>234</Year>
        <PLineText>234</PLineText>
    </PLine>
    <Genre>Rock</Genre>
    <ParentalWarningType>NotExplicit</ParentalWarningType>
</Track>
HEREDOC

track = JSON.parse track_json

RSpec.describe XML_View, "#render_track" do
    it "renders a track properly" do

      output = XML_View.render_track(track)

      expect(output).to eq track_xml

    end
end
