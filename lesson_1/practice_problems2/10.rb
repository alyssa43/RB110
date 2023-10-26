# Given the munsters hash below; Modify the hash such that each member of the Munster family has an
# additional "age_group" key that has one of three values describing the age group the family member
# is in (kid, adult, or senior). Your solution should produce the hash below
# Note: a kid is in the age range 0 - 17, an adult is in the range 18 - 64 and a senior is aged 65+.

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

=begin
{ "Herman" => { "age" => 32, "gender" => "male", "age_group" => "adult" },
  "Lily" => {"age" => 30, "gender" => "female", "age_group" => "adult" },
  "Grandpa" => { "age" => 402, "gender" => "male", "age_group" => "senior" },
  "Eddie" => { "age" => 10, "gender" => "male", "age_group" => "kid" },
  "Marilyn" => { "age" => 23, "gender" => "female", "age_group" => "adult" } }
=end
people = munsters.keys 
count = 0

loop do
	break if count == people.size
	current_age = munsters[people[count]]["age"]
	if current_age.between?(0, 17)
		munsters[people[count]]["age_group"] = "kid"
	elsif current_age.between?(18, 64)
		munsters[people[count]]["age_group"] = "adult"
	else
		munsters[people[count]]["age_group"] = "senior"
	end 
	count += 1
end

p munsters