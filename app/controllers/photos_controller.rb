
class PhotosController < ProtectedController
  before_action :set_photo, only: %i[show update destroy]
  before_action :set_s3_direct_post, only: %i[new edit create update]
  # GET /photos
  def index
    # puts params.photo.vacation_id
    # param_id = params.photo.vacation_id
    # @photos = current_user.photos.where('vacation_id = ?', param_id)
    current_user.photos.all

    render json: @photos
  end

  # GET /photos/1
  def show
    render json: @photo
  end

  # POST /photos
  def create
    @photo = current_user.photos.build(photo_params)

    if @photo.save
      render json: @photo, status: :created, location: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /photos/1
  def update
    if @photo.update(photo_params)
      render json: @photo
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /photos/1
  def destroy
    @photo.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_photo
    @photo = current_user.photos.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def photo_params
    params.require(:photo).permit(:img, :caption, :vacation_id)
  end

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(
      key: "uploads/#{SecureRandom.uuid}/${filename}",
      success_action_status: '201',
      acl: 'public-read'
    )
  end
end
