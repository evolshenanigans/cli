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
