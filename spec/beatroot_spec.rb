require 'beatroot'
require 'config'
require 'json'

RSpec.describe Beatroot, "#read_tracks" do
  context "with known token" do
    it "downloads correctly from server" do
      config = Config.new('config.yml')

      beatroot = Beatroot.new(
        config.api_base_url,
        config.account_slug,
        config.authentication_token
      )

      res = beatroot.get_all_tracks()

      expect(res.code).to eq "200"
      body = JSON.parse res.body

      expect(body).to have_key "tracks"
      expect(body).to have_key "meta"

    end
  end
end
