def my_min(list)
    min = nil
    list.each do |el1|
        min = el1 if list.count{|el2| el1 <= el2 } == list.length       
    end
    min
end
#time complexity - O(n^2)


def my_min2(list)
    list.inject{|acc, el| acc > el ? el : acc }
end
#time complexity - O(n)

list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]

p my_min2(list)