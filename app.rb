#!/usr/bin/env ruby
require 'sinatra'
require_relative 'lib/config'
require_relative 'lib/beatroot'

set :bind, '0.0.0.0'

config = Config.new('config.yml')
beatroot = Beatroot.new(
  config.api_base_url,
  config.account_slug,
  config.authentication_token
)

get '/' do

  tbody = beatroot.releases()["releases"].map{|r|
    "<tr><td>" + [
      r.title,
      '<a href=/release/' + r.id.to_s + '>download xml</a>'
    ].join("</td><td>") + "</td></tr>"
  }.join

  thead = "<tr><th>" + [
    "release title",
    "link",
  ].join("</th><th>") + "</th></tr>"

  html = <<~HEREDOC
  <!DOCTYPE html>
  <html>
    <head>
      <title>Releases</title>
    </head>
    <body>
      <table>
        <thead>
          #{thead}
        </thead>
        <tbody>
          #{tbody}
        </tbody>
      </table>
    </body>
  </html>
  HEREDOC

  html
end

get '/release/:id' do
  content_type 'text/xml'
  xml = beatroot.release(params[:id]).to_s

  '<?xml version="1.0" encoding="UTF-8"?>' + xml
end
