require 'beatroot'
require 'config'
require 'json'

config = Config.new('config.yml')

RSpec.describe Beatroot, "#read_tracks" do
  context "with known token" do
    it "downloads correctly from server" do
      beatroot = Beatroot.new(
        config.api_base_url,
        config.account_slug,
        config.authentication_token
      )

      tracks_res = beatroot.get_all_tracks()

      expect(tracks_res.code).to eq "200"
      tracks_body = JSON.parse tracks_res.body

      expect(tracks_body).to have_key "tracks"
      expect(tracks_body).to have_key "meta"

      ## TODO Add single track fetching.
      ## Seems to be ok acording to documentation.
      #
      #track_res = beatroot.get_track_by_id(tracks_body["tracks"].first["id"])
      #
      #expect(track_res.code).to eq "200"
      #track_body = JSON.parse track_res.body
      #
      #expect(track_body).to have_key "track"

    end
  end
end
