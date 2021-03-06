class Manifest < ApplicationRecord
  belongs_to :github_repository
  has_many :repository_dependencies, dependent: :delete_all

  scope :latest, -> { order("manifests.filepath, manifests.created_at DESC").select("DISTINCT on (manifests.filepath) *") }
  scope :platform, ->(platform) { where('lower(manifests.platform) = ?', platform.try(:downcase)) }
  scope :kind, ->(kind) { where(kind: kind) }

  def github_link
    github_repository.blob_url + filepath
  end
end
