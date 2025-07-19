class Commit < ApplicationRecord
  attribute :tags, :string, default: -> { [] }

  def tags
    super.is_a?(String) ? YAML.safe_load(super) || [] : super
  end

  def tags=(value)
    super(value.to_yaml)
  end
end
