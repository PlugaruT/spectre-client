# frozen_string_literal: true

require_relative './builder'

# Class for interacting with Spectre API
class SaltedgeAPI
  def customers
    api.child('customers')
  end

  def api
    APIBuilder.new('https://www.saltedge.com/api/v4')
  end
end
