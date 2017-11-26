
class PhotosController < ProtectedController
  # require_relative '../../config/initializers/aws.rb'
  before_action :set_photo, only: %i[show update destroy]
  before_action :set_s3_direct_post, only: %i[new edit create update]

  # GET /photos
  def index
    @photos = current_user.photos.all

    render json: @photos
  end

  # GET /photos/1
  def show
    render json: @photo
  end

  # POST /photos
  def create
    puts 'image params are', photo_params['file']

    @s3_direct_post = S3_BUCKET.presigned_post(key: "uploads/#{SecureRandom.uuid}/${filename}", success_action_status: 201, acl: :public_read)

    # @photo = current_user.photos.build(photo_params)

    # if @photo.save
    #   render json: @photo, status: :created, location: @photo
    # else
    #   render json: @photo.errors, status: :unprocessable_entity
    # end
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
    params.require(:image).permit(:title, :file)
  end

  def set_s3_direct_post
    @s3_direct_post = S3_BUCKET.presigned_post(
      key: "uploads/#{SecureRandom.uuid}/${filename}",
      success_action_status: '201',
      acl: 'public-read'
    )
  end
end
