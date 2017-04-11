class ReverseController < ApplicationController
  def data
  end

  def show
    t=params[:val].to_i
    if t!=0
    @result = params[:val].to_i.downto(2).map { |i|
      [i.to_s, i.to_s(2), i.to_s(2).reverse, i.to_s(2).reverse.to_i(2).to_s]
    }
    else
    @result=[['Input','data','is not a','number']]
    end
  end
end
