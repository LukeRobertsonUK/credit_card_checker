def valid_number(number_string)
  reversed_number_array = number_string.delete(' ').split("").reverse
  new_reversed_array = []
  (0..(reversed_number_array.size-1)).each do |index|
    if index % 2 == 0
      new_reversed_array << (reversed_number_array[index])
    else
      new_reversed_array << (2*(reversed_number_array[index].to_i)).to_s
    end
  end

  array_of_single_digits = new_reversed_array.join('').split("")

  total = 0
  array_of_single_digits.each do |element|
    total +=  element.to_i
  end

  if total % 10 == 0
    return "valid"
  else
    return "invalid"
  end
end

def find_card_type(number_string)
  card = number_string.delete(' ').split('')
  beginswith = card.values_at(0,1).join.to_i
  if card.length == 15 && ( beginswith == 34 || beginswith == 37 )
    cardtype = "Amex"
  elsif card.length == 16 && ( card.values_at(0,1,2,3).join.to_i == 6011 )
    cardtype = "Discover"
  elsif card.length == 16 && (51..55).include?(beginswith)
    cardtype = "MasterCard"
  elsif (card.length == 13 || card.length == 16)  && ( card[0].to_i == 4 )
    cardtype = "Visa"
  else
    cardtype = "Unknown"
  end
end

f = File.new('card_numbers.txt', 'r')
f.each do |line|
  number_string = line.chomp.to_s
  puts "#{find_card_type(number_string)}: #{number_string}\t (#{valid_number(number_string)})"
end






