# app/controllers/api/v1/commits_controller.rb
class Api::V1::CommitsController < ApplicationController
  # VERY simple token header check for the MVP
  before_action :authenticate!

  def create
    commit = Commit.create!(commit_params)
    render json: commit, status: :created
  end

  private

  def authenticate!
    head :unauthorized unless request.headers["Authorization"] == ENV["LEDGER_TOKEN"]
  end

  def commit_params
    params.permit(:sha, :author, :repo, :message, :ai_score, :similarity_description, :concepts, :concept_description, :tech_debt_score, tags: [])
  end
end
