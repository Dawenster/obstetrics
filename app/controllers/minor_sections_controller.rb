class MinorSectionsController < ApplicationController
  def new
    @minor_section = MinorSection.new
  end

  def create
    @minor_section = MinorSection.new(minor_section_params)
    if @minor_section.save
      flash[:notice] = "#{@minor_section.name} successfully created!"
      redirect_to articles_path
    else
      flash.now[:alert] = @minor_section.errors.full_messages.to_sentence
      render "new"
    end
  end

  def edit
    @minor_section = MinorSection.find(params[:id])
  end

  def update
    @minor_section = MinorSection.find(params[:id])
    @minor_section.assign_attributes(minor_section_params)
    if @minor_section.save
      flash[:notice] = "#{@minor_section.name} successfully saved!"
      redirect_to articles_path
    else
      flash.now[:alert] = @minor_section.errors.full_messages.to_sentence
      render "edit"
    end
  end

  def drag_update
    respond_to do |format|
      @minor_section = MinorSection.find(params[:minor_section_id])
      @minor_section.update_attribute :row_order_position, params[:index]
      format.json { render :json => { :status => "success" } }
    end
  end

  def destroy
    minor_section = MinorSection.find(params[:id])
    flash[:notice] = "#{minor_section.name} successfully deleted!"
    minor_section.destroy
    redirect_to articles_path
  end

  private

  def minor_section_params
    params.require(:minor_section).permit(
      :name,
      :major_section_id
    )
  end
end