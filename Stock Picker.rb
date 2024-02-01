stocks= [17,3,6,9,15,8,6,1,10]

def stock_picker(prices)
    pairs = []
    #this next loop gets all the possible pairs from the stock prices 
    #with this format [Price 1, Price 2, Index 1, Index 2]
    prices.each_with_index do |price, index|
        i = 1
        while (index + i) < prices.length
            pairs << [price, prices[index + i], index, index + i]
            i += 1
        end
    end
    #this next code gets the sum of the buy/sell
    hash = {}
    pairs.each do |pair|
        hash[pair] = pair[1] - pair[0]
    end
    #this next code gets the pair with the highest value
    max_pair = hash.max_by { |key, value| value}
    puts "Buy on index #{max_pair[0][2]}"
    puts "Sell on index #{max_pair[0][3]}"
    puts "For a profit of $#{max_pair[0][1]} - $#{max_pair[0][0]} = #{max_pair[1]}"
end

stock_picker(stocks)
