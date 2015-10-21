require_relative 'contact'

module Controller
  def welcome
    puts <<-EOP

     ===================================================
    |           Welcome to Contact Manager              |
    | Never remember things you should know ever again! |
     ===================================================

    EOP
    main_menu
  end

  def main_menu
    puts <<-EOP
                         Main Menu\n
      Please choose from the following options:
      1: (C)reate contact
      2: (U)pdate contact
      3: (D)elete contact
      4: (L)ist all contacts
      5: (E)xit
    EOP
    user_choice
  end

  def user_choice
    choice = gets.chomp.downcase
    case
    when choice == "c" || choice === "1"
      create_contact
    when choice == "u" || choice == "2"
      update_contact
    when choice == "d" || choice == "3"
      delete_contact
    when choice == "l" || choice == "4"
      list_contacts
    when choice == "e" || choice == "5"
      exit_nicely
    else
      puts "You have not selected a valid choice, try again"
      main_menu
    end
  end

  def create_contact
    puts "What is the first name of the contact?"
    first_name = gets.chomp.capitalize
    puts "What is the last name of the contact?"
    last_name = gets.chomp.capitalize
    puts "What is the email of the contact?"
    email = gets.chomp.downcase
    until email.include?("@") && email.include?(".")
      puts "Not a valid email format, please try again"
      email = gets.chomp.downcase
    end
    puts "What is the phone number of the contact?"
    phone = gets.chomp
    until phone == phone.to_i.to_s && phone.size > 6
      puts "Not a valid phone number format, please use at least 7 numerical characters only."
      phone = gets.chomp
    end
    Contact.new(first_name, last_name, email, phone)
    main_menu
  end

  def exit_nicely
    puts "Thank you for using Contact Manager"
  end
end

include Controller
Controller.welcome
