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

# As a user, if 'modify' is selected, I am prompted to enter an id for the contact to be modified.
# As a user, when an id is entered, I am prompted to type 'yes' or 'no' to confirm my selection.
# As a user, if 'yes' is typed, I am prompted to change 'firstname', 'lastname', 'email' or 'notes' by number. You shouldn't be able to change the 'id'.
  def modify_contact(id, attribute)
    display_contact(id)
    contact 
    # contact = @contacts[id]
    # puts "Got contact #{contact.name}"
  end

  def display_contacts
    @contacts.each { |c| c }
      # puts "Name: #{c.first_name} #{c.last_name}"
      # puts "Email: #{c.email}"
      # puts "Note:  #{c.note}"
      # puts "ID: #{c.id}"
      # puts ""
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
       when 'firstname' then  puts "#{c.first_name}"
       when 'lastname' then puts "#{c.last_name}"
       when 'email' then puts "#{c.email}"
       when 'notes' then puts "#{c.note}"
       else
        "That is not a valid attribute. Please try again."
      end 
    end
  end

  def delete_contact(id)
    del = display_contact(id)
    @contacts.delete(del)
        # @contacts.find do |contact| 
    #   @contacts.delete(id) if contact.id == id
  end

end