class Employee
  attr_reader :name, :salary, :title, :boss
  
  def initialize(name, salary, title, boss)
    @name = name
    @salary = salary
    @title = title
    @boss = boss
  end

  def bonus(multiplier)
    bonus = (self.salary) * multiplier
  end
end

class Manager < Employee
  attr_reader :employees

  def initialize(name, salary, title, boss)
    super(name, salary, title, boss)
    @employees = []
  end
    
  def bonus(multiplier)
    
  end

  def sum_salary
    sum = 0
    self.employees.each do |employee|
      
    end
  end
end