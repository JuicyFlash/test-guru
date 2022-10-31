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
  GivenBadge.destroy_all
  Badge.destroy_all
  #User.destroy_all
end

def generate_test_data
  generate_categories
  #generate_users
  generate_tests
  generate_questions
  generate_answers
  generate_badges
  #generate_processed_tests
end

def generate_categories
  # Категории
  idx = 1
  @categories = []
  3.times do
    @categories << Category.create(title: "Категория_#{idx}")
    idx += 1
  end
end

def generate_users
  # Пользователи
  @users = []
   idx = 1
   3.times do
     @users << User.create(first_name: "Имя_#{idx} (пользователь_#{idx})",
                         last_name: "Фамилия_#{idx} (пользователь_#{idx})",
                         email: "Email_#{idx}")
   idx += 1
   end
end

def generate_tests
  # Тесты
  @tests = []
  @categories.each do |category|
    idx = 1
    3.times do
      @tests << Test.create(title: "Тест_#{idx} (#{category.title})",
                           category_id: category.id,
                           level: idx,
                           author: User.first)
      idx += 1
    end
  end
end

def generate_questions
  # Вопросы
  @questions = []
  @tests.each do |test|
    idx = 1
    5.times do
      @questions << Question.create(body: "Вопрос_#{idx} (тест_#{test.id})",
                                   test_id: test.id)
      idx += 1
    end
  end
end

def generate_answers
  # Ответы
  @answers = []
  @questions.each do |question|
    idx = 1
    4.times do
      @answers << if idx == 1
                   Answer.create(body: "Ответ_#{idx} (вопрос_#{question.id})",
                                 question_id: question.id,
                                 correct: true)
                 else
                   Answer.create(body: "Ответ_#{idx} (вопрос_#{question.id})",
                                 question_id: question.id)
                 end
      idx += 1
    end
  end
end

def generate_processed_tests
  # Пользователи-тесты
   users.each do |user|
   tests.each do |test|
     ProcessedTest.create(test_id: test.id, user_id: user.id)
   end
  end
end
def generate_badges
  Badge.create(rule_type: 'finish_tests_by_level',
               rule_value: 3,
               unique: true,
               picture: 'https://ultimatecup.ru/images/achievements/QgsZUTBW.png',
               title: 'Круче не бывает',
               rule_description: 'Награда за успешное прохождение всех тестов уровня 3')

  Badge.create(rule_type: 'finish_any_test_by_first_try',
               rule_value: 0,
               picture: 'https://ultimatecup.ru/images/achievements/5yjlxSOA.png',
               title: 'No luck, just skill',
               rule_description: 'Награда за успешное прохождение теста с первого раза')

  Badge.create(rule_type: 'finish_tests_by_category',
                rule_value: Category.last.id,
                unique: true,
                picture: 'https://ultimatecup.ru/images/achievements/HVbk3CM2.png',
                title: "#{Category.last.title} за 300",
                rule_description: "Награда за успешное прохождение всех тестов категории #{Category.last.title}")
end

destroy_data
generate_test_data

