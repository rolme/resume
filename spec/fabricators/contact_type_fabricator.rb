Fabricator(:contact_type) do
  name { Faker::Lorem.word }
end

%w[home_phone mobile_phone personal_email url github linkedin twitter instagram facebook].each do |t|
  Fabricator(t.to_sym, from: :contact_type) do
    name t
  end
end
