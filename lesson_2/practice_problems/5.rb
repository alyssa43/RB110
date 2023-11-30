# Consider this nested Hash:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# Determine the total age of just the male members of the family.
total_male_age = 0
munsters.keys.each do |person|
	if munsters[person]["gender"] == "male"
		total_male_age += munsters[person]["age"]
	end
end

p total_male_age

# Better solution:
male_age = 0
munsters.each_value do |details|
	male_age += details["age"] if details["gender"] == "male"
end

p male_age