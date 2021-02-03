require_relative '../lib/LinkedList.rb'

p list = LinkedList.new
  .append("Test0")
  .append("Test1")
  .append("Test2")
  .insert_at("Test4", 1)
  .prepend("Test-1")
  .remove_at(1)
  .remove_at(0)
  .pop
  .insert_at("Test 0", 0)
  .to_s # returns 0, 1, 2, nil
