#require "uri"
require 'open-uri'
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def getapi(*args)
    #response = Net::HTTP.get_response("http://api.envirologger.net/2.0/interface/a7ea099c-E/7e9f-6a94-Qnu4-FtFD-BRPE-2srr-fc09-aae3","/stationdata/latest/150/67/10")
    #response.body
    #puts response.body

    content = open("http://api.envirologger.net/2.0/interface/a7ea099c-E/7e9f-6a94-Qnu4-FtFD-BRPE-2srr-fc09-aae3/#{args[0]}").read
    JSON.parse(content)
  end
end
