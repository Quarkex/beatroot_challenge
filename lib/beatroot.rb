require 'net/http'
require 'net/https'
require 'uri'
require 'json'
require_relative 'track'


class Beatroot

  attr_accessor :token, :api_base_url, :user

  def initialize(api_base_url, user, token)
    @api_base_url = api_base_url
    @user = user
    @token = token
  end

  def track(id)
    res = _get("tracks/#{id}")
    if res.code == "200" then
      Track.new(JSON.parse(res.body)["track"])
    else
      raise "Error downloading track. Response code: #{res.code}"
    end
  end

  def tracks(page=1, limit=50)
    res = _get("tracks?page=#{page}&per_page=#{limit}")
    if res.code == "200" then
      body = JSON.parse(res.body)
      body["tracks"].map!{ |t| Track.new(t) }
      body
    else
      raise "Error downloading tracks. Response code: #{res.code}"
    end
  end

  def release(id)
    res = _get("releases/#{id}")
    if res.code == "200" then
      JSON.parse res.body
    else
      raise "Error downloading track. Response code: #{res.code}"
    end
  end

  def releases(page=1, limit=50)
    res = _get("releases?page=#{page}&per_page=#{limit}")
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
