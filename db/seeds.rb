require 'random_data'

 # Create Posts
 50.times do
   Post.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph
   )
 end
 posts = Post.all

 # Create Comments
 100.times do
   Comment.create!(
     post: posts.sample,
     body: RandomData.random_paragraph
   )
 end

 # Create Ads
 10.times do
   Advertisement.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     price:  RandomData.random_number
   )
 end

 # Create Ads
 10.times do
   Question.create!(
     title:  RandomData.random_sentence,
     body:   RandomData.random_paragraph,
     resolved:  true
   )
 end

 puts "Seed finished"
 puts "#{Post.count} posts created"
 puts "#{Comment.count} comments created"
 puts "#{Advertisement.count} ads created"
 puts "#{Question.count} questions created"
