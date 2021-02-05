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


end