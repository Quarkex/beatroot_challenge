require 'ox'
require 'net/http'
require 'net/https'
require 'uri'
require 'json'


class Beatroot

  attr_accessor :token, :api_base_url, :user

  def initialize(api_base_url, user, token)
    @api_base_url = api_base_url
    @user = user
    @token = token
  end

  ## TODO Add single track fetching.
  ## Seems to be ok acording to documentation.
  def get_track_by_id(id)
    res = _get("track/#{id}")
    if res.code == "200" then
      JSON.parse res.body
    else
      raise "Error downloading track. Response code: #{res.code}"
    end
  end

  def get_all_tracks(page=1, limit=50)
    res = _get("tracks?page=#{page}&per_page=#{limit}")
    if res.code == "200" then
      JSON.parse res.body
    else
      raise "Error downloading tracks. Response code: #{res.code}"
    end
  end

  private

  def _get(target)
    uri = URI.parse(@api_base_url + '/accounts/' + @user + '/' + target)
    req = Net::HTTP::Get.new(uri)
    req['Authorization'] = 'Token token="' + @token + '"'

    Net::HTTP.start(uri.host, uri.port, :use_ssl => uri.scheme == 'https') {|http|
        http.request(req)
    }
  end

end
