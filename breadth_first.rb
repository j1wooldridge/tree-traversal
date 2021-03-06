class Tree
  attr_accessor :payload, :children
  
  def initialize(payload, children)
    @payload = payload
    @children = children
  end
  
end
  
# The "Leafs" of a tree, elements that have no children
deep_fifth_node = Tree.new(5, [])
eleventh_node = Tree.new(11, [])
fourth_node   = Tree.new(4, [])
  
# The "Branches" of the tree
ninth_node = Tree.new(9, [fourth_node])
sixth_node = Tree.new(6, [deep_fifth_node, eleventh_node])
seventh_node = Tree.new(7, [sixth_node])
shallow_fifth_node = Tree.new(5, [ninth_node])
  
# The "Trunk" of the tree
trunk = Tree.new(2, [seventh_node, shallow_fifth_node])

class MyQueue
  def initialize
    @queue = []
  end
  
  def enqueue(item)
    @queue.push(item)
  end
  
  def dequeue
    @queue.shift
  end
end

def begin_breadth_first_search(tree_node, target_value)

  queue = MyQueue.new()
  queue.enqueue(tree_node)

  breadth_first_search(queue, target_value)
end

def breadth_first_search(queue, target_value)

  node = queue.dequeue
  puts node.payload

  return true if node.payload == target_value
  
  if node.children.count > 0 
    node.children.each do |c|
      queue.enqueue(c)
    end
  end

  breadth_first_search(queue, target_value)
end

puts 'Breadth first search:'
begin_breadth_first_search(trunk, 11)
