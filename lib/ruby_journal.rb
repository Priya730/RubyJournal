class RubyJournal
	def initialize
		@entries = []
	end

	def write_entry
		puts "Write your diary entry (type exit to finish):"
		entry = ""

		loop do
			line = gets.chomp
			break if line.downcase == 'exit'
			entry += line +'\n'
		end

	@entries << {timestamp: Time.now, content: entry.chomp}
	puts "Entry saved successfully! \u{1F4D4}"
	end

	def read_entries
		if @entries.empty?
			puts "Your diary is empty. \u{1F4D6}"
		else
			puts "Diary Entries:"
			@entries.each_with_index do |entry, index|
				puts "#{index + 1}. #{entry[:timestamp]}:\n#{entry[:content]}\n\n"
			end
		end
	end
end

# Main Program
diary = RubyJournal.new

loop do
  puts "\nDiary App Menu:"
  puts "1. #{'Write an entry'.encode('utf-8')}"
  puts "2. #{'Read entries'.encode('utf-8')}"
  puts "3. #{'Exit'.encode('utf-8')}"
  print "Select an option (1-3): "

  choice = gets.chomp.to_i

  case choice
  when 1
    diary.write_entry
  when 2
    diary.read_entries
  when 3
    puts "Exiting Diary App. Goodbye! \u{1F44B}"
    break
  else
    puts "Invalid choice. Please enter 1, 2, or 3."
  end
end

