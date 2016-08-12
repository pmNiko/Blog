martin = User.new(
  :email                 => "martin@example.com",
  :password              => "nikolas89",
  :password_confirmation => "nikolas89"
)
martin.add_role :admin
martin.save!

fabi = User.new(
  :email                 => "fabi@example.com",
  :password              => "fabiana94",
  :password_confirmation => "fabiana94"
)
fabi.save!

Category.create!(name: 'OOP')
Category.create!(name: 'Programing')
Category.create!(name: 'Smalltalk')
Category.create!(name: 'Inforrmation')
Category.create!(name: 'News')
Category.create!(name: 'Notice')

for i in 1..2
  Article.create!({
    title: "Post number #{i}",
    text: "My #{i} post!",
    author: martin,
    :categories => Category.where(:name =>['OOP', 'Programing'])
  });
end

Article.create!(title: 'Hi everybody!',  text: "This is Jane's first post", author: fabi,
                :categories => Category.where(:name =>['OOP', 'Smalltalk']));
