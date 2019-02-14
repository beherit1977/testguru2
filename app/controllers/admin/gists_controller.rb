class GistsController < ApplicationController
  def all
    @gists = Gist.all
  end
end
