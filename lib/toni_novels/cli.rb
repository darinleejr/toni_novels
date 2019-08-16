class ToniNovels

    def call
      puts "Welcome to Toni Morrison's Bookstore!"
      list_books
      menu
      goodbye
    end

    def list_books
      puts "List of Novels:"
      puts <<~DOC
        1. Beloved by Toni Morrison - $32.00
        2. Sula by Toni Morrison - $19.84
        3. The Bluest Eyes by Toni Morrison - $19.43
      DOC
      @allbooks = ToniNovels::AllBooks.now
    end

    def menu
      puts "Enter the number of the book you would like more info on or type list to list books or type exit to exit page:"
      input = nil
      while input != "exit"
        input = gets.strip.downcase

        case input
        when "1"
          puts "More info on deal 1..."
        when "2"
          puts "More info on deal 2..."
        when "3"
          puts "More info on deal 3..."
        when "list"
          list_books
        else
          puts "Type 1-3, list, or exit. Please."
        end
      end
    end

    def goodbye
      puts "Didn't find what you were looking for? Well come back and visit some time soon for more Toni Morrision Books!"
    end

end
