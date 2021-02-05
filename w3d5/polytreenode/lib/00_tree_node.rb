require 'byebug'

class PolyTreeNode
  attr_reader :parent, :children, :value
  
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(value)
    @parent = value
    unless @parent == nil || @parent.children.include?(self)
      @parent.children << self
    end

  end


end