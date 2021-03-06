class VideoUploadsController < ApplicationController
	@@tag_present = false
	
  def new
    @video_upload = VideoUpload.new
    if current_user
      render :new
    else
      redirect_to '/auth/google_oauth2'
    end
	
		if params['tag']
			@@tag_present = true
		end
  end

  def create
		current_user_id = current_user.id
		
    @video_upload = VideoUpload.new(title: params[:video_upload][:title],
                                  description: params[:video_upload][:description],
                                  file: params[:video_upload][:file].try(:tempfile).try(:to_path))

    @tag = params[:video_upload][:tag]
		
    if @video_upload.save
      uploaded_video = @video_upload.upload!(current_user)

      if uploaded_video.failed?
        flash[:error] = 'There was an error while uploading your video...'
      else
        Video.create({ link: "https://www.youtube.com/watch?v=#{uploaded_video.id}", tag: @tag })
        flash[:success] = 'Your video has been uploaded! It is being processed and will appear shortly.'
				
				if @@tag_present
					Video.last.update_columns(is_contribution: true, user_id: current_user_id)
					@@tag_present = false #seems hacky
				else
					Tag.last.update_columns(user_id: current_user_id) #is Tag.last really the way to go?
					Video.last.update_columns(user_id: current_user_id)
				end
      end

      redirect_to root_url
    else
      render :new
    end
  end

end