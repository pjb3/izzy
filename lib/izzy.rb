require 'izzy/version'

module Izzy
  def all_of?(*methods)
    methods.all? &method(:value_if_respond_to)
  end

  def any_of?(*methods)
    methods.any? &method(:value_if_respond_to)
  end

  def none_of?(*methods)
    methods.none? &method(:value_if_respond_to)
  end

  private

  def value_if_respond_to(method)
    respond_to?(method) && send(method)
  end
end
