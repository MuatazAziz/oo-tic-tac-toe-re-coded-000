class TicTacToe
  #we will use tic-tac-toe-rb-re-coded-000 lab solution
  WIN_COMBINATIONS=[[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]] #we can put this line every where inside class
  def initialize
  @board=Array.new(9," ")
end
def board #we put this methode to define the getter insted of write @ before all boars below
  @board
end
def display_board
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
def move(location, current_player)
  board[location.to_i-1] = current_player
end
def position_taken?(index)
  if board[index]==" " || board[index]=='' || board[index]==nil
    return false
  elsif board[index]=="X" || board[index]=="O"
    return true
  end
end
def valid_move?(position)
   position.to_i.between?(1,9) && !position_taken?(position.to_i-1)
  end
  def turn
    puts "Please enter 1-9:"
    position=gets.strip
    if valid_move?(position)
      move(position,current_player)  #modified by adding current_player(board) becouse we omit "X above"
      display_board
    else
      turn
    end
  end

  def turn_count
  counter=0
   board.each do |position|
    if position=="X" || position=="O"
    counter+=1
  end
  end
  return counter
  end

  def current_player
    if turn_count%2==0 #we omit the space between count and %2==0
      return "X"
    else
    return "O"
  end
  end
  def won?
    WIN_COMBINATIONS.detect do |combo|
      board[combo[0]]==board[combo[1]]&&
      board[combo[1]]==board[combo[2]]&&
      position_taken?(combo[0])
    end
  end
  def full?
    board.all? do |item|
    item=="X" || item=="O"
  end
  end
  def draw?
  !won? && full?
  end
  def over?
    draw? || won?
  end
  def winner
    combo=won?
    if combo
      return board[combo[0]]
    end
  end
  def play
  while !over?
    turn
  end
  if won?
    puts "Congratulations #{winner}!"
  else
    puts "Cats Game!"
  end
  end
end
