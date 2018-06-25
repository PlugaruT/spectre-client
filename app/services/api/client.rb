# frozen_string_literal: true

require_relative './builder'

# Class for interacting with Saltedge API
class SaltedgeAPI

  def customers
    api_url.child('customers')
  end

  def logins
    api_url.child('logins')
  end

  def api_url
    APIBuilder.new('https://www.saltedge.com/api/v4')
  end
end
