require 'md5'

module Sinatra
  module Authorization
 
  def auth
    @auth ||= Rack::Auth::Basic::Request.new(request.env)
  end
 
  def unauthorized!(realm="myApp.com")
    headers 'WWW-Authenticate' => %(Basic realm="#{realm}")
    throw :halt, [ 401, 'Authorization Required' ]
  end
 
  def bad_request!
    throw :halt, [ 400, 'Bad Request' ]
  end
 
  def authorized?
    request.env['REMOTE_USER']
  end
 
  def authorize(username, password)
    @authorization = YAML.load(File.read(File.expand_path(File.dirname(__FILE__) + '/../config/authorization.yml')))
    return !@authorization.blank? && @authorization[username]['password'] == MD5.new(password).to_s
  end
 
  def require_admin
    return if authorized?
    unauthorized! unless auth.provided?
    bad_request! unless auth.basic?
    unauthorized! unless authorize(*auth.credentials)
    request.env['REMOTE_USER'] = auth.username
  end
 
  def admin?
    authorized?
  end
 
  end
end