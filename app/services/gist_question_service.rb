class GistQuestionService

  ResultObject = Struct.new(:success?, :data)

  def initialize(question, client = nil)
    @question = question
    @test     = question.test
    @client   = client || Octokit::Client.new(:access_token => ENV['GIST_ACCESS_TOKEN'])
  end

  def call
    gist = @client.create_gist(gist_params)
    ResultObject.new(gist.id.present?, gist)
  end

  private

  def gist_params
    {
        "description": I18n.t('gist_description', test_title: @test.title),
        "public":      true,
        "files":       {
            "file1.txt": {
            "content": gist_content
    }
    }
    }

  end

  def gist_content
    content = [@question.text]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end

end