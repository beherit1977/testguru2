class GistQuestionService

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    # в .env установил токен а тут выдает ошибку в авторизации
    # @client = client || Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
    # так работает
    @client = client || Octokit::Client.new(access_token: '76d5b1d98508f299d4b464a82fc3a10e5cbcf2aa')
  end

  def call
    @client.create_gist(gist_params)
  end


  private

  def gist_params
    {
        "description": "A question about #{@test.title} from TestGuru ",
        "files": {
            "test-guru-question.txt": {
            "content": gist_content
            }
         }
    }
  end

  def gist_content
    content = [@question.text]
    content += @question.answers.pluck(:text)
    content.join("\n")
  end
end