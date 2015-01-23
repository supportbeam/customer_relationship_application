#Rolodex is a database

class Rolodex

  @@ids = 1001 # @@: class variable value that is constant to all class instances
	def initialize
    @contacts = []
    # @ids = 1001 
  end

  def add_contact(contact)
    contact.id = @@ids
    @contacts << contact
    @@ids += 1 #unique id for the contact
    contact
  end

  def modify_contact
  end

  def display_contacts
  end

  def display_contact
  end

  def display_attribute
  end

  def delete_contact(contact)
  end

end
