
def getHash class_str

class_info = []

class_str.each_line do |text|

  working_ary = text.gsub(/\s/, ' ').strip.split(" ")

  if working_ary.length > 4
    num_extra = (working_ary.length - 4)

    working_ary[3] = (working_ary.last(num_extra+1)).join(" ")
    working_ary.pop(num_extra)
    # puts working_ary

  end

  class_info.push(
    student = {
      first_name: working_ary[0],
      last_name: working_ary[1],
      email: working_ary[2],
      class: working_ary[3]
    }
  )
end

class_info
end

def disp info, heading
puts heading.center(53)
puts "%"*53
puts

info.each do |item|

  l_name = item[:last_name]
  f_name = item[:first_name]
  email = item[:email]

  print "#{l_name},"
  print "#{' '*(15-l_name.length)}#{f_name}"
  puts  "#{' '*(15-f_name.length)}#{email}"

end


end

def getAll records
disp records, "ALL"
end

def getSome records, char
truncated_records = []

records.each do |item|
  if item[:last_name].downcase.include?(char.downcase)
    truncated_records << item

  end
end

disp truncated_records, "SOME"

end

class_str = """John            Foley             john@gschool.it         Beginning snark
Sylwester       Kelsey            sellie@gmail.com        Ruby Immersive
Timothy         Rama              tim.rama@gmail.com      Ruby Immersive
Kane            Baccigalupi       kane@gschool.it         C for dummies
Nikita          Theodosius        nikita.theo@gmail.com   Ruby Immersive
Roddy           Eldred            roddy.el@gmail.com      Ruby Immersive
Martha          Berner            martha@gschool.it       Time travel for beginners
Kofi            Thomas            k.thomas@hotmail.com    Ruby Immersive"""


class_info = getHash class_str
running = true
while running
puts "%"*53
puts "Would you like to display ALL records?(yes/no/idgaf)".center(53)
response = gets.chomp.downcase

if response == "yes"
  getAll class_info

elsif response == "no"
  puts "Enter a LETTER to search last names:"
  search_str = gets.chomp
  getSome class_info, search_str
elsif response == "idgaf"
  running = false
else
  puts "Please enter 'yes' or 'no'! or at least say you dont gaf"
  puts
end
end
