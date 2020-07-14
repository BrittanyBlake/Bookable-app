FactoryBot.define do
  factory :book do
    title { Faker::Book.title }  
    author { Faker::Book.author} 
     number_of_pages { 'This is some text about the book that was written by the author and is the amount of pages long.' }
  end
end
