class Student
  attr_reader :name, :toan, :van, :anh, :avg
  def initialize name
    @name = name
    @toan = nil
    @van = nil
    @anh = nil
    @avg = nil
  end

  def set_mark(toan, van, anh)
    @toan = toan
    @van = van
    @anh = anh
    @avg = (@toan + @van + @anh) / 3
  end
end

def init_list_students  
  arr = Array.new
  
  print "Nhap so hoc sinh: "
  n = gets.chomp.to_i
  (0...n).each do |i|
    print "Ten hoc sinh #{i + 1}: "; name = gets.chomp
    print "Diem toan: "; toan = gets.chomp.to_f
    print "Diem van: "; van = gets.chomp.to_f
    print "Diem anh: "; anh = gets.chomp.to_f
    new_std = Student.new name
    new_std.set_mark(toan, van, anh)
    arr.push new_std
  end

  arr_avg = arr.map {|std| std.avg}
  puts "\nDiem trung binh cao nhat: #{arr_avg.max}"

  return arr
end

def get_list_students arr
  hash = Hash.new
  arr.each do |student|
    hash[student.name] = {toan: student.toan, van: student.van, anh: student.anh, avg: student.avg}
  end
  return hash
end

def get_students_have_highest_avg hash
  arr_avg = Array.new
  hash.values.each{|std| arr_avg.push std[:avg] }
  
  highest_avg = hash.select{|_,mark| mark[:avg] == arr_avg.max}
  return highest_avg.keys
end

arr = init_list_students
hash = get_list_students arr
puts "\nHash: " 
puts hash

highest_avg_names = get_students_have_highest_avg hash
puts "\nTen hoc sinh co diem trubg binh cao nhat: " 
puts highest_avg_names.to_s