class KittensController < ApplicationController

  def index
    @kittens = Kitten.all
  end

  def create
    @kitten = Kitten.create(kitten_params)
    if @kitten
      flash[:success] = "You successfully made a kitten"
      redirect_to root_url
    else
      flash.now[:failure] = "Failed to make a kitten"
      redirect_to root_url
    end
  end

  def new
    @kitten = Kitten.new
  end

  def edit
    @kitten = Kitten.find(params[:id])
  end

  def show
    @kitten = Kitten.find(params[:id])
  end

  def update
    @kitten = Kitten.find(params[:id])
    if @kitten.update_attributes(kitten_params)
      flash[:success] = 'Kitten profile has been updated!'
      redirect_to @kitten
    else
      render 'edit'
    end
  end

  def destroy
    Kitten.find(params[:id]).destroy
    flash[:success] = "RIP Kitten"
    redirect_to root_url
  end

  private

    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end

end
