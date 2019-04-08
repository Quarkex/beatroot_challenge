require 'ox'
require 'net/http'
require 'net/https'
require 'uri'


class Beatroot

  attr_accessor :token, :api_base_url, :user

  def initialize(api_base_url, user, token)
    @api_base_url = api_base_url
    @user = user
    @token = token
  end

  def get_all_tracks(page=1, limit=50)
    _get("tracks?page=#{page}&per_page=#{limit}")
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
