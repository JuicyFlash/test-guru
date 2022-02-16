# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def destroy_data
  ProcessedTest.destroy_all
  Answer.destroy_all
  Question.destroy_all
  Test.destroy_all
  Category.destroy_all
  User.destroy_all
end

def generate_test_data

  # Категории
  idx = 1
  categories = []
  3.times do
    categories << Category.create(title: "Категория_#{idx}")
    idx += 1
  end

  # Пользователи
  users = []
  idx = 1
  3.times do
    users << User.create(first_name: "Имя_#{idx} (пользователь_#{idx})",
                         last_name: "Фамилия_#{idx} (пользователь_#{idx})",
                         email: "Email_#{idx}")
    idx += 1
  end

  # Тесты
  tests = []
  categories.each do |category|
    idx = 1
    3.times do
      tests << Test.create(title: "Тест_#{idx} (категория_#{category.id})",
                           category_id: category.id,
                           level: idx,
                           author: users[0])
      idx += 1
    end
  end

  # Вопросы
  questions = []
  tests.each do |test|
    idx = 1
    5.times do
      questions << Question.create(body: "Вопрос_#{idx} (тест_#{test.id})")
      idx += 1
    end
  end

  # Ответы
  answers = []
  questions.each do |question|
    idx = 1
    4.times do
      answers << if idx == 1
                   Answer.create(body: "Ответ_#{idx} (вопрос_#{question.id})", correct: true)
                 else
                   Answer.create(body: "Ответ_#{idx} (вопрос_#{question.id})")
                 end
      idx += 1
    end
  end

 

  # Пользователи-тесты
  users.each do |user|
    tests.each do |test|
      ProcessedTest.create(test_id: test.id, user_id: user.id)
    end
  end
end
destroy_data
generate_test_data

