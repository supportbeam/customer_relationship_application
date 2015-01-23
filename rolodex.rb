#Rolodex is a database

class Rolodex

  @@ids = 1 # @@: class variable value that is constant to all class instances
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

  def modify_contact(id)
    # contact = @contacts[id]
    # puts "Got contact #{contact.name}"
  end

  def display_contacts
    @contacts.each do |c|
      puts "Name:  #{c.first_name} #{c.last_name}"
      puts "Email: #{c.email}"
      puts "Note:  #{c.note}"
      puts "ID: #{c.id}"
      puts ""
    end
    nil
  end

  def display_contact(id)
    @contacts.find { |contact| contact.id == id}
    # c = @contacts.search { |contact|  contact.id == id  }.first
    # c.to_s
    # puts "Name:  #{c.@first_name} #{c.@last_name}"
    # puts "Email: #{c.email}"
    # puts "Note:  #{c.note}"
    # puts "ID: #{c.id}"
    # puts ""
  end

# As a user, if 'display attribute' is selected, I am prompted to enter an attribute ('firstname', 'lastname', 'email', or 'notes') so that I can see all of the contacts according to that attribute.
  def display_attribute(attribute)
    @contacts.each do |c|
      case attribute
       when attribute == 'firstname' then  c.first_name   
       when attribute == 'lastname' then c.last_name
       when attribute == 'email' then c.email
       when attribute == 'notes' then c.note     
      end 
    end
  end

  def delete_contact(contact)
  end

end
