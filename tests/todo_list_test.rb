require 'minitest/autorun'
require_relative '../todo_list'
require_relative '../task'

class ToDoListTest < Minitest::Test
  def setup
    @todo_list = ToDoList.new
  end

  def test_add_task
    @todo_list.add_task("Finish assignment")
    refute_empty @todo_list.tasks, "Task list should not be empty after adding a task"
    assert_equal 1, @todo_list.tasks.size
    assert_equal "Finish assignment", @todo_list.tasks.first.description
  end

  def test_mark_task_completed
    @todo_list.add_task("Finish assignment")
    @todo_list.mark_task_completed(0)

    assert @todo_list.tasks.first.completed, "Task should be marked as completed"
  end

  def test_mark_task_completed_invalid_index
    @todo_list.add_task("Finish assignment")
    @todo_list.mark_task_completed(1) # Invalid index

    refute @todo_list.tasks.first.completed, "Task should remain incomplete with invalid index"
  end
end
