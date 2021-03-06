require 'sinatra'
require 'dotenv'
require 'dotenv/load'
require 'net/http'
require 'builder'
require 'httparty'
require 'json'
require 'base64'

Dotenv.load

require 'securerandom'
set :session_secret, ENV.fetch('SESSION_SECRET'){SecureRandom.hex(64)}
# require 'sinatra/reloader'

enable :sessions

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file}
Dir[File.dirname(__FILE__) + '/lib/**/.rb'].each {|file| require file}
require 'sinatra/reloader'
also_reload('lib/**/*.rb')

# Auth Helper

register do
    def auth (type)
      condition do
        redirect "/session" unless send("is_#{type}?")
      end
    end
  end

  helpers do
    def is_user?
      @user != nil
    end
  end

# Utlity method for setting up authentication
  def session_request_xml(uid, pwd, ns)
    xml = Builder::XmlMarkup.new( :indent => 2 )
    xml.instruct! :xml, :encoding => "UTF-8"
    xml.SessionRequest do |e|
      e.Namespace ns
      e.UserId uid
      e.Password pwd
      e.Format 'json'
    end
  end

# Routes

#
before do
  # sets @user to authentication session_id
  @user = session[:djenc_token]
end

get '/', :auth => :user do
  @page_title = "home"
  erb :home
end

get '/session' do
  if ENV['DJ_USER'] && ENV['DJ_PW'] && ENV['DJ_NS']
    xml = session_request_xml(ENV['DJ_USER'], ENV['DJ_PW'], ENV['DJ_NS'])
    res = HTTParty.post('http://api.beta.dowjones.com/api/1.0/session/EncryptedToken', body: xml, headers: {'Content-Type' => 'application/xml'}, :debug_output => $stdout)
    session[:djenc_token] = res.parsed_response["EncryptedToken"]
    redirect '/'
  else

  end
end


get '/rnctest' do
    erb :rncform
end

post '/rnctest' do
    auth = Base64.encode64("#{params['namespace']}/#{params['username']}:#{params['password']}")
    response = HTTParty.get('http://djrc.api.test.dowjones.com/v1/taxonomy/region-types', headers: {'Authorization' => "Basic #{auth}" }, :debug_output => $stdout)
    @res = response.parsed_response
    erb :rncapi
end
