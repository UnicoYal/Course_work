require 'faker'

#Inserting into disciplines
# 22.times do 
#   name = Faker::Educator.unique.subject
#   sql = "INSERT INTO disciplines (name) VALUES ('#{name}')  "
#   ActiveRecord::Base.connection.exec_query(sql)
# end

# 78.times do 
#   name = Faker::Lorem.unique.word
#   sql = "INSERT INTO disciplines (name) VALUES ('#{name}')  "
#   ActiveRecord::Base.connection.exec_query(sql)
# end

# Inserting into Teachers
# i = 1
# 20010.times do
#   if i > 100 
#     i = 1
#   end
#   discipline_id = i
#   i += 1
#   full_name = Faker::Name.name_with_middle.tr("'", "")
#   first_name, second_name, patronymic = full_name.split 
#   sql = "INSERT INTO teachers (first_name , second_name , patronymic , discipline_id) VALUES ('#{first_name}', '#{second_name}', '#{patronymic}', '#{discipline_id}')  "
#   ActiveRecord::Base.connection.exec_query(sql)
# end

# Inserting into students
# letters = %w[a b c d e f g h i j k l m n o p q r s t u v w x y z]
# numbers = %w[1 2 3 4 5 6 7 8 9]
# 1300000.times do 
#   full_name = Faker::Name.name_with_middle.tr("'", "")
#   first_name, second_name, patronymic = full_name.split 
#   course = rand(1..5)
#   group_code = "#{letters.sample}#{letters.sample}#{numbers.sample}-#{numbers.sample}#{numbers.sample}" 
#   sql = "INSERT INTO students (first_name , second_name , patronymic , course , group_code) VALUES ('#{first_name}', '#{second_name}', '#{patronymic}', '#{course}', '#{group_code}')  "
#   ActiveRecord::Base.connection.exec_query(sql)
# end

#Inserting into questions
# i = 1
# 20000.times do
#   question = Faker::Lorem.unique.question
#   if i > 100
#     i = 1
#   end
#   parts = ["A", "B"]
#   discipline_id = i
#   i += 1
#   part = parts.sample
#   sql = "INSERT INTO questions (question , discipline_id , part) VALUES ('#{question}', '#{discipline_id}', '#{part}')  "
#   ActiveRecord::Base.connection.exec_query(sql)
# end

#Inserting into variants
# k = 1
# counter = 0
# var_num = 1
# 100.times do
#   presql = "select * from questions where discipline_id = '#{k}'" 
#   res = ActiveRecord::Base.connection.exec_query(presql)
#   res.each do |hash|
#     if counter == 10 then
#       counter = 0
#       var_num += 1
#     end
#     question_id = hash["id"]
#     sql = "INSERT INTO variants (var_num , question_id , discipline_id) VALUES ('#{var_num}', '#{question_id}', '#{k}')  "
#     ActiveRecord::Base.connection.exec_query(sql)
#     counter += 1
#   end
#   var_num = 1 
#   k += 1
# end

#Inserting into answers
# i = 1
# 20000.times do
#   description = Faker::Lorem.unique.sentence
#   mark = rand(5..10)
#   question_id = i
#   i += 1
#   sql = "INSERT INTO answers (description , mark , question_id) VALUES ('#{description}', '#{mark}', '#{question_id}')  "
#   ActiveRecord::Base.connection.exec_query(sql)
# end

#Inserting into themes
# k = 1
# counter = 0
# theme_num = 100
# 100.times do
#   presql = "select * from questions where discipline_id = '#{k}'" 
#   res = ActiveRecord::Base.connection.exec_query(presql)
#   res.each do |hash|
#     if counter == 20 then
#       counter = 0
#       theme_num += 1
#     end
#     question_id = hash["id"]
#     sql = "INSERT INTO themes (theme_num , discipline_id , question_id) VALUES ('#{theme_num}', '#{k}', '#{question_id}')  "
#     ActiveRecord::Base.connection.exec_query(sql)
#     counter += 1
#   end
#   k += 1
#   theme_num = theme_num + 100 - 9
# end

#Inserting into attempts
i = 1
900000.times do 
  student_id = i
  i += 1
  discipline_id = rand(1..100)
  presql = "SELECT * FROM variants where discipline_id = '#{discipline_id}' ORDER BY RANDOM() LIMIT 1 "
  res = ActiveRecord::Base.connection.exec_query(presql)
  res.each do |hash|
    @variant_id = hash["id"]
  end
  date = Faker::Date.between(from: '2022-01-01', to: '2024-01-01')
  sql = "INSERT INTO attempts (student_id , discipline_id , variant_id, date) VALUES ('#{student_id}', '#{discipline_id}', '#{@variant_id}', '#{date}')  "
  ActiveRecord::Base.connection.exec_query(sql)
end







#FIXING VAR_NUM
# i = 1
# 20000.times do 
#   presql = "select * from variants where var_num > 20" 
#   res = ActiveRecord::Base.connection.exec_query(presql)
#   res.each do |hash|
#     if hash["var_num"]%20 != 0
#       hash["var_num"] = hash["var_num"]%20
#       sql = "update variants set var_num = '#{hash["var_num"]}' where id = '#{i}'"
#     elsif hash["var_num"]%20 == 0
#       hash["var_num"] = 20
#       sql = "update variants set var_num = '#{hash["var_num"]}' where id = '#{i}'"
#     end
#     ActiveRecord::Base.connection.exec_query(sql)
#     i += 1
#   end
# end