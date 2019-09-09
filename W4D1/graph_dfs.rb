require "set"

class GraphNode
    attr_reader :value, :neighbors

    def initialize(value)
        @value = value
        @neighbors = []
    end

    def neighbors=(arr)
        @neighbors = arr
    end

    def inspect
        "value: #{@value}" #, neighbors: #{@neighbors}
    end

end

a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]
# p a
# p b
# p c
# p d
# p e

def dfs(starting_node, target_value, visited = Set.new())
    visited << starting_node
    return starting_node if starting_node.value == target_value

    starting_node.neighbors.each do |neighbor|
        if !visited.include?(neighbor)
            dfs(neighbor, target_value, visited)
        end
    end

    nil
end

# p dfs(a, "b") 

def bfs(starting_node, target_value)
    queue = Queue.new.enq(starting_node) 
    
    until queue.empty?
        current_node = queue.deq
        return current_node if current_node.value == target_value
        current_node.neighbors.each do |neighbor|
            queue.enq(neighbor)
        end
    end
    
end

p bfs(a, "b") 