require 'nokogiri'
require 'open-uri'
    # Port 3003!
class RssController < ApplicationController
  def data
  end

  def transform
    doc = Nokogiri::XML(open('http://localhost:3003/reverse/show.rss?&val='+params[:val]))
    respond_to do |format|
      format.rss {render xml: doc.to_s}
      # format.html {@result = doc.xpath("//item/description")}
      format.html {@result = doc.xpath("//item/description").map {|i| i.text.chomp}}
    end
  end
end
