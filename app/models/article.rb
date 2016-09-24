class Article < ActiveRecord::Base
  validates :title, presence: true, length: { minimum: 5 }
  validates :text, presence: true, length: { minimum: 5 }
  validates :author, presence: true
    #Va a tener una referencia a un autor a travez de la clase User
  belongs_to :author, class_name: 'User'
  has_and_belongs_to_many :categories

  def self.search(search)
    if search.present?
      #where({title: search})
      where('title LIKE :search OR text LIKE :search', search: "%#{search}%")
    else
      all
    end
  end

end
