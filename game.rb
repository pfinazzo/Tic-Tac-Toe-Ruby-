class Game

  attr_accessor :turn, :board, :tie, :winner
  $possibleAnswers = ["a1", "a2", "a3", "b1", "b2", "b3", "c1", "c2", "c3"]
  $selectedAnswers = []


  def initialize
    puts "" 
    puts "" 
    puts " NEW GAME"
    $possibleAnswers = ["a1", "a2", "a3", "b1", "b2", "b3", "c1", "c2", "c3"];
    @board = {} 
    @turn = "X"
    @winner = false
    @tie = false
    print_board 
  end 


  def print_board 
    puts           "      A         B         C
1) #{@board[:a1]}        |  #{@board[:b1]}       | #{@board[:c1]}
-------------------------------
2) #{@board[:a2]}        | #{@board[:b2]}        | #{@board[:c2]}
-------------------------------
3) #{@board[:a3]}        | #{@board[:b3]}        | #{@board[:c3]}
-------------------------------"
    prompt_turn
  end

  def checkWin 
    if @board[:a1] != nil && @board[:a1] == @board[:a2] && @board[:a1] == @board[:a3]
      print "#{@board[:a1]} is winner"  
      @winner = true 
    elsif @board[:b1] != nil && @board[:b1] == @board[:b2] && @board[:b1] == board[:b3] 
      print "#{@board[:a1]} is winner"
      @winner = true
    elsif @board[:c1] != nil && @board[:c1] == @board[:c2] && @board[:c1] == @board[:c3]
      print "#{@board[:c1]} is winner"
      @winner = true
    elsif @board[:a1] != nil && @board[:a1] == @board[:b2] && @board[:a1] == @board[:c3]
      print "#{@board[:a1]} is winner"
      @winner = true
    elsif @board[:a3] != nil && @board[:a3] == @board[:b2] && @board[:a3] == @board[:c1]
      print "#{@board[:a3]} is winner"
      @winner = true
    elsif @board[:a3] != nil && @board[:a3] == @board[:b3] && @board[:a3] == @board[:c3]
      print "#{@board[:a3]} is winner"
      @winner = true
    elsif @board[:a2] != nil && @board[:a2] == @board[:b2] && @board[:a2] == @board[:c2]
      print "#{@board[:a2]} is winner"
      @winner = true
    elsif @board[:a1] != nil && @board[:a1] == @board[:b1] && @board[:a1] == @board[:c1]
      print "#{@board[:a1]} is winner"
      @winner = true
    elsif $possibleAnswers == [];
      print "TIE GAME"
    else 
      return
    end
  end

  def prompt_turn 
    until @winner == true || @tie == true
      print "#{@turn}'s turn "
      answer = gets.chomp.downcase
      if $possibleAnswers.include? answer
        @board[answer.to_sym] = @turn
        $selectedAnswers.push(answer)
        $possibleAnswers.delete(answer)
        checkWin
        restart
        print_board
      else  
        print "Bogus Answer!"
      end
    end
    restart
  end

  def switchTurn 
    @turn == "X" ? @turn = "O" : @turn = "X"
  end
  
  def restart 
    if (@winner == true || @tie == true) ? initialize : switchTurn
  end

  end
end