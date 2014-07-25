class InvestorsController < ApplicationController
before_filter :authenticate_user!
helper_method :sort_column, :sort_direction

  def index
    @investors = Investor.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 15, :page => params[:page])
  end

  def show
    @investor = Investor.find(params[:id])
  end
  
  def new
    @investor = Investor.new
  end
  
  def create
    @investor = Investor.new(params[:product])
    if @investor.save
      flash[:notice] = "Successfully created investor."
      redirect_to @investor
    else
      render :action => 'new'
    end
  end
  
  def edit
    @investor = Investor.find(params[:id])
  end
  
  def update
    @investor = Investor.find(params[:id])
    if @investor.update_attributes(params[:investor])
      flash[:notice] = "Successfully updated investor."
      redirect_to @investor
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @investor = Investor.find(params[:id])
    @investor.destroy
    flash[:notice] = "Successfully destroyed investor."
    redirect_to investor_url
  end


  private
  
    def sort_column
      Investor.column_names.include?(params[:sort]) ? params[:sort] : "fund"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end

end

