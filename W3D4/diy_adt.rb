class Stack
    attr_reader :stack
    
    def initialize
        # create ivar to store stack here!
        @stack = []
    end

    def push(el)
        # adds an element to the stack
        @stack.push(el)
    end

    def pop
        # removes one element from the stack
        @stack.pop
    end

    def peek
        # returns, but doesn't remove, the top element in the stack
        @stack.last
    end
end

# a = Stack.new
# p a.stack
# (0..4).each { |n| a.push(n) }
# p a.stack 
# p "peeking: #{a.peek}"
# p "popping off #{a.pop} from #{a.stack} and #{a.pop} from #{a.stack}"

class Queue
    attr_reader :queue
    
    def initialize
        @queue = []
    end

    def enqueue(el)
        @queue.unshift(el)
    end

    def dequeue
        @queue.pop
    end

    def peek 
        @queue.last
    end

end

# q = Queue.new 
# p q.queue
# (0..4).each { |n| q.enqueue(n) }
# p q.queue
# p "peeking: #{q.peek}"
# p "dequeuing off #{q.dequeue} from #{q.queue} and #{q.dequeue} from #{q.queue}"

# As you saw in the videos for tonight, a map can be implemented using a 2D array. Let's write a Map class (following a similar pattern to Stack and Queue) that implements a map using only arrays.

# Remember, a map stores information in key-value pairs, where the keys are always unique. When implemented with arrays, a map might look something like this: my_map = [[k1, v1], [k2, v2], [k3, v2], ...].

# Our Map class should have the following instance methods: set(key, value), get(key), delete(key), show. Note that the set method can be used to either create a new key-value pair or update the value for a pre-existing key. It's up to you to check whether a key currently exists!

class Map 
    def initialize
        @map = []
    end

    def set(key, val)
        occurances = @map.count { |pair| pair.first == key}
        if occurances == 0
            @map << [key, val] 
        else
            self.delete(key)
            @map << [key, val] 
        end

    end

    def get(key)
        pair = @map.select { |pair| pair.first == key }
        return pair.last.last
    end

    def delete(key)
        @map.delete_if { |pair| pair.first == key }
    end

    def show
        @map
    end
end

hash = Map.new 
puts "hash is empty: #{hash.show}"
hash.set("a", 1)
puts "set a=>1 #{hash.show}"
hash.set("b", 2)
puts "set b=>2 #{hash.show}"
hash.set("b", 3)
puts "set b=>3 #{hash.show}"
p hash.get("a")
hash.delete("a")
puts "deleted a #{hash.show}"
