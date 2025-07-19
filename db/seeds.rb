puts "🌱 Seeding commits with detailed concept descriptions..."

require "securerandom"

Commit.destroy_all

authors = ["Jacob", "Alice", "Bob", "Charlie", "Eve"]
repos = ["ghostwriter-ledger", "rails-analyzer", "dev-dashboard"]
tags_pool = %w[refactor rails test bugfix ui db feature docs hotfix performance]

concepts_with_details = {
  "ActiveRecord associations" => [
    "Defined `has_many` and `belongs_to` in models like `User` and `Commit`.",
    "Introduced `dependent: :destroy` to manage cascading deletes.",
    "Added `inverse_of` to improve performance and avoid extra queries."
  ],
  "Tailwind CSS integration" => [
    "Applied utility classes in views using `flex`, `text-sm`, and `rounded`.",
    "Added `application.tailwind.css` and `tailwind.config.js` for theme customization.",
    "Used `@layer components` to define reusable styles."
  ],
  "GitHub Actions CI" => [
    "Created `.github/workflows/test.yml` for CI testing with RSpec.",
    "Configured `ruby/setup-ruby` and cache actions.",
    "Added `bundle exec rails db:test:prepare` to CI flow."
  ],
  "Model validations" => [
    "Used `validates :sha, presence: true, uniqueness: true` in `Commit` model.",
    "Added numericality check for `ai_score` between 0 and 1.",
    "Used `validates :message, length: { minimum: 10 }`."
  ],
  "Controller filters" => [
    "Added `before_action :authenticate!` to API controllers.",
    "Used `skip_before_action` for public endpoints.",
    "Defined private methods for cleaner controller code."
  ],
  "Routing constraints" => [
    "Scoped API routes under `namespace :v1`.",
    "Added constraints to `format: :json` for API stability.",
    "Used `resources :commits, only: [:index, :create]`."
  ],
  "Migration structure" => [
    "Created `AddDescriptionsToCommits` migration with `text` columns.",
    "Used `change_table` to add new columns safely.",
    "Verified with `rails db:migrate:status` and `schema.rb`."
  ],
  "Background jobs" => [
    "Set up `ActiveJob` with `Sidekiq` adapter.",
    "Created `AnalyzeCommitJob` for async similarity analysis.",
    "Queued job using `perform_later` after create hook."
  ],
  "Environment configs" => [
    "Used `ENV['LEDGER_TOKEN']` for API auth.",
    "Updated `config/environments/production.rb` for asset host.",
    "Added `.env` file for local development."
  ],
  "Serializer formatting" => [
    "Created `CommitSerializer` with `attributes :sha, :ai_score, :tags`.",
    "Used `as_json` override for nested formatting.",
    "Defined custom methods like `formatted_tags` for output."
  ]
}

similarity_reasons = [
  "Matched structure with previously AI-written model files.",
  "Code reuse and formatting patterns highly resemble LLM-generated output.",
  "Function naming and comments match Copilot suggestions.",
  "Refactoring closely mirrors common Rails refactor patterns found in training data.",
  "Style and structure suggest template-based generation.",
  "High reuse of previous controller logic in a new context.",
  "High similarity to open-source Rails project commits.",
  "Identical code blocks found in multiple repositories.",
  "Suggested changes match LLM prompt completion strategies.",
  "Inline comments match GPT-generated explanations."
]

require "faker"

20.times do
  concept = concepts_with_details.keys.sample
  concept_description = concepts_with_details[concept].sample

  Commit.create!(
    sha: SecureRandom.hex(4),
    author: authors.sample,
    repo: repos.sample,
    message: Faker::Hacker.say_something_smart.capitalize + ".",
    ai_score: rand.round(2),
    tags: tags_pool.sample(rand(2..4)),
    similarity_description: similarity_reasons.sample,
    concepts: concept,
    concept_description: concept_description
  )
end

puts "✅ Done seeding detailed commits!"
