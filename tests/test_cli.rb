require 'minitest/autorun'
require_relative '../task'

class TaskTest < Minitest::Test
  def test_task_creation
    task = Task.new("Learn Ruby")
    refute_nil task
    assert_equal "Learn Ruby", task.description
    refute task.completed, "New task should not be completed"
  end

  def test_mark_as_completed
    task = Task.new("Learn Ruby")
    refute task.completed, "Task should initially be incomplete"

    task.mark_as_completed
    assert task.completed, "Task should be marked as completed"
  end
end
