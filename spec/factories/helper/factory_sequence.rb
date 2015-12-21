FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@refinerycms.com"
  end
end

FactoryGirl.define do
  sequence :title, aliases: [:name, :cover_letter, :description] do |n|
    "Test #{n}"
  end
end

FactoryGirl.define do
  sequence :date, aliases: [:created_at] do |n|
    DateTime.now + n.days
  end
end

FactoryGirl.define do
  sequence :published_at do |n|
    DateTime.now - n.days
  end
end