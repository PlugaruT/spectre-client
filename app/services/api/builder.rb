# frozen_string_literal: true

require_relative './http_client'

# Allows building an URL path from parts,
# and calling HTTP methods on the built URL
class APIBuilder
  def initialize(base_url)
    @url_parts = [base_url]

    # this should be send as param, but for the sake of testing, it's ok :)
    @http_client = Saltedge.new
  end

  # builder methods
  def child(child)
    @url_parts.push(child)
    self
  end

  def item(id)
    @url_parts.push(id.to_s)
    self
  end

  # final methods
  def get(params = {})
    @http_client.get(build_url, params)
  end

  def post(params = {})
    @http_client.post(build_url, params)
  end

  def put(params = {})
    @http_client.put(build_url, params)
  end

  private

  def build_url
    @url_parts.join('/')
  end
end
