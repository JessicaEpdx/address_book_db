class Email
  attr_reader(:address, :id_contact, :id)

  define_method(:initialize) do |attributes|
    @address = attributes.fetch(:address)
    @id_contact = attributes.fetch(:id_contact)
    @id = nil
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO email (address) VALUES ('#{@address}') RETURNING id")
    @id = result.first().fetch("id")
  end

  define_singleton_method(:all) do
    returned_emails = DB.exec("SELECT * FROM email")
    emails = []
    returned_emails.each() do |email|
      address = email.fetch("address")
      id_contact = email.fetch("id_contact").to_i
      id = email.fetch("id")
      emails.push(Email.new({:address => address, :id_contact => id_contact, :id => id}))
    end
    emails
  end

  define_singleton_method(:clear) do
    @@emails = []
  end

  define_method(:==) do |other_email|
    (self.address() == other_email.address)
  end

end
