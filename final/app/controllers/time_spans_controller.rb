class TimeSpansController < ApplicationController
  before_action :set_time_span, only: [:show, :edit, :update, :destroy]

  # GET /time_spans
  # GET /time_spans.json
  def index
	#redirect_to("tasks_url")
    @time_spans = TimeSpan.all
  end

  # GET /time_spans/1
  # GET /time_spans/1.json
  def show
  end

  # GET /time_spans/new
  def new
    @time_span = TimeSpan.new
  end

  # GET /time_spans/1/edit
  def edit
  end

  # POST /time_spans
  # POST /time_spans.json
  def create
	
    @time_span = TimeSpan.new(time_span_params)

    respond_to do |format|
      if @time_span.save
        format.html { redirect_to @time_span, notice: 'Time span was successfully created.' }
        format.json { render :show, status: :created, location: @time_span }
      else
        format.html { render :new }
        format.json { render json: @time_span.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /time_spans/1
  # PATCH/PUT /time_spans/1.json
  def update
    respond_to do |format|
      if @time_span.update(time_span_params)
        format.html { redirect_to tasks_url, notice: 'Time span was successfully updated.' }
        format.json { render :show, status: :ok, location: tasks_url }
      else
        format.html { render :edit }
        format.json { render json: @time_span.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /time_spans/1
  # DELETE /time_spans/1.json
  def destroy
    @time_span.destroy
    respond_to do |format|
      format.html { redirect_to time_spans_url, notice: 'Time span was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_time_span
      @time_span = TimeSpan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def time_span_params
      params.require(:time_span).permit(:start, :end, :task_id)
    end
end
