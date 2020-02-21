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
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter][:christmas] << supply
  holiday_hash[:winter][:new_years] << supply

end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  result = []
  result << holiday_hash[:winter][:christmas]
  result << holiday_hash[:winter][:new_years]
  result.flatten
  
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  
  holiday_hash.each do |key, value|
    puts "#{key.capitalize}:"
    
    value.each do |key2, value2|
      
      holiday_name = "#{key2}".split("_").join(" ")
      
      holiday_name = holiday_name.split.map(&:capitalize).join(' ')
      
      line = "  #{holiday_name}: "
      value2.each_with_index do |value3, key3|
        line += value3
        if(key3 < value2.length - 1)
          line += ", "
        end
      end
      puts line
    end
  end

end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"

  result = []

  holiday_hash.each do |season_key, season_value|
    
    
    season_value.each_with_index do |holiday_value, holiday_index|

      holiday_value.each do | supplies| 
        
        if(supplies.kind_of?(Array))
          puts "supplies: #{supplies}"
          puts "#{holiday_value[0]}"
          if(supplies.include?("BBQ"))
            result << holiday_value[0]
          end
        end
      end 
    end
      
  end
  result
end







