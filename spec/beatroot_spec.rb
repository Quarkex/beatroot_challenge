require 'beatroot'
require 'config'

config = Config.new('config.yml')

RSpec.describe Beatroot, "#read" do
  context "with known token" do

    beatroot = Beatroot.new(
      config.api_base_url,
      config.account_slug,
      config.authentication_token
    )

    it "downloads tracks correctly from server" do
      tracks = beatroot.tracks()

      expect(tracks).to have_key "tracks"
      expect(tracks).to have_key "meta"

      track = beatroot.track(tracks["tracks"].first.id)

      expect(track).to be_a Track

    end

    it "downloads releases correctly from server" do
      releases = beatroot.releases()

      expect(releases).to have_key "releases"
      expect(releases).to have_key "meta"

      release = beatroot.release(releases["releases"].first["id"])

      expect(release).to have_key "release"

    end

  end
end
