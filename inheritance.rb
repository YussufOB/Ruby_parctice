module MovieFacts
  class Client
    def initialize(client_id, client_secret)
      @client_id = client_id
      @client_secret = client_secret
    end
    def directors
      fetch_data('/director').map { |director| Director.new(director) }     
    end
    def director(name)
      Director.new(fetch_data("/directors/#{name}"))
    end

    private

    def fetch_data
      #fetch directors from API
    end
  end 
end

module Moviefacts
  class Director
    def initialize(json)
      @raw_data = JSON.parse(json)
    end
    def name
      @raw_data.fetch("name")
    end
    def id
      @raw_data.fetch("id")
    end
  end
end

##Now let say the logic for fetching director list remain the same but logic for rating is changed, only 10 rating per day
module MovieFacts
  class ClientBase
    NotImplementedError = Class.new(StandardError)
    def initialize(client_id, client_secret)
      @client_id = client_id
      @client_secret = client_secret
    end
    def directors
      fetch_data('/directors').map { |director| Director.new(director) }
    end
    def director(name)
      Director.new(fetch_data("/directors/#{name}"))
    end
  
    private
  
    def fetch_data
      raise NotImplementedError
    end
  end
end

module MovieFacts
  class HttpClient < ClientBase
    
    private

    def fetch_data
      ##make Http request
      ##cache response
    end
  end
end

module MovieFacts
  class CacheClient < ClientBase
    
    private

    def fetch_data
      ##read data from cache
    end
  end
end

## The limitation of the above (simple inheritance) is that:
## -- Vulnerable to combinatorial explosion
## -- No encapsulation between the parent and descendant data

## To enhance the following approach, we imploy the method called 'Multiple Inheritance'
module Depaginatable
  def fetch_depaginated_data
    #make multiple calls to 'fetch_data'
    #combine results together
  end
end

module MovieFacts
  class HttpClient < ClientBase
    include Depaginatable

    private

    def fetch_data
      #make Http request
      #cache response
    end
  end
end

module MovieFacts
  class CacheClients < ClientBase
    include Depaginatable

    private

    def fetch_data
    #read data from cache
    end
  end
end

##However, there is still limitation to the above approach, one object does almost everything via inheritance. It is better to allow independencies between object to ease the process
module MovieFacts
  class Client
    def initialize(driver, depaginator, api_source)
      @driver = driver
      @depaginator = depaginator
      @api_source = api_source
    end
    def directors
      fetch_data('/director').map { |director| Director.new(director) }
    end
    def director(name)
      Director.new(fetch_data("/directors/#{name}"))
    end
    
    private

    def fetch_data(path)
      @depaginator.depaginate
      @driver.fetch_data(path)
    end
  end
end

#driver in different interface
module MovieFacts
  class CacheDriver
    def fetch_data
      #read data from cache
    end
  end
end

module MovieFacts
  class HttpDriver
    def fetch_data
      #fetch data HTTP
      #cache results
    end
  end
end

#Depaginator
module MovieFacts
  class Depaginator
    def depaginate(data)
      #depaginate the data
    end
  end
end

module MovieFacts
  class NoopDepaginator
    def depaginate(data)
      data #just return the data
    end
  end
end


#DECORATORS
#Decorators in MODULE + EXTEND + SUPER DECORATOR approach
class Coffee
  def cost
    2
  end
end

module Milk
  def cost
    super + 0.4
  end
end

module Sugar
  def cost
    super + 0.2
  end
end

coffee = Coffee.new
coffee.extend(Milk)
coffee.extend(Sugar)
coffee.cost

#Decorators in PLAIN OLD RUBY OBJECT (PORO) DECORATOR approach. This is mostly recommended
class Coffee
  def cost
    2
  end
  def origin
    'Coloumbia'
  end
end

class Milk
  def initialize(component) 
    @component = component
  end
  def cost
    @component.cost + 0.4
  end
end

coffee = Coffee.new
Sugar.new(Milk.new(coffee)).class
Sugar.new(Milk.new(coffee)).cost
Sugar.new(Sugar.new(coffee)).cost
