Category.delete_all
Question.delete_all
Answer.delete_all
TestPassage.delete_all
Test.delete_all
User.delete_all

users = User.create! [{ first_name: 'Августин', last_name: 'Светлый', email: 'a@a.a', password: '111111', confirmed_at: Time.now },
                      { first_name: 'Зураб', last_name: 'Церетелли', email: 'z@z.z', type: "Admin", password: '111111', confirmed_at: Time.now },
                      { first_name: 'Сергей', last_name: 'Бурый', email: 'beherit1977@gmail.com', type: "Admin", password: '111111', confirmed_at: Time.now }]

categories = Category.create! [{ title: 'Frontend', level: 1 }, { title: 'Backend', level: 2 }, { title: 'Full_stack', level: 2} ]


tests = Test.create! [{ title: 'HTML', level: 1, category_id: categories[0].id },
                      { title: 'PHP', level: 2, category_id: categories[1].id },
                      { title: 'Java', level: 3, category_id: categories[0].id }]

TestPassage.create! [{user_id: users[0].id, test_id: tests[0].id},
                     { user_id: users[0].id,  test_id: tests[2].id }]

questions = Question.create! [{ text: 'Что такое HTML', test_id: tests[0].id },
                              { text: 'Что такое PHP', test_id: tests[1].id },
                              { text: 'Ruby question #1', test_id: tests[2].id },
                              { text: 'Вопрос 2', test_id: tests[0].id },
                              { text: 'Вопрос 3', test_id: tests[0].id }]

answers = Answer.create! [{ text: 'HTML язык разметки', correct: true, question_id: questions[0].id},
                          { text: 'HTML язык програмирования', correct: false, question_id: questions[0].id },
                          { text: 'HTML язык аборигенов', correct: false, question_id: questions[1].id },
                          { text: 'Еще один правильный ответ', correct: true, question_id: questions[3].id },
                          { text: 'Еще один правильный ответ', correct: true, question_id: questions[4].id },
                          { text: 'PHP язык програмирования', correct: true, question_id: questions[1].id },
                          { text: 'PHP это еда', correct: false, question_id: questions[2].id },
                          { text: 'PHP это ад', correct: false, question_id: questions[2].id },
                          ]

TestPassage.create(test_id: tests[0].id, user_id: users[0].id)
TestPassage.create(test_id: tests[1].id, user_id: users[1].id)

