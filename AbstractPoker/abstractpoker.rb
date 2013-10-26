def classify_poker_hand(poker_hand)

	poker_hand.each do |a|
		if a.class != Fixnum
			return :at_least_one_card_is_not_an_integer
		end
		if (a > 1000)
			return :at_least_one_card_is_out_of_bounds
		end
		if (a.to_i != a)
			return :at_least_one_card_is_not_an_integer
		end
	end
	
	if (poker_hand.class != Array)
		return :not_a_ruby_array
	end

	@sortate = poker_hand.sort
	
	if (@sortate[0] == @sortate[4])
		return :impossible_hand
	end
	if (find_group(@sortate,2) == -1 && @sortate[0] + 4 == @sortate[4])
			return :straight
	end
	if (@sortate.size > 5 || @sortate.size < 5)
		return :too_many_or_too_few_cards
	end
	@sortate.each do |a|
		
		@pozitie = find_group(@sortate, 4)		
		if (@pozitie != -1)
			return :four_of_a_kind
		end

		@pozitie = find_group(@sortate, 3)		

		if (@pozitie != -1 && find_group(@sortate[@pozitie..(@sortate.size-1)], 2) != -1)
			return :full_house
		end

		if (@pozitie != -1)
			return :three_of_a_kind
		end

		@pozitie = find_group(@sortate, 2)
		if ( @pozitie != -1 && find_group(@sortate[@pozitie..(@sortate.size-1)], 3) != -1)
			return :full_house
		end
		if ( @pozitie != -1 && find_group(@sortate[@pozitie..(@sortate.size-1)], 2) != -1)
			return :two_pairs
		end
		
		if (@pozitie != -1)
			return :one_pair
		end
		
		if (@pozitie == -1 && @sortate[@sortate.index(a)] + 2 == @sortate[@sortate.index(a) + 2])
			return :high_card
		end
				

	end
	return :valid_but_nothing_special	
end

def find_group(vsort, nr)
	vsort.each do |a|
		poz =  vsort.index(a)
		if vsort[vsort.index(a)+nr-1] == a
			return poz + nr - 1
		end
	end
	return -1
end

