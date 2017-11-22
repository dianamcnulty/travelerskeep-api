class VacationsController < ProtectedController
  before_action :set_vacation, only: %i[show update destroy]

  # GET /vacations
  def index
    @vacations = current_user.vacations.all

    render json: @vacations
  end

  # GET /vacations/1
  def show
    render json: @vacation
  end

  # POST /vacations
  def create
    @vacation = current_user.vacations.build(example_params)

    if @vacation.save
      render json: @vacation, status: :created, location: @vacation
    else
      render json: @vacation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vacations/1
  def update
    if @vacation.update(vacation_params)
      render json: @vacation
    else
      render json: @vacation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vacations/1
  def destroy
    @vacation.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_vacation
    @vacation = current_user.vacations.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def vacation_params
    params.require(:vacation).permit(:country, :state, :user_id, :month, :year, :companions)
  end
end
