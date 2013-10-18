Pry.config.theme = 'tomorrow-night'

def e
  exit
end

# SameSystem shortcuts
def u(id)
  User.find(id)
end

def s(id)
  Shop.find(id)
end

def c(id)
  Client.find(id)
end
