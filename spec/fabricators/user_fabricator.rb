Fabricator(:user) do
	email 									{ Faker::Internet.safe_email }
	password 								"12341234"
	password_confirmation		"12341234"
	handle									"test-handle"
end
