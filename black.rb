system 'clear'
puts "welcome to BlackJack game"
puts "My name is Griffin .Y "
puts "May i have your name?"


def welcome(player)
	
	puts "Nice to meet you, #{player}"
end



#--------------------------play again--------------------------------
def play_more(more_game)
	puts "play again? "
	puts "type 1 to keep playing , any key to leave!"
	again_play = gets.chomp
	if again_play == '1'
		system 'clear'
	play(more_game)
		
	end
end

def play(name)
puts "#{name}, I'm your dealer today,would you like to play the game of blackjcak?"
puts "1)Yes 2)No (1 or 2)"
	
#---------------------------------choose------------------------------
	while true
		play_game = gets.chomp  
		puts "not correct choose" if !['1','2'].include?(play_game)
			
			
		if play_game == '1'
			puts "are you ready?"
			dealing('1')
			break
		elsif play_game == '2'
			exit
		end
		next
	end
end
#---------------------------------dealing-----------------------
def dealing(play_game)
	player = []
	dealer = []
	suit = ['♡','♢','♤','♧']
	card = ['2','3','4','5','6','7','8','9','10','J','Q','K','A']
	suit = suit.product(card)
	deal = suit.shuffle!
	player << deal.pop
		dealer << deal.pop
	player << deal.pop
		dealer << deal.pop
		new_deal = deal
	player_total = total_value(player)
	dealer_total = total_value(dealer)
	if play_game == '1'
		puts "this is dealers #{dealer} "
		
		puts "this is players #{player} total is #{player_total}"
		compare(player, dealer, player_total,dealer_total,new_deal)
	else

	
		deal_turn(player, dealer, player_total,dealer_total,new_deal,name)
	end
	

end
#--------------------------------compare------------------------------------
def compare(player, dealer, player_total,dealer_total,new_deal)
	while player_total < 21
		puts "would you like to hit or stay?"
		puts "1) Hit  2)Stay"
		hit_or_stay = gets.chomp
		#h_o_t = hit_or_stay
		
		puts "choose one please!" if !['1','2'].include?(hit_or_stay)
			if hit_or_stay == '1'
				#new_card = new_deal  
				player << new_deal.pop
				puts "Players cards #{player}"
				player_total = total_value(player)
				puts "Players value #{player_total}"
				
				if player_total >21 
					puts "oh, looks you busted"
					play_more('')
					break
				elsif player_total == 21
					puts "your turn now!"

					deal_turn(player, dealer, player_total,dealer_total,new_deal)

				end

			elsif hit_or_stay == '2'
				puts "dealers turn"
				deal_turn(player, dealer, player_total,dealer_total,new_deal)
				break
				
			end

		next

	end
end
#-----------------------DEALER TURN-------------------------
def deal_turn(player, dealer, player_total,dealer_total,new_deal)

	while dealer_total < 21	
		
			if dealer_total < 17 
				
				dealer << new_deal.pop
				puts "dealers cards #{dealer}"
				dealer_total = total_value(dealer)
				puts "dealers value #{dealer_total}"
				
					if dealer_total > 21
						puts "oh!no! I'm busted! you win!"
						play_more('')
						break

					elsif dealer_total >= player_total
						puts "are you ready to show your card?"
						sleep 2
						puts "dealer win "
						puts "dealer cards #{dealer}"
						play_more('')
						break
					end
					
				
			elsif dealer_total >= 17
			 	puts dealer_total >= player_total ? "you lost" : "dealer lost"
			 	puts "dealers value #{dealer_total}"
			 	play_more('')
			 	break
				
			end

		next
	end	
end
#-----------------------DEALER HOLD BLACKJACK---------------
def dealer_hold_blackjack
		
	while dealer_total == 21
		puts "dealer win"
		puts "would you like to play again?"
		puts "1)Yes  2)No "
		again_or_not = gets.chomp
		puts "please!answer that!" if !['1','2'].include?(again_or_not)
			if again_or_not == '1'
				play_again
			
			
			elsif again_or_not == '2'
				puts "thanks to play game, bye bye!"
				exit
			end

		next
	end
end
	
#----------------count total value--------------------
def total_value(number)
		pick  =  number.map{|e| e[1]}
		tal = 0
		pick.each do |value|
			if value == 'J'||value =='Q'|| value == 'K'
				tal += 10 
			elsif value == 'A'
				tal += 11
			elsif value.to_i != 0
				tal += value.to_i
			end		
			

			if value == 'A' && tal >21
				tal -= 10
			end

		end
		tal
end


name = gets.chomp
welcome(name)
play(name)





















