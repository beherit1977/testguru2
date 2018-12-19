# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create(
    [{ title: :language , level: 1},
     { title: :language , level: 2 }]
)

tests = Test.create(
    [{ title: 'Java', level: 3 },
     { title: 'Perl', level: 2 },
     { title: 'Ruby', level: 1 },
     { title: 'Python', level: 2},
     { title: 'Javascript', level: 3 }]
)

questions = Question.create(
    [{ text: 'Java question #1' },
     { text: 'Perl question #1' },
     { text: 'Ruby question #1' },
     { text: 'Python question #1' },
     { text: 'Javascript question #1' }]
)

Answer.create(
    [{ text: 'Answer 1q1', correct: true  },
     { text: 'Answer 2q1', correct: false  },
     { text: 'Answer 1q2', correct: true  },
     { text: 'Answer 2q2', correct: false },
     { text: 'Answer 1q3', correct: true  },
     { text: 'Answer 2q3', correct: false  },
     { text: 'Answer 1q4', correct: true  },
     { text: 'Answer 2q4', correct: false },
     { text: 'Answer 1q5', correct: true  },
     { text: 'Answer 2q5', correct: false  }]
)

users = User.create(
    [{ name: :firstuser },
     { name: :seconduser }]
)

