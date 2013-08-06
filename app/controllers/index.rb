get '/:id' do
  @contacts = Contact.order('last_name ASC') # sort them by alphabetical order
  erb :index
end
