require_relative './rolodex.rb' #require_relative is most commonly used as opposed to relative
require_relative './contact.rb'


class CRM
	attr_reader :name

	def initialize(name)
		@name = name #instance variable private and local to instance of class
		@rolodex = Rolodex.new
	end

	# Don't need name method because attr_reader is used:
	# def name
	# 	@name
	# end

	def print_main_menu
		puts "[1] Add a contact"
		puts "[2] Modify a contact"
		puts "[3] Display all contacts"
		puts "[4] Display one contact"
		puts "[5] Display an attribute"
		puts "[6] Delete a contact"
		puts "[7] Exit"
	end

	def main_menu
		puts "Welcome to #{@name}" #instance object is available within whole program
		while true
			print_main_menu
			input = gets.chomp.to_i # => 4
			choose_option(input)
			return if input == 7
		end
	end

	def choose_option(option)
		# => option = 4
		case option
		when 1 then add_contact
		when 2 then modify_contact
		when 3 then display_contacts
		when 4 then display_contact
		when 5 then display_attribute
		when 6 then delete_contact
		when 7
			puts "Goodbye!"
			return
		else
			puts "Incorrect option, try again."
		end
	end

	def add_contact
		puts "Provide Contact Details"

		print "First Name: "
		first_name = gets.chomp

		print "Last Name: "
		last_name = gets.chomp

		print "Email: "
		email = gets.chomp

		print "Note: "
		note = gets.chomp

		new_contact = Contact.new(first_name, last_name, email, note)
		@rolodex.add_contact(new_contact)
	end


# As a user, if 'modify' is selected, I am prompted to enter an id for the contact to be modified.
# As a user, when an id is entered, I am prompted to type 'yes' or 'no' to confirm my selection.
# As a user, if 'yes' is typed, I am prompted to change 'firstname', 'lastname', 'email' or 'notes' by number. You shouldn't be able to change the 'id'.
	def modify_contact
		puts "Please enter the id of the contact to modify: "
		id = gets.chomp.to_i
    # display_contact could use this method but how to retreive
    puts "Please confirm 'yes' or 'no' to modify this contact: "
    puts @rolodex.display_contact(id)
    answer = gets.chomp.downcase
    if answer == 'yes'
      puts "Please enter the number of the attribute you would like to edit: \n
      1. First Name \n
      2. Last Namme \n
      3. Email \n
      4. Note"
      option = gets.chomp.to_i
      puts "Please provide the edit:"
      new_attribute = gets.chomp
      @rolodex.modify_contact(id, option, new_attribute)
      puts "Edit complete: "
      puts @rolodex.display_contact(id)
    elsif answer == 'no'
      return
    else
      puts "That is not a valid answer, please try again."
    end
	end

	def display_contacts
    puts "All contacts: "
    puts
		puts @rolodex.display_contacts
	end

  def display_contact
    puts "Please enter an ID: "
    id = gets.chomp.to_i
    puts @rolodex.display_contact(id)
  end

# As a user, if 'display attribute' is selected, I am prompted to enter an attribute ('firstname', 'lastname', 'email', or 'notes') so that I can see all of the contacts according to that attribute.
	def display_attribute
    puts "Please enter an attribute: "
    attribute = gets.chomp
    @rolodex.display_attribute(attribute)
	end

  def delete_contact
    puts "Please provide the ID of the contact to delete: "
    id = gets.chomp.to_i
    @rolodex.delete_contact(id)
  end

end

bitmaker = CRM.new("Bitmaker Labs CRM")
personal = CRM.new("Personal CRM")
bitmaker.main_menu #calling the method to start the program
puts bitmaker.name