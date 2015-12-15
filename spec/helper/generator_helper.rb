def generate_string(length = 50)
  rand(36**length).to_s(36)
end

def generate_email
  "#{generate_string}@exemple.com"
end

def generate_number
  1000 + rand(1..150)
end