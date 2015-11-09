class HangpersonGame
       attr_accessor :word , :guesses, :wrong_guesses
  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

 
  
  def initialize(word)
       @word = word
       @guesses = ''
       @wrong_guesses = ''
       @guess = ''
       @displayed = ''
       
       1.upto(word.length) do
            @displayed += "-"
       end
  end
  
  def guess(char) 
      
       case char 
       when '', nil,/[^a-z]/i  then raise ArgumentError
       end    
      
       char.downcase!
       
       if @wrong_guesses.include?(char)         
             return false
    
       elsif word.include?(char) and word.count(char)>guesses.count(char)
              @guesses += char
              @displayed = word_with_guesses
              
       elsif word.include?(char) and word.count(char)<=guesses.count(char)
              false
              
       else
             @wrong_guesses << char
       end
           
  end 
      
 
        
   

  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://watchout4snakes.com/wo4snakes/Random/RandomWord')
    Net::HTTP.post_form(uri ,{}).body
  end
  
def word_with_guesses
      i = 0
      @word.each_char do |char|
           if @guesses[-1] == char
               @displayed[i] = char
              
           end
           i += 1
      end
     @displayed
end



def check_win_or_lose
   
    if @word.length == @guesses.length
        :win
    elsif wrong_guesses.length == 7
        :lose
    else
        :play
    end
end

end
