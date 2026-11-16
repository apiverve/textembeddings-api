# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "apiverve_textembeddings"
  spec.version       = "1.2.6"
  spec.authors       = ["APIVerve"]
  spec.email         = ["hello@apiverve.com"]

  spec.summary       = "Text Embeddings API - Ruby Client"
  spec.description   = "Text Embeddings turns a sentence, paragraph or short document into a 384-dimension vector that captures its meaning, ready for semantic search, clustering, deduplication and recommendations. Send one text or a batch of up to 32, and add a compare text to get the cosine similarity of each one to it in the same call."
  spec.homepage      = "https://apiverve.com/marketplace/textembeddings?utm_source=ruby&utm_medium=referral&utm_content=homepage"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.7.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/apiverve/textembeddings-API/tree/main/ruby"
  spec.metadata["changelog_uri"] = "https://apiverve.com/changelog"
  spec.metadata["documentation_uri"] = "https://docs.apiverve.com/ref/textembeddings"

  spec.files = Dir.glob("{lib}/**/*") + %w[README.md LICENSE]
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday", ">= 1.0", "< 3.0"
  spec.add_dependency "faraday-multipart", "~> 1.0"
  spec.add_dependency "json", "~> 2.0"
end
