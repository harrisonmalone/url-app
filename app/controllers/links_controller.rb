class LinksController < ApplicationController
  def index
  end

  def show
    @link = Link.find(params[:id])
  end

  def go_to_link
    link = Link.find_by_hash_value(params[:hash])
    if !link.original_url.include?("http")
      redirect_to "https://#{link.original_url}"
    else
      redirect_to link.original_url 
    end
  end 

  def create
    @link = Link.new(link_params)
    respond_to do |format|
      if @link.save
        format.html  { redirect_to(link_show_path(@link)) }
        format.json  { render :json => @link, :status => :created, :location => @link }
      else
        format.html  { render :action => "index" }
        format.json  { render :json => @link.errors, :status => :unprocessable_entity }
      end
    end
    @link.hash_value = @link.id.to_s(36)
    @link.save
  end

  private 

  def link_params
    params.require(:link).permit(:original_url)
  end 
end 
