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
    sum_salary * multiplier
  end
  
  def sum_salary
    sum = 0
    queue = [self]
    until queue.empty?
      current_employee = queue.shift
      current_employee.employees.each do |employee|
        if employee.is_a?(Manager)
          queue << employee
          sum += employee.salary
        else
          sum += employee.salary
        end
      end
    end
    sum
  end
end


ned = Manager.new("ned", 1000000, "founder", nil)
darren = Manager.new("darren", 78000, "TA Manager", ned)
shawna = Employee.new("shawna", 12000, "TA", darren)
david = Employee.new("david", 10000, "TA", darren)

ned.employees << darren
darren.employees << shawna
darren.employees << david

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000