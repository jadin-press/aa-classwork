require "employee"

class Startup
  attr_reader :name, :funding, :salaries, :employees
  attr_writer :employees, :funding
  
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = salaries
    @employees = []
  end

  def valid_title?(title)
    @salaries.has_key?(title)      
  end

  def >(another_startup)
    self.funding > another_startup.funding    
  end

  def hire(name, title)
    if !valid_title?(title)
      raise "Wrong title!!!!!!"
    else
      @employees << Employee.new(name, title)
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    pay_amount = @salaries[employee.title]
    if @funding >= pay_amount
      employee.pay(pay_amount)
      @funding -= pay_amount
    else
      raise "I don't wanna payyyyyyyyy"
    end
  end

  def payday
    @employees.each { |e| pay_employee(e) }
  end

  def average_salary
    # some intermediate combine sum of salaries
    salary_sum = 0
    @employees.each { |e| salary_sum += @salaries[e.title] }
    salary_sum / @employees.length
  end

  def close
    @employees = []
    @funding = 0
  end

  def acquire(another_startup)
    @funding += another_startup.funding
    another_startup.salaries.each do |title, salary|
        self.salaries[title] = salary if !self.salaries.has_key?(title)
    end
    @employees = @employees + another_startup.employees
    another_startup.close
  end

end
