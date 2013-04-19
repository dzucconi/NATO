class MissingEntry < Exception; end

module NATO
  DICTIONARY = {
    :letters => {
      :a   => :Alfa,
      :b   => :Bravo,
      :c   => :Charlie,
      :d   => :Delta,
      :e   => :Echo,
      :f   => :Foxtrot,
      :g   => :Golf,
      :h   => :Hotel,
      :i   => :India,
      :j   => :Juliett,
      :k   => :Kilo,
      :l   => :Lima,
      :m   => :Mike,
      :n   => :November,
      :o   => :Oscar,
      :p   => :Papa,
      :q   => :Quebec,
      :r   => :Romeo,
      :s   => :Sierra,
      :t   => :Tango,
      :u   => :Uniform,
      :v   => :Victor,
      :w   => :Whiskey,
      :x   => :'X-ray',
      :y   => :Yankee,
      :z   => :Zulu,
      :-   => :Dash,
      :'.' => :Stop
    },

    :digits => {
      :'0'    => :Zero,
      :'1'    => :One,
      :'2'    => :Two,
      :'3'    => :Three,
      :'4'    => :Four,
      :'5'    => :Five,
      :'6'    => :Six,
      :'7'    => :Seven,
      :'8'    => :Eight,
      :'9'    => :Niner,
      :'100'  => :Hundred,
      :'1000' => :Thousand,
      :'.'    => :Point
    }
  }

  def self.lookup(string, dictionary)
    value = DICTIONARY[dictionary][string.to_sym]

    # Attempt to locate in the alternate dictionary
    # 
    value = DICTIONARY[(dictionary == :letters ? :digits : :letters)][string.to_sym] if value.nil?

    raise MissingEntry if value.nil?

    return value
  end
end
