Category.delete_all
Question.delete_all
Answer.delete_all
TestPassage.delete_all
Test.delete_all
User.delete_all

users = User.create! [{ name: :firstuser }, { name: :seconduser }]

categories = Category.create! [{ title: 'Frontend', level: 1 }, { title: 'Backend', level: 2 }, { title: 'Full_stack', level: 2} ]


tests = Test.create! [{ title: 'HTML', level: 1, category_id: categories[0].id, author: users[0] },
                      { title: 'PHP', level: 2, category_id: categories[1].id, author: users[1] },
                      { title: 'Java', level: 3, category_id: categories[0].id, author: users[0] }]

TestPassage.create! [{user_id: users[0].id, test_id: tests[0].id},
                     { user_id: users[0].id,  test_id: tests[2].id }]

questions = Question.create! [{ text: 'Что такое HTML', test_id: tests[0].id },
                              { text: 'Что такое PHP', test_id: tests[1].id },
                              { text: 'Ruby question #1', test_id: tests[2].id }]

answers = Answer.create! [{ text: 'HTML язык разметки', correct: true, question_id: questions[0].id},
                          { text: 'HTML язык програмирования', correct: false, question_id: questions[0].id },
                          { text: 'HTML язык аборигенов', correct: false, question_id: questions[1].id },
                          { text: 'PHP язык програмирования', correct: true, question_id: questions[1].id },
                          { text: 'PHP это еда', correct: false, question_id: questions[2].id },
                          { text: 'PHP это ад', correct: false, question_id: questions[2].id }]

TestPassage.create(test_id: tests[0].id, user_id: users[0].id)
TestPassage.create(test_id: tests[1].id, user_id: users[1].id)