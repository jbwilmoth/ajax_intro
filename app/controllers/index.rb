# Shows all the contacts
get '/contacts' do
  @contacts = Contact.order('last_name ASC') # sort them by alphabetical order by last_name
  erb :index
end

# This resource is the form used to collect information about the contact
get '/contacts/new' do
  @contact = Contact.new(params[:contact])
  erb :new
end

# resource is the specific contact containing the id passed by the url
get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :show
end

