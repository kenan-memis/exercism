class ETL
  class << self
    def transform(old)      
      old.invert.inject({}) do |hash, (k, v)| 
        k.map { |i| hash[i.downcase] = v }
        hash 
      end
    end
  end
end
