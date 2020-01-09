require 'pry'

def get_first_name_of_season_winner(data, season)
  seasonWinner = ""
  data[season].each do |person|
    if person["status"] == "Winner"
      return seasonWinner = person["name"].split(' ').first
    end
  end
end

def get_contestant_name(data, occupation)
  personOfOccupation = ""
  data.each do |season, contestantHash|
    contestantHash.each do |aContestant|
      if aContestant["occupation"] == occupation
        personOfOccupation = aContestant["name"]
      end
    end
  end
  return personOfOccupation
end

def count_contestants_by_hometown(data, hometown)
  countTown = {}
  data.each do |season, contestantHash|
    contestantHash.each do |aContestant|
      #check if hash has, or doesn't have, a key entry for hometown already
      if aContestant["hometown"] == hometown
        if countTown.has_key?(hometown) == false
            countTown[hometown] = 1
        else countTown.has_key?(hometown)
            countTown[hometown] += 1
        end
      end
    end
  end
  return countTown[hometown]
end

def get_occupation(data, hometown)
  firstHometownerJob = ""
  data.each do |season, contestantHash|
    contestantHash.each do |aContestant|
      if aContestant["hometown"] == hometown
        firstHometownerJob = aContestant["occupation"]
        return firstHometownerJob
      end
    end
  end
end

def get_average_age_for_season(data, season)
  ageTotal = 0
  contestantTotal = 0
  data.each do |seasonNum, contestantHash|
    if seasonNum == season
      contestantHash.each do |person|
        ageTotal += (person["age"]).to_f
        contestantTotal += 1
      end
    end
  end
  average = (ageTotal/contestantTotal).round
end
