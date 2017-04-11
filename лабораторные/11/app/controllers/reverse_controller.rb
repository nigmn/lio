class ReverseController < ApplicationController
  def data
  end
  
  def index
  end
  
  def base
    @result = Number.all
    render "base.xml"
  end
  
  def last
    f = Number.all.max_by {|i| i.updated_at}
    @result = "Transformation #{f.or} -> #{f.bin} -> #{f.rev} -> #{f.res}: updated at #{f.updated_at}"
  end

  def show
    t=params[:val].to_i
    if (t!=0) && !(f = Number.find_by_or(t)) #Can be rewritten using uniqueness attribute during record creation...
      n = Number.create(:or => t, :bin => t.to_s(2), :rev => t.to_s(2).reverse, :res => t.to_s(2).reverse.to_i(2) ) # ...here
      @result = "New record: transformation #{n.or} -> #{n.bin} -> #{n.rev} -> #{n.res}"
    else
      @result = "Existing record: transformation #{f.or} -> #{f.bin} -> #{f.rev} -> #{f.res}"
      f.touch
    end
    # Nubmer.find_of_create_by(or = t) # Failing because of an variable 'or'
    # May be used instead of whole 'if'
  end
end
