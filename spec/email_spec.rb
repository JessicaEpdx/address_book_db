require('spec_helper')
require('pry')

describe(Email) do
  describe('#save') do
    it("saves an email to database") do
      email = Email.new(:address => "Jessicaepdx@gmail.com", :id_contact => 1)
      email.save()
      expect(Email.all()).to(eq([email]))
    end
  end

  describe('.all') do
    it('lists all the emails') do
      email = Email.new(:address => "Jessicaepdx@gmail.com", :id_contact => 1)
      email.save()
      email2 = Email.new(:address => "Jessicaepdx2@gmail.com", :id_contact => 1)
      email2.save()
      expect(Email.all()).to(eq([email, email2]))
    end
  end

end
