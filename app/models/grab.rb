require 'open-uri'
class Grab
  
  def initialize
    uri    = "http://api.envirologger.net/2.0/interface/"
    apikey = "a7ea099c-E/7e9f-6a94-Qnu4-FtFD-BRPE-2srr-fc09-aae3/"
    @api   = uri.concat(apikey)
  end

  def getapi(q)
    fullapi = @api.concat(q)
    content = open(fullapi).read
    JSON.parse(content)
  end

end
