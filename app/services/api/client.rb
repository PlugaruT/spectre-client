# frozen_string_literal: true

require_relative './builder'

# Class for interacting with Spectre API
class SaltedgeAPI
  @url = 'https://www.saltedge.com/api/v4'

  def customers
    api_url.child('customers')
  end

  def logins
    api_url.child('logins')
  end

  def api_url
    APIBuilder.new(@url)
  end
end
