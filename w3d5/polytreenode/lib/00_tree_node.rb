require 'byebug'

class PolyTreeNode
  attr_reader :parent, :children, :value
  
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(value)
    unless @parent.nil? 
      @parent.children.delete(self)
    end
    if value.nil?
      @parent = nil
    elsif !value.children.include?(self)
      @parent = value
      @parent.children << self
    else
      @parent = value
    end  
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Error" unless children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if self == target_value
    children.each { |child| dfs(child) }
    nil 
  end

  def bfs(target_value)
    
    children.each do |child|
      if child == target_value
        return child
      else
        children.shift
      end
    end
  end


end