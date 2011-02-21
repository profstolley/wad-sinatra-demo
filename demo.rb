require 'sinatra'
require 'erb'
require 'rss'
require 'open-uri'

get '/hi' do
  @title = "Hello there"
  @greeting = "Hello world! For real!"
  erb :hi
end

get '/twitter' do
  rss_feed = "http://twitter.com/statuses/user_timeline/16049663.rss"
  rss_content =""
  open(rss_feed) do |f|
    rss_content=f.read
  end
  rss = RSS::Parser.parse(rss_content, false)
  @title = rss.channel.title
  @items = rss.channel.items.collect
  erb :twitter
end
