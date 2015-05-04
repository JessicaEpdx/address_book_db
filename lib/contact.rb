class Contact
  attr_reader(:first_name, :last_name, :birth_year, :id)

  define_method(:initialize) do |attributes|
    @first_name = attributes.fetch(:first_name)
    @last_name = attributes.fetch(:last_name)
    @birth_year = attributes.fetch(:birth_year)
    @id = nil
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO contact (first_name, last_name, birth_year) VALUES ('#{@first_name}', '#{@last_name}', '#{@birth_year}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  define_singleton_method(:all) do
    returned_contacts = DB.exec("SELECT * FROM contact;")
    contacts = []
    returned_contacts.each() do |contact|
      first_name = contact.fetch("first_name")
      last_name = contact.fetch("last_name")
      birth_year = contact.fetch("birth_year").to_i()
      id = contact.fetch("id")
      contacts.push(Contact.new({:first_name => first_name, :last_name => last_name, :birth_year => birth_year, :id => id}))
    end
    contacts
  end

  define_method(:==) do |other_contact|
    (self.first_name() == other_contact.first_name()) & (self.last_name() == other_contact.last_name()) & (self.birth_year() == other_contact.birth_year())
  end

  define_method(:clear) do
    DB.exec("DELETE FROM contact WHERE id = #{@id}")
  end

  define_method(:add_phone) do |phone|
    @phone = phone
  end

  define_method(:add_email) do |address|
    DB.exec("INSERT INTO email (address, id_contact) VALUES ('#{address}', #{@id})")
  end

  define_method(:find_email) do
    result = DB.exec("SELECT * FROM email WHERE id_contact = #{@id};")
    result.first().fetch("address")
  end

  define_method(:add_address) do |address|
    @address = address
  end

end
