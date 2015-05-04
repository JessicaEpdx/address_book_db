require('spec_helper')
require('pry')

describe(Contact) do
  describe("#save") do
    it('saves a contact into the database') do
      new_contact = Contact.new({:first_name => "Robin", :last_name => "Hood", :birth_year => 1960})
      new_contact.save()
      expect(Contact.all()).to(eq([new_contact]))
    end
  end
end
