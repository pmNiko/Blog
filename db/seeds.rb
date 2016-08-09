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



for i in 0..5
  Article.create!({
    title: "Post number #{i}",
    text: "My #{i} post!",
    author: fabi
  });
end

for i in 0..5
  Article.create!({
    title: "Post number #{i}",
    text: "My #{i} post!",
    author: martin
  });
end
