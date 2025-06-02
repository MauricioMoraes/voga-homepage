# frozen_string_literal: true

class Object
  def blank?
    respond_to?(:empty?) ? !!empty? : !self
  end

  def present?
    !blank?
  end
end

class NilClass
  def blank?
    true
  end
end

class String
  def blank?
    empty? || strip.empty?
  end
end