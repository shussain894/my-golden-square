class TodoList
  def initialize
    @todo_list = []
  end

  def add(todo) # todo is an instance of Todo
    # Returns nothing
    @todo_list << todo 
  end

  def incomplete
    # Returns all non-done todos
    fail "entries cannot be empty" unless !@todo_list.empty?
    @todo_list
  end

  def complete
    # Returns all complete todos
    fail "entries cannot be empty" unless !@todo_list.empty?
    entries = []
    @todo_list.each do |entry|
      if entry.done? == true
        entries << entry
      end 
    end
    entries 

    # if @todo_list[0].done? == true 
    #   return @todo_list[0]
    # end 
  end

  def give_up!
    # Marks all todos as complete

    @todo_list.each do |entry|
      entry.mark_done!
    end 
  end
end
