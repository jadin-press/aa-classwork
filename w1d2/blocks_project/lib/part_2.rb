def all_words_capitalized?(arr)
    arr.all? { |word| word.capitalize == word }
end

def no_valid_url?(arr)
    valid_urls = ['.com', '.net', '.io', '.org']
    
    arr.none? { |el| el.end_with?(*valid_urls) }
end

def any_passing_students?(arr)
    arr.any? { |student| student[:grades].sum / student[:grades].length.to_f >= 75 }
end