class PolyTreeNode
    attr_reader :parent, :children, :value
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent)
        #if node has child - 
        #reassign the child to a new parent 
        #we remove the child from parent and add to the new parent 
        
       if self.parent == new_parent #self = child node 
        return self 
       elsif !self.parent.nil?
         self.parent.children.delete(self)
         @parent = new_parent
         self.parent.children << self unless new_parent == nil

       elsif self.parent.nil?
        @parent = new_parent 
        #  == parent 
        self.parent.children << self unless new_parent == nil #add children to the new parent 
        self
       end
        
    end

    def add_child(child)
        child.parent = self
    end
    def remove_child(child)
        if self != child && !self.children.include?(child)
            raise "not a child"
        else
            child.parent = nil 
        end
    end 

    def dfs(target)
        return self if self.value == target 
        self.children.each do |child|
            result = child.dfs(target)
            return result unless result == nil 
        end
        nil
    end
    

    def bfs(target)

        queue = [self]
        until queue.empty?
            new_node = queue.shift 
            return new_node if new_node.value == target 
            queue += new_node.children
        end
        nil 
    end

   

end #! end of code
#[[1,2,3],1,2,3]c




    #return node if node == target
    # iterate over children node.children.each do |child|
    # resault = dfs(child, target) unless result.nil?
    #end
