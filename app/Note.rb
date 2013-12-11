class Note < NanoStore::Model
  attribute :text
  attribute :created_at

  class << self
    def create_new text
     obj = create(text: text, created_at: Time.now)
     obj.save
    end
  end
end
