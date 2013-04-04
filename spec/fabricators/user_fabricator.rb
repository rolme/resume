Fabricator(:user) do
	email 									{ Faker::Internet.safe_email }
	password 								"password"
	password_confirmation		"password"
	handle									{ Faker::Name.first_name }
end

Fabricator(:test_user, from: :user) do
  email                   "test@mail.com"
  password                "password"
  password_confirmation   "password"
  handle                  "test"
end
