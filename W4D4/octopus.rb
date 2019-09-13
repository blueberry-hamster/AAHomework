fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(arr)
    longest = ''

    arr.each_with_index do |fish_1, i|
        arr.each_with_index do |fish_2, j|
            longest = fish_2 if fish_1.length > fish_2.length
        end
    end

    longest
end

def dominant_octopus(arr)
    arr.sort.last
end

def clever_octopus(arr)
    longest = ''

    arr.each { |fish| longest = fish if fish.length >= longest}

    longest 
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(arr)
    tentacles = Array(0..7)

    
end

def fast_dance(arr)
    
end
