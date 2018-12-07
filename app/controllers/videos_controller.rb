class VideosController < ApplicationController
  before_action :set_video, only: [:show, :upload, :edit, :update, :destroy]
  before_action :set_room, only: [:index, :new, :create]
  before_action :set_s3_direct_post, only: [:upload, :edit, :update]

  # GET /videos
  # GET /videos.json
  def index
    authorize! @room
    @videos = @room.videos
    @page_title = "#{@room.name}に収録されている動画一覧"
  end

  # GET /videos/1
  # GET /videos/1.json
  def show
    @room = @video.room
    authorize! @room
    @stream_url_ready = S3_BUCKET_HLS.object("#{ENV["SERVER_STAGE"]}/stream/#{@video.s3_key}/index.m3u8").exists?
    @page_title = @video.title
  end

  # GET /videos/new
  def new
    @video = Video.new
    @video.room_id = @room.id
  end

  def upload
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  # POST /videos.json
  def create
    @video = @room.videos.new(video_params)
    respond_to do |format|
      if @video.save
        format.html { redirect_to upload_video_path(@video), notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1
  # PATCH/PUT /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1
  # DELETE /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    def set_room
      @room = Room.find(params[:room_id])
    end

    def set_s3_direct_post
      @s3_direct_post = S3_BUCKET.presigned_post(key: "#{ENV["SERVER_STAGE"]}/uploads/video/#{@video.id}/#{SecureRandom.uuid}.mp4", success_action_status: '201', acl: 'public-read')
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def video_params
      params.require(:video).permit(:title, :s3_key, :thumbnail)
    end
end
