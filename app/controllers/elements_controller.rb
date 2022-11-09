# frozen_string_literal: true

# class of controller
class ElementsController < ApplicationController
  def index; end

  def self.power_of_5?(num)
    tmp = 0
    return false if num.zero?

    while tmp.zero?
      tmp = num % 5
      num /= 5
    end
    if tmp.eql?(1) && num.zero? then true
    else
      false
    end
  end

  def self.segments_of_powers(array)
    res = []
    buf = []
    array.each do |elem|
      if power_of_5?(elem) then buf << elem
      elsif !buf.length.zero?
        res << buf
        buf = []
      end
    end
    res << buf unless buf.length.zero?
    res
  end

  def self.largest_segment(arr)
    unless arr.length.zero?
      max_subarr = arr[0]
      arr.each do |elem|
        max_subarr = elem if max_subarr.length < elem.length
      end
    end
    max_subarr
  end

  def result
    flash[:alert] = ElementsController.data_check(params[:length].to_i, params[:str_elem])
    unless flash[:alert]
      @length_of_arr = params[:length].to_i
      @array = params[:str_elem].split.map!(&:to_i)
      @array_of_pow = ElementsController.segments_of_powers(@array)
      @max_subarr = ElementsController.largest_segment(@array_of_pow)
    end
  end

  def self.data_check(len, str)
    if /[^\d^\s]/.match(str) then "Sequence isn't correct"
    else
      arr = str.split.map!(&:to_i)
      "Length isn't correct" if arr.length != len
    end
  end
end
