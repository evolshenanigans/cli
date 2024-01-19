require 'minitest/autorun'
require './CLI'


class TestTask < Minitest::Test
  def setup
    @task = Task.new("Test Task")
  end

  def test_task_initialization
    assert_equal "Test Task", @task.description
    refute @task.completed
  end

  def test_mark_as_completed
    @task.mark_as_completed
    assert @task.completed
  end
end

class TestToDoList < Minitest::Test
  def setup
    @todo_list = ToDoList.new
    @todo_list.add_task("Task 1")
    @todo_list.add_task("Task 2")
  end

  def test_add_task
    @todo_list.add_task("Task 3")
    assert_equal 3, @todo_list.tasks.length
    assert_equal "Task 3", @todo_list.tasks.last.description
  end

  def test_mark_task_completed
    @todo_list.mark_task_completed(0)
    assert @todo_list.tasks[0].completed
  end

end
