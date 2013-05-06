class Subscription
  def self.update(params)
    params.each do |param|
      puts param.inspect
    end
  end
end

