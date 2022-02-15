# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Категории
idx = 1
3.times do
  Category.create(title: "Категория_#{idx}")
  idx += 1
end

# Тесты
Category.pluck(:id).each do |id|
  idx = 1
  3.times do
    Test.create(title: "Тест_#{idx} (категория_#{id})", level: idx)
    idx += 1
  end
end

# Вопросы
Test.pluck(:id).each do |id|
  idx = 1
  5.times do
    Question.create(body: "Вопрос_#{idx} (тест_#{id})")
    idx += 1
  end
end

# Ответы
Question.pluck(:id).each do |id|
  idx = 1
  4.times do
    if idx == 1
      Answer.create(body: "Ответ_#{idx} (вопрос_#{id})", correct: true)
    else
      Answer.create(body: "Ответ_#{idx} (вопрос_#{id})")
    end
    idx += 1
  end
end

# Пользователи
idx = 1
3.times do
  User.create(first_name: "Имя_#{idx} (пользователь_#{idx})", last_name: "Фамилия_#{idx} (пользователь_#{idx})")
  idx += 1
end

# Пользователи-тесты
User.pluck(:id).each do |u_id|
  Test.pluck(:id).each do |t_id|
    ProcessedTest.create(test_id: t_id, user_id: u_id)
  end
end
