class AdvertsController < ApplicationController
  authorize_resource class: false, only: :index
  load_and_authorize_resource except: :index

  def index
    authorize! :index, :advert
    @adverts = Advert.order(created_at: :desc)
  end

  def create
    if @advert.save
      redirect_to root_path, notice: t('created')
    else
      render :new
    end
  end

  def update
    if @advert.update(advert_params)
      redirect_to root_path, notice: t('updated')
    else
      render :edit
    end
  end

  def destroy
    @advert.destroy and redirect_to root_path
  end

  private

  def advert_params
    params.require(:advert).permit(:title, :body)
  end
end
