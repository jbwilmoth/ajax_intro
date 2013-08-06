# Shows all the contacts
get '/contacts' do
  @contacts = Contact.order('last_name ASC') # sort them by alphabetical order by last_name
  erb :index
end
