require_relative 'task'
require_relative 'todo_list'


class CLI
  def initialize
    @todo_list = ToDoList.new
  end

  def start
    puts "Welcome to the To-Do List Manager!"
    loop do
      puts "\nMenu:"
      puts "1. Add Task"
      puts "2. List Tasks"
      puts "3. Mark Task as Completed"
      puts "4. Exit"
      print "Select an option: "
      choice = gets.chomp.to_i

      case choice
      when 1
        print "Enter task description: "
        description = gets.chomp
        @todo_list.add_task(description)
        puts "Task added successfully."
      when 2
        puts "Tasks:"
        @todo_list.list_tasks
      when 3
        print "Enter the task number to mark as completed: "
        index = gets.chomp.to_i - 1
        @todo_list.mark_task_completed(index)
        puts "Task marked as completed."
      when 4
        puts "Goodbye!"
        break
      else
        puts "Invalid choice. Please select a valid option."
      end
    end
  end
end

if __FILE__ == $0
  CLI.new.start
end
