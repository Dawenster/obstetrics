class MajorSectionsController < ApplicationController
  def new
    @major_section = MajorSection.new
  end

  def create
    @major_section = MajorSection.new(major_section_params)
    if @major_section.save
      flash[:notice] = "#{@major_section.name} successfully created!"
      redirect_to articles_path
    else
      flash.now[:alert] = @major_section.errors.full_messages.to_sentence
      render "new"
    end
  end

  def edit
    @major_section = MajorSection.find(params[:id])
  end

  def update
    @major_section = MajorSection.find(params[:id])
    @major_section.assign_attributes(major_section_params)
    if @major_section.save
      flash[:notice] = "#{@major_section.name} successfully saved!"
      redirect_to articles_path
    else
      flash.now[:alert] = @major_section.errors.full_messages.to_sentence
      render "edit"
    end
  end

  def drag_update
    respond_to do |format|
      @major_section = MajorSection.find(params[:major_section_id])
      @major_section.update_attribute :row_order_position, params[:index]
      format.json { render :json => { :status => "success" } }
    end
  end

  def destroy
    major_section = MajorSection.find(params[:id])
    flash[:notice] = "#{major_section.name} successfully deleted!"
    major_section.destroy
    redirect_to articles_path
  end

  private

  def major_section_params
    params.require(:major_section).permit(
      :name
    )
  end
end