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

	def modify_contact
		puts "Which contact would you like to modify?"
		id = gets.chomp

		# contact = Contact.new(first_name, last_name, email, note)
		# @rolodex.add_contact(new_contact)
	end

	def display_contacts
    puts "All contacts: "
    puts
		@rolodex.display_contacts
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
    puts @rolodex.display_attribute(attribute)
	end

end

bitmaker = CRM.new("Bitmaker Labs CRM")
personal = CRM.new("Personal CRM")
bitmaker.main_menu #calling the method to start the program
puts bitmaker.name