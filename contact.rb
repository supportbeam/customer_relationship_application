class Contact
  attr_accessor :id, :first_name, :last_name, :email, :note
  #sets up a getter and a setter
  #attr_reader :id #can only read but not change/write it

  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end

  def to_s
   "Name: #{@first_name} #{@last_name} \n Email: #{@email} \n  Note: #{@note} \n ID: #{@id}"
  end

end