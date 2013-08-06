# GET ROUTES ================================================================================

# Retrieve a list of contacts
get '/contacts' do
  @contacts = Contact.order('last_name ASC') # sort them by alphabetical order by last_name
  erb :index
end

# Retrieve the form used to collect data from the user to create a contact
get '/contacts/new' do
  erb :new, layout: !request.xhr?
end

# Retrieve the resource with the id from the url
get '/contacts/:id' do
  @contact = Contact.find(params[:id])
  erb :show
end

# Retrieve the form used to edit existing contacts
get '/contacts/:id/edit' do
  @contact = Contact.find(params[:id])
  erb :edit
end

# POST ROUTES ===============================================================================

# Create a new contact with data from the form
post '/contacts' do
  puts params.inspect
  @contact = Contact.new(params[:contact])
  if @contact.save
    if request.xhr?
      erb :_contact_tr, layout: false, locals: {contact: @contact}
    else
      redirect to "/contacts/#{@contact.id}"
    end
  else
    erb :new
  end
end

# Update a contact with data from the form
post '/contacts/:id' do
  @contact = Contact.find(params[:id])
  if @contact.update_attributes(params[:contact])
    redirect to "/contacts/#{@contact.id}"
  else
    erb :edit
  end
end

# Delete a contact
post '/contacts/:id/delete' do
  @contact = Contact.find(params[:id])
  @contact.destroy
  redirect to '/contacts'
end

