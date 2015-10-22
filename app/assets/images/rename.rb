require 'pry'

class Something
def rename

  x = 1
  suit = ['club', 'spade', 'heart','diamond']
  while x <= 52
    if x < 16
      rank = ['A','K','Q','J']
      suit.each do |card|

        file = File.path("/#{x}.png") 
        # binding.pry
          File.rename("#{x}.png","#{rank.shift}_of_#{card}.png")  
          x+=1     
      end
    end   
  end 
end
end
something = Something.new
something.rename