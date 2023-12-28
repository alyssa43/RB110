# PROBLEM:

	# - The time of day can be represented as the number of minutes before or after midnight. If the
	# - number of minutes is positive, the time is after midnight. If the number of minutes is negative,
	# - the time is before midnight.

  # - Write a method that takes a time using this minute-based format and returns the time of day in 24
	# - hour format (hh:mm). Your method should work with any integer input.

  # - You may not use ruby's Date and Time classes.

	# - input: An Integer, that represents an amount of minutes
	# - outputs: A String, that represents how many hours and minutes before/after midnight

	# Rules:
		# Explicit requirements:
		# - The input Integer can be negative or postivie
      # - If negative, the time is before midnight
      # - if positive, the time is after midnight
    # - The return value must be in 24 hour format (hh:mm)
    # - Cannot use Ruby's Date and Time classes

		# Implicit requirements:
		# - 

# Examples: 
  # - time_of_day(0) == "00:00"
	# - time_of_day(-3) == "23:57"
	# - time_of_day(35) == "00:35"
	# - time_of_day(-1437) == "00:03"
	# - time_of_day(3000) == "02:00"
	# - time_of_day(800) == "13:20"
	# - time_of_day(-4231) == "01:29"

# Data Structure(s): 
  # - 

# Algorithm: 

	# time_of_day method
	# =============================
		# - 

# Code:

MINUTES_PER_HOUR = 60
HOURS_PER_DAY = 24
MINUTES_PER_DAY = 1440

def normalize_minutes_to_0_through_1439(minutes)
  while minutes < 0
    minutes += MINUTES_PER_DAY
  end

  minutes % MINUTES_PER_DAY
end

def time_of_day(delta_minutes)
  delta_minutes = normalize_minutes_to_0_through_1439(delta_minutes)
  hours, minutes = delta_minutes.divmod(MINUTES_PER_HOUR)
  format('%02d:%02d', hours, minutes)
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"
