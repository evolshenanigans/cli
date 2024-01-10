class Task
  attr_accessor :description, :completed

  def initialize(description)
    @description = description
    @completed = false
  end

  def mark_as_completed
    @completed = true
  end
end

class ToDoList
  attr_reader :tasks

  def initialize
    @tasks = []
  end

  def add_task(description)
    task = Task.new(description)
    @tasks << task
  end

  def list_tasks
    @tasks.each_with_index do |task, index|
      status = task.completed ? "[X]" : "[ ]"
      puts "#{index + 1}. #{status} #{task.description}"
    end
  end

  def mark_task_completed(index)
    task = @tasks[index]
    task.mark_as_completed if task
  end
end

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

CLI.new.start
