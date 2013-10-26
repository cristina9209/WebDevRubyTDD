def compute_row(n)
	if(n.class != Fixnum)
		return nil
	end
	if (n == 1)
 		return [1]
 	end
 	if (n == 2)
 		return [1,1]
 	end
 	
 	@par = 1
 	@aux1 = [1,1]
 	@aux2 = []
 	(n-2).times do
 		if (@par == 1)
 			@aux2.clear
 			@aux2 << 1;
	 		@aux1.each_index do |i|
	 			if i < @aux1.size - 1
	 				@aux2 << @aux1[i] + @aux1[i+1]
	 			end
	 		end
	 		@aux2 << 1;
	 		#puts @aux2
 			@par = 0
 		else
 			@aux1.clear
 			@aux1 << 1;
 			@aux2.each_index do |i|
	 			if i < @aux2.size - 1
	 				@aux1 << @aux2[i] + @aux2[i+1]
	 			end
	 		end
	 		@aux1 << 1;
	 		#puts @aux1
 			@par = 1
 		end
 	end
 	
 	if (@par == 1)
 		return @aux1
 	end
	return @aux2
end

