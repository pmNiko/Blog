class Article < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true, length: { minimum: 5 }
  validates :author, presence: true
    #Va a tener una referencia a un autor a travez de la clase User
  belongs_to :author, class_name: 'User'
end
