# Exceptions related to Saltedge API

# Error class
class ClientDisabled < StandardError
  def to_s
    "ClientDisabled #{super}"
  end
end

# Error class
class ClientNotFound < StandardError
  def to_s
    'The API key used in the request does not belong to a client'
  end
end

# Error class
class DuplicatedCustomer < StandardError
  def to_s
    'The customer you are trying to create already exists'
  end
end

# Error class
class JsonParseError < StandardError
  def to_s
    'We have received some other request format instead of JSON, or the body could not be parsed'
  end
end

# Error class
class WrongRequestFormat < StandardError
  def to_s
    'The JSON request is incorrectly formed'
  end
end