class CommitsController < ApplicationController
  def index
    @commits = Commit.order(created_at: :desc).limit(200)
  end
end
