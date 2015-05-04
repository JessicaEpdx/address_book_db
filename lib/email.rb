
class Email
  attr_reader(:work_email, :personal_email)

  define_method(:initialize) do |attributes|
    @work_email = attributes.fetch(:work_email)
    @personal_email = attributes.fetch(:personal_email)
  end
  define_method(:save) do
    @@emails.push(self)
  end

  define_singleton_method(:all) do
    @@emails
  end

  define_singleton_method(:clear) do
    @@emails = []
  end
end
