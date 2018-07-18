
module Luhn
  def self.valid?(number)
    digits = split_number(number)
    number = double_every_second_digit(digits)
    total_divisable_by_ten?(number)
  end

  # Step 1 Break the digits
  def self.split_number(number)
    digits = number.to_s.split('')
    digits.each_with_index do |num, i|
      digits[i] = num.to_i
    end
  end

  # Step 2: Double every second digit from the right and reorder.
  # Step 3: If the doubled value is greater than or equal to 10, subtract 9 from it.
  def self.double_every_second_digit(digits)
    digits.reverse!
    digits.each_with_index do |digit, i|
      if 1 == i % 2
        digit *= 2
        if digit >= 10
          digit -= 9
        end
        digits[i] = digit
      end
    end
    digits.reverse!
  end


  # Step 4: Sum the digits and if total is divisable by 10, return true.
  def self.total_divisable_by_ten?(digits)
    sum = 0
    digits.each do |digit|
      sum += digit
    end
    (sum % 10).zero?
  end
end

puts Luhn.valid?(4847352989263094) == true
puts Luhn.valid?(2222) == false
puts Luhn.valid?(377681478627336) == true
puts Luhn.valid?(377681478627337) == false
puts Luhn.valid?(4556737586899855) == true
puts Luhn.valid?(414560385008505) == false
puts Luhn.valid?(348118823059283) == true
puts Luhn.valid?(424242424242424356) == false
puts Luhn.valid?(6011252584354303) == true
