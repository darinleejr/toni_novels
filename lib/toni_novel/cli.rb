class ToniNovels

    def call
      puts "Welcome to Toni Morrison's Bookstore!"
      list_novels
      menu
      goodbye
    end

    def list_novels
      puts "List of Novels:"
      # puts <<~DOC
      #   1. Beloved by Toni Morrison - $32.00
      #   2. Sula by Toni Morrison - $19.84
      #   3. The Bluest Eyes by Toni Morrison - $19.43
      # DOC

      require_relative './all-books'
      @allnovels = AllNovels.today
      @allnovels.each_with_index() do |novel, i|
        puts "#{i}. #{novel.name} - #{novel.price} - #{novel.availability}"
      end
    end

    def menu
      puts "Enter the number of the book you would like more info on or type list to list books or type exit to exit page:"
      input = nil
      while input != "exit"
        input = gets.strip.downcase

        if input.to_i > 0
          the_novel = @allnovels[input.to_i-1]
          puts "#{i}. #{novel.name} - #{novel.price} - #{novel.availability}"
        elsif input == "list"
          list_novels
        elsif input != "exit"
          puts "Options: Type 1-3, list, or exit. Please."

        # case input
        # when "1"
        #   puts "More info on deal 1..."
        # when "2"
        #   puts "More info on deal 2..."
        # when "3"
        #   puts "More info on deal 3..."
        # when "list"
        #   list_books
        # else
        #   puts "Options: Type 1-3, list, or exit. Please."
        #
        end
      end
    end

    def goodbye
      puts "Didn't find what you were looking for? Well come back and visit some time soon for more Toni Morrision Books!"
    end
end
