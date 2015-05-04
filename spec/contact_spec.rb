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

  describe("#clear") do
    it('deletes an item from the database') do
      new_contact = Contact.new({:first_name => "Robin", :last_name => "Hood", :birth_year => 1960})
      new_contact.save()
      new_contact2 = Contact.new({:first_name => "Robin", :last_name => "Williams", :birth_year => 1960})
      new_contact2.save()
      new_contact.clear()
      expect(Contact.all()).to(eq([new_contact2]))
    end
  end

  describe("#id") do
    it("checks the id") do
      new_contact = Contact.new({:first_name => "Robin", :last_name => "Hood", :birth_year => 1960})
      new_contact.save()
      expect(new_contact.id()).to(be_instance_of(Fixnum))
    end
  end

  describe("#find_email") do
    new_contact = Contact.new({:first_name => "Robin", :last_name => "Hood", :birth_year => 1960})
    new_contact.save()
    new_contact.add_email("email@test.com")
    expect(new_contact.find_email()).to(eq("email@test.com"))
  end
end
