FactoryGirl.define do
  sequence :email do |n|
    "person#{n}@refinerycms.com"
  end
end

FactoryGirl.define do
  sequence :title do
    generate_string
  end
end

FactoryGirl.define do
  sequence :name do |n|
    "Test name #{n}"
  end
end

FactoryGirl.define do
  sequence :cover_letter do |n|
    "Test Cover letter #{n}"
  end
end

FactoryGirl.define do
  sequence :description do |n|
    "Test description #{n}"
  end
end