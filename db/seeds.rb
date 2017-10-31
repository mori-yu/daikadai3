20.times do
email = Faker::Internet.email
name = Faker::LordOfTheRings.character
password = "password"
avatar = Faker::Avatar.image
user = User.new(
email: email,
name: name,
password: password,
password_confirmation: password,
avatar: avatar,
uid: SecureRandom.uuid,
)
user.skip_confirmation!
user.save
end

20.times do
  follower_id = [*1..20].sample
  followed_id = [*1..20].sample
  while follower_id == followed_id
    followed_id = [*1..20].sample
  end
    Relationship.find_or_create_by(
    follower_id: follower_id,
    followed_id: followed_id
  )
end

20.times do |t|
 title = Faker::Book.title
  content = Faker::Beer.name
  Topic.create!(title: title,
               content: content,
              )

end

20.times do |p|
  content = Faker::Bank.name
  Comment.create!(content: content,
                  )
end
