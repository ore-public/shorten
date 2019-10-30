class Url < ApplicationRecord
  validates :url, format: /\A#{URI::regexp(%w[http https])}\z/

  before_save :set_slug_and_domain

  def escaped_url
    URI.encode(self.url)
  end

  private
  def set_slug_and_domain
    self.slug = create_slug
    self.from_domain = URI.parse(escaped_url).host
  end

  def create_slug
    slug = ''
    loop do
      slug = SecureRandom.hex(5)
      break if Url.find_by(slug: slug).nil?
    end

    slug
  end
end
