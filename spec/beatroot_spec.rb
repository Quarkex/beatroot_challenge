require 'beatroot'
require 'config'

config = Config.new('config.yml')

RSpec.describe Beatroot, "#read_tracks" do
  context "with known token" do
    it "downloads correctly from server" do
      beatroot = Beatroot.new(
        config.api_base_url,
        config.account_slug,
        config.authentication_token
      )

      tracks = beatroot.get_all_tracks()


      expect(tracks).to have_key "tracks"
      expect(tracks).to have_key "meta"

      ## TODO Add single track fetching.
      ## Seems to be ok acording to documentation.
      #
      #track = beatroot.get_track_by_id(tracks["tracks"].first["id"])
      #
      #expect(track).to have_key "track"

    end
  end
end
