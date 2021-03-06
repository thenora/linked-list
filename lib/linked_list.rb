
# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node

  def initialize(value, next_node = nil)
    @data = value
    @next = next_node
  end
end

# Defines the singly linked list
class LinkedList
    def initialize
      @head = nil # keep the head private. Not accessible outside this class
    end

    # method to add a new node with the specific data value in the linked list
    # insert the new node at the beginning of the linked list
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def add_first(value)
      @head = Node.new(value, @head)
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def search(value)
      if @head.nil?
        return false
      end

      current = @head

      while current != nil
        if current.data == value
          return true
        end
        current = current.next
      end

      return false
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_max
      if @head.nil?
        return nil
      end

      max = @head.data
      current = @head
      while current != nil
        if max < current.data
          max = current.data
        end

        current = current.next
      end

      return max
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_min
      if @head.nil?
        return nil
      end

      min = @head.data
      current = @head
      while current != nil
        if min > current.data
          min = current.data
        end

        current = current.next
      end

      return min
    end


    # method that returns the length of the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def length
      if @head.nil?
        return 0
      end

      length = 0
      current = @head
      while current != nil
        length += 1
        current = current.next
      end

      return length
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: o(n)
    # Space Complexity: o(1)
    def get_at_index(index)
      if @head.nil?
        return nil
      end

      count = 0
      current = @head
      while current != nil
        if count == index
          return current.data
        end
        count += 1
        current = current.next
      end

      return nil
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def visit
      if @head.nil?
        return
      end

      current = @head
      while current != nil
        p current.data
        current = current.next
      end

      return
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def delete(value)
      if @head.nil?
        return
      end

      if @head.data == value
        @head = @head.next
        return
      end

      previous = nil
      current = @head
      while current != nil
        if current.data == value
          previous.next = current.next
          current = nil
          return
        end

        previous = current
        current = current.next
      end

      return
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def reverse
      if @head.nil?
        return
      end

      current = @head
      previous = nil

      while current != nil
        temp = current.next
        current.next = previous
        previous = current
        current = temp
      end

      @head = previous
      return
    end


    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_middle_value
      if @head.nil?
        return
      end

      slow = @head
      fast = @head.next
      while fast != nil
        slow = slow.next
        fast = fast.next
        if fast != nil
          fast = fast.next
        end
      end

      return slow.data
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_nth_from_end(n)
      if @head.nil?
        return
      end

      back = @head
      front = @head
      count = 1
      while front != nil
        front = front.next
        count += 1
        if front > n
          back = back.next
        end
      end

      return back.data
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity: ?
    # Space Complexity: ?
    def has_cycle
      if @head.nil?
        return
      end

      slow = @head
      fast = @head.next
      while fast != nil
        slow = slow.next
        fast = fast.next
        if fast != nil
          fast = fast.next
        end
        if fast == slow
          return true
        end
      end

      return false
    end


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def get_first
      return @head.data if @head != nil
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def add_last(value)

      current = @head
      newNode = Node.new(value, nil)
  
      if current.nil?
        @head = newNode
      else
        until current.next.nil?
          current = current.next
        end
        current.next = newNode
      end
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: O(n)
    # Space Complexity: O(n)
    def get_last
      if @head.nil?
        return nil
      else 
        current = @head
        until current.next.nil?
          current = current.next
        end
      end
      return current.data
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity: ?
    # Space Complexity: ?
    def insert_ascending(value)
      raise NotImplementedError
    end

    # Helper method for tests
    # Creates a cycle in the linked list for testing purposes
    # Assumes the linked list has at least one node
    def create_cycle
      return if @head == nil # don't do anything if the linked list is empty

      # navigate to last node
      current = @head
      while current.next != nil
          current = current.next
      end

      current.next = @head # make the last node link to first node
    end
end
