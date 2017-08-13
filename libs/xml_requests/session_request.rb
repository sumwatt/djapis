require 'builder'

def session_request_xml(uid, pwd, ns)
  xml = Builder::XmlMarkup.new( :indent => 2 )
  xml.instruct! :xml, :encoding => "UTF-8"
  xml.SessionRequest do |e|
    e.Namespace  ns
    e.UserId  uid
    e.Password  pwd
  end
end
