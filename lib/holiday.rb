require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  supply = ""
    holiday_hash.each do |season, holidays|
      holidays.each do |specific_holiday, supplies|
        if specific_holiday == :fourth_of_july
          supply = supplies[1]
        end
      end
    end
  supply
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash.each do |season, holidays|
    if season == :winter
      holidays.each do |specific_holiday, supplies|
        supplies << supply
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash.each do |season, holidays|
    if season == :spring
      holidays.each do |specific_holiday, supplies|
        if specific_holiday == :memorial_day
          supplies << supply
        end
      end
    end
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash

  holiday_hash[season] = {holiday_name => supply_array}
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  winter_supplies = []
  holiday_hash.each do |season, holiday|
    if season == :winter
      holiday.each do |specific_holiday, supplies|
        winter_supplies << supplies
      end
    end
  end
  winter_supplies.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
    holiday_hash.each do |season, holidays|
      puts "#{season.capitalize}:"
      holidays.each do |specific_holiday, supplies|

        if specific_holiday.to_s.include? '_'
         puts "  #{specific_holiday.to_s.split('_').map(&:capitalize).join(" ")}: #{supplies.join(', ')}"
        else
          puts "  #{specific_holiday.capitalize}: #{supplies.join(', ')}"
        end

      end
    end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  array_of_symbols = []
  holiday_hash.each do |season, holidays|
    holidays.each do |specific_holiday, supply_array|
      if supply_array.include? "BBQ"
        array_of_symbols << specific_holiday
      end
    end
  end
  array_of_symbols
end
