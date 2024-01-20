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
