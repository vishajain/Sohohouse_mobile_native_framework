require 'uri'
require 'net/http'
require 'openssl'
require 'rubygems'
require 'json'
require 'dotenv'

class API_Functions
  def initialize
    Dotenv.load('.env')
  end

  def generate_access_token(email,password)
    begin
      url = URI(ENV['IDENTITY_API']+"/oauth/token")
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
      request = Net::HTTP::Post.new(url)
      request["Content-Type"] = "application/json"
      request.body = "{
            \"client_id\": \""+ENV['CLIENT_ID']+"\",
           \"client_secret\": \""+ENV['CLIENT_SECRET']+"\",
           \"grant_type\": \""+ENV['GRANT_TYPE']+"\",
           \"email\": \""+email+"\",
           \"password\": \""+password+"\"
            }"
      response = https.request(request)
      return JSON.parse((response.body))['access_token']
    rescue StandardError => e
      print e.message
    end
  end

  def get_request(uri,token)
    begin
      url = URI(uri)
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
      request = Net::HTTP::Get.new(url)
      request["Authorization"] = "Bearer " + token
      response = https.request(request)
      return response
    rescue StandardError => e
      '************' + uri + '*************'
      return print e.message
    end
  end

  def post_request(uri,token,body)
    begin
      url = URI(uri)
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
      request = Net::HTTP::Get.new(url)
      request["Authorization"] = "Bearer " + token
      request.body=body
      response = https.request(request)
      return response
    rescue StandardError => e
      '************' + uri + '*************'
      '************' + body + '*************'
      return print e.message
    end
  end

  def patch_request(uri,token,body)
    begin
      url = URI(uri)
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
      request = Net::HTTP::Patch.new(url)
      request["Authorization"] = "Bearer " + token
      request.body=body
      response = https.request(request)
      return response
    rescue StandardError => e
      '************' + uri + '*************'
      '************' + body + '*************'
      return print e.message
    end
  end

  def put_request(uri,token,body)
    begin
      url = URI(uri)
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
      request = Net::HTTP::Put.new(url)
      request["Authorization"] = "Bearer " + token
      request.body=body
      response = https.request(request)
      return response
    rescue StandardError => e
      '************' + uri + '*************'
      '************' + body + '*************'
      return print e.message
    end

  end

  def delete_request(uri,token)
    begin
      url = URI(uri)
      https = Net::HTTP.new(url.host, url.port)
      https.use_ssl = true
      request = Net::HTTP::Delete.new(url)
      request["Authorization"] = "Bearer " + token
      response = https.request(request)
      return response
    rescue StandardError => e
      '************' + uri + '*************'
      return print e.message
    end
  end
end
