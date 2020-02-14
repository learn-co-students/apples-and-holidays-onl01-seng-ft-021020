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
  
holiday_hash.each do |season, holiday|
    if season == :summer 
      holiday.each do |element, activity| 
        return activity[1]
      end 
    end 
  end
end



def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays

holiday_hash.each do |season, holiday|
    if season == :winter
      holiday.each do |holiday_hash, items|
        if holiday_hash == :christmas || holiday_hash==:new_years
        items << supply
        end
      end
    end
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  
    holiday_hash.each do |season, holiday|
    if season == :spring 
      holiday.each do |holiday_hash_2, item|
        if holiday_hash_2 == :memorial_day
          item << supply
        end
      end 
    end 
  end
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  
  holiday_hash.each do |season_hash, holiday|
    if season_hash == season
      holiday[holiday_name] = supply_array
  end
end
return holiday_hash
end



def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  holiday_hash.each do |season, holiday|
      if season == :winter 
        return holiday.values.flatten
      end
    end
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  
  #Super difficult, had to convert the holiday to string then remove the "_" by converting back to array, then iterate through each index to capitalize, then finally join back together to a string. 
holiday_hash.each do |key, value|
    puts "#{key.capitalize}:".chomp
    value.each do |holiday , supplies|
      puts "  #{holiday.to_s.split("_").map{|word| word.capitalize}.join(" ")}: #{supplies.join(", ")}"
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  
  # 
new_array=[]
  holiday_hash.each do |season, holiday|
    holiday.each do |holiday, items|
      items.each do |items|
      if items == "BBQ"
        new_array << holiday
        end
      end
    end
  end
  return new_array
end







