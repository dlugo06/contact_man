class Contact
  attr_accessor :first_name, :last_name, :email, :phone

  @@all_contacts = []

  def initialize(first_name, last_name, email, phone)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @phone = phone
    @@all_contacts << self
  end

  def self.all
    @@all_contacts
  end

end
