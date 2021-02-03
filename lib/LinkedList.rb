class Node
  attr_accessor :value, :next
  def initialize( value = nil, next_node = nil)
    @value = value
    @next = next_node
  end
end

class LinkedList
  attr_accessor :name
  attr_reader :head, :tail
  def initialize(name = nil)
    @name = name
    @head = nil
    @tail = nil
  end

  def append(value, node = @head) # end of list
    return prepend(value) unless node
     
    node.next ?
      append(value, node.next) :
      node.next = Node.new(value, nil)

    self # returns
  end

  def prepend(value) # start of list
    @head = Node.new(value, @head)
    self # returns
  end
  
  def size(sum = 0, node = @head) # all nodes
    node ? size( sum + 1, node.next) : sum

    #returns Integer
  end
  
  def at(index, node = @head) # node at index
    index == 0 ? node : at( index - 1, node.next)

    # returns node
  end
  
  def pop # remove last added
    @head = head.next
    self # returns
  end
  
  def contains?(search, node = @head) # true only if at least 1
    return false unless node

    node.value == search ?
      true :
      contains?(search, node.next)

    # returns Boolean
  end
  
  def find(search, index = 0, node = @head) # index of first match
    return -1 unless node

    node.value == search ? 
      index :
      find(search, index + 1, node.next)

    # returns Node
  end
  
  def to_s(string = '', node = @head) # self to string
    return 'nil' unless node

    string += "( #{node.value} ) - > "
    node.next ?
      to_s(string, node.next) :
      "#{string}( nil )"

    # returns String
  end
  
  def insert_at(value, index) # insert at node
    return self.prepend(value) if index.zero?

    prev_node = at(index - 1)
    prev_node.next = Node.new(
      value, prev_node.next)
    self # returns
  end
  
  def remove_at(index) # delete at index
    return self.pop if index.zero?

    prev_node = at(index - 1)
    prev_node.next = prev_node.next.next
    self # returns
  end
end
