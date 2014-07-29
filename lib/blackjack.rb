class Blackjack
    def getscore arr
        score11 = transAce11(transJQK(arr)).map{|x| x.to_i}.reduce(:+)
        score1 = transAce1(transJQK(arr)).map{|x| x.to_i}.reduce(:+)
        
        score11 > 21 ? score1 : score11        
    end
end

private

def transJQK arr
    arr.map {|i| (%w{J Q K}.include?i) ? "10" : i}
end

def transAce11 arr
    arr.map {|x| x=="A" ? "11" : x}
end

def transAce1 arr
    arr.map { |x| x=="A" ? "1" : x}
end
