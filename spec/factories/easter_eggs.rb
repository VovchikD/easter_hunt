FactoryBot.define do
  factory :easter_egg do
    code { SecureRandom.alphanumeric(8).downcase }
    clue { "Some hidden clue" }
    latitude { rand(-90.0..90.0) }
    longitude { rand(-180.0..180.0) }
    found { false }
    discoverer_id { nil }
  end
end
