def is_number?(obj)
  obj = obj.delete_prefix "-"
  return obj.match? /\d/
end

def init_arr
  arr = Array.new

  (0...5).each do |i|
    begin
      print "[#{i + 1}] = "
      arr[i] = gets.chomp
      arr[i] = "0" if arr[i] == ""
    end until is_number? arr[i]
    arr[i] = arr[i].to_i
  end
  arr
end

def tinh_luy_thua(arr)
  luy_thua_bac_2 = Proc.new { |x| x ** 2 }
  output = Array.new
  arr.each do |elem|
    new_e = elem == 6 || elem == 7 ? elem : luy_thua_bac_2.call(elem)
    output.push new_e
  end

  output
end

puts "Nhap vao cac phan tu cua mang"
arr = init_arr
puts "Tong cac phan tu cua mang: #{arr.sum}"
arr_luy_thua = tinh_luy_thua arr
puts arr_luy_thua.to_s
