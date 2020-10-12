require_relative "./00_tree_node.rb"
require "byebug"
class KnightPathFinder
    attr_reader :starting_pos, :considered_positions 
    attr_accessor :root_node
    POSSIBLE_MOVES = 
        [
            [-1,-2],
			[-2,-1],
			[-2,+1],
			[-1,+2],
			[+1,-2],
			[+2,-1],
			[+2,+1],
            [+1,+2]
        ]
            

    

    def self.valid_moves(pos)
        all_moves = []
        row, col = pos 
        POSSIBLE_MOVES.each do |move|
            x = row + move[0]
            y = col + move[1]
            all_moves << [x, y] if x.between?(0, 7) && y.between?(0, 7)
        end
        all_moves 
    end


    def initialize(starting_pos)
        @starting_pos = [0,0]
        @considered_positions = [starting_pos]
        @root_node = PolyTreeNode.new(starting_pos)
        build_move_tree
    end 

    def new_move_positions(pos) #return value of valid moves 
        # if !self.considered_positions.include?() && KnightPathFinder.valid_moves(pos)
        #     @considered_positions << pos
        # end
        result = KnightPathFinder.valid_moves(pos)
        result.select!{|new_pos| !considered_positions.include?(new_pos)} #only include valid_moves that not been considered
        result.each{|new_pos| considered_positions << new_pos}
    end

    def build_move_tree
        queue = [root_node]
        until queue.empty?
            new_node = queue.shift

             #new_pos "c" = new_node.value = 2
            new_move_positions(new_node.value).each do |pos|
                another_node = PolyTreeNode.new(pos) #child?  
                # new_node.add_child(another_node)
                # debugger
                new_node.add_child(another_node) #parent
                queue << another_node # the return value from add child 
            end
         end
    end

    def find_path(end_pos) #dfs, bfs
        # debugger
       last_node = root_node.bfs(end_pos)

       trace_path_back(last_node)
    end

    def trace_path_back(last_node) #PloyTreeNode.parent
        arr = []
        node = last_node
        until node.nil? 
            # debugger
            arr << node.value 
            next_node = node.parent 
            node = next_node 
        end
        arr.reverse

    end



end #!end of code



# [[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7],
#  [1, 0], [1, 1], [1, 2], [1, 3], [1, 4], [1, 5], [1, 6], [1, 7],
#  [2, 0], [2, 1], [2, 2], [2, 3], [2, 4], [2, 5], [2, 6], [2, 7],
#  [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5], [3, 6], [3, 7],
#  [4, 0], [4, 1], [4, 2], [4, 3], [4, 4], [4, 5], [4, 6], [4, 7],
#  [5, 0], [5, 1], [5, 2], [5, 3], [5, 4], [5, 5], [5, 6], [5, 7],
#  [6, 0], [6, 1], [6, 2], [6, 3], [6, 4], [6, 5], [6, 6], [6, 7],
#  [7, 0], [7, 1], [7, 2], [7, 3], [7, 4], [7, 5], [7, 6], [7, 7]]

k = KnightPathFinder.new([0,0])
# p k.build_move_tree

# p KnightPathFinder.valid_moves([3,3])
# p k.new_move_positions([3,3])
# p k.considered_positions
# p k 
p k.find_path([6,2])