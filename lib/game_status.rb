# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Diagonal top-bottom
  [6,4,2]  # Diagonal bottom-top
  ]
  
#won?
def won?(board)
  #iterate through all WIN_COMBINATIONS
  WIN_COMBINATIONS.each do |combo|
    win_index_1 = combo[0]
    win_index_2 = combo[1]
    win_index_3 = combo[2]
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combo
    end
  end
  return false  
end
  
 
#full?
def full?(board)
  count = 0
  while count < 9
    if position_taken?(board,count) == false
      return false
    end
    count += 1
  end
return true  
end
  
#draw?
def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end
  
#over?
def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  else
    return false    
  end
end
  
#winner
def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else 
    return nil
  end
end