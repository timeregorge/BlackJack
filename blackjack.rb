
	
	puts "Welcome to Tricky Gambling House!"

	puts "my name is Vincent , your dealer, what should I call you ?"
	guest = gets.chomp
	puts "ok <#{guest}> nice to meet you, to day we're going to play the game of blackjack!"
	puts "do you understand that rules? 1) Yes  2)No"
	def welcome(name)

	
	
		while true
			responds = gets.chomp
			break  puts "ok <#{name}> we're getting start" if responds == '1'
			

			puts "didn't catch that!" if !['1' , '2'].include?(responds)
				
			if responds =='2'
				system 'clear'
				puts "please read the rule of blackjack"
				
				load 'rules.rb'
				puts "typing enter to continue"
				responds = gets.chomp
				system 'clear'
				puts "do you understand that rules? 1) Yes  2)No"
				break  welcome(name)	if responds == ''
				
			end

		end
	
	end

welcome(guest)
def total_value(cards)
		arr = cards.map{|e| e[1]}

		total = 0
		
		arr.each do |value| 
			if value == 'A'
				total += 11
			elsif value.to_i == 0
				total += 10
			else
				total += value.to_i
			end
		end

		arr.select {|e| e == 'A'}.count.times do 
			total -= 10 if total > 21
		end

	total
end

	suit = ['♡', '♢', '♤', '♧']
	card = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K']

	poke = suit.product(card)

	poke = poke.shuffle!

	my_card = []
	
	dealer_card = []
	
	my_card << poke.pop
	
	dealer_card << poke.pop
	
	my_card << poke.pop
	
	dealer_card <<poke.pop
	
	my_card_total = total_value(my_card)
	dealer_card_total = total_value(dealer_card)
	hide_card = "[█]"
	puts "your cards are #{my_card} and value is #{my_card_total}"
	puts "dealer cards are  #{dealer_card[0]}, #{hide_card}"
	
	
	while my_card_total < 21
		puts "you busted" if my_card_total > 21
		puts "1)stay  2)hit"
		choice = gets.chomp
		puts "you have to make a choice!" if  !['1' , '2'].include?(choice) 	
		
				if choice == '2'
					hit = poke.pop
					my_card_total < 21 
					my_card << hit
					my_card_total = total_value(my_card)
					puts "your cards are #{my_card}"
					
					if my_card_total > 21
						puts "busted"
						break
					end
		
				elsif my_card_total > 21
						puts "you Busted"
					break 


					
				end
				
				if choice == '1'
				puts "you choice stay"

				break
				end
				
				
	end



	while dealer_card_total < 17
		
		hit_deal = poke.pop
		dealer_card << hit_deal
		dealer_card_total = total_value(dealer_card)
		puts "dealer cards #{dealer_card}"

		if dealer_card_total > 21
			
			puts "dealer busted"
		break
		
		elsif dealer_card_total == 21
			puts "dealer win"
		end
end



if dealer_card_total > 21

	puts "dealer busted"
elsif my_card_total > 21
	puts "you busted"

elsif dealer_card_total >= my_card_total
	puts "you LOST dealer WIN"
	puts "dealer => #{dealer_card}"
	puts "your   => #{my_card}"
else
	puts "dealer LOST, you WIN"
	puts "dealer => #{dealer_card}"
	puts "your   => #{my_card}"
end



while true
	puts "play again?"
	puts "1) Yes  2)No"
	play = gets.chomp

	puts "--please 1 or 2--" if !['1','2'].include?(play)

	if play == '1'
		welcome(guest)
	elsif play == '2'
		puts "ok, thans to play ! see you soon!"
		break
	end

end

















