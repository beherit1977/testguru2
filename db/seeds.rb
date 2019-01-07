users = User.create! [{ name: :firstuser }, { name: :seconduser }]

categories = Category.create! [{ title: 'JS', level: 1 }, { title: 'Ruby', level: 2 }]


tests = Test.create! [{ title: 'Java', level: 3, category_id: categories[0].id, author: users[0] },
                      { title: 'Perl', level: 2, category_id: categories[1].id, author: users[1] },
                      { title: 'Ruby', level: 1, category_id: categories[0].id, author: users[0] }]

TestPassage.create! [{user_id: users[0].id, test_id: tests[0].id},
                     { user_id: users[0].id,  test_id: tests[2].id }]

questions = Question.create! [{ text: 'Java question #1', test_id: tests[0].id },
                              { text: 'Perl question #1', test_id: tests[1].id },
                              { text: 'Ruby question #1', test_id: tests[2].id }]

answers = Answer.create! [{ text: 'Answer 1q1', correct: true, question_id: questions[0].id},
                          { text: 'Answer 2q1', correct: false, question_id: questions[0].id },
                          { text: 'Answer 1q2', correct: true, question_id: questions[1].id },
                          { text: 'Answer 2q2', correct: false, question_id: questions[1].id },
                          { text: 'Answer 1q3', correct: true, question_id: questions[2].id },
                          { text: 'Answer 2q3', correct: false, question_id: questions[2].id }]