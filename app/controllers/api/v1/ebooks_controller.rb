class Api::V1::EbooksController < ApplicationController
  before_action :set_ebook, only: %i[show destroy download]

  def index
    @ebooks = Ebook.order(created_at: :desc)
    render json: @ebooks.map { |ebook| ebook_json(ebook) }
  end

  def show
    render json: { success: true, message: "Ebook found", data: ebook_json(@ebook) }
  end

  def create
    @ebook = Ebook.new(ebook_params)

    if @ebook.save
      render json: { success: true, message: "Ebook created", data: ebook_json(@ebook) }, status: :created
    else
      render json: { success: false, message: "Ebook could not be created", errors: @ebook.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @ebook.destroy
    render json: { success: true, message: "Ebook deleted" }
  end

  def search
    query = params[:q].to_s.strip

    ebooks = Ebook.where(
        "LOWER(title) LIKE :query OR LOWER(author) LIKE :query",
        query: "%#{query.downcase}%"
    ).order(created_at: :desc)

    render json: {
        success: true,
        message: "Search completed.",
        data: ebooks.map { |ebook| ebook_json(ebook) }
    }
    end

    def download
      unless @ebook.file.attached?
            return render json: {
            success: false,
            message: "No file attached."
            }, status: :not_found
        end

        redirect_to rails_blob_url(@ebook.file, disposition: "attachment")
    end

  private

  def set_ebook
    @ebook = Ebook.find_by(id: params[:id])
    return if @ebook.present?
    render json: { success: false, message: "Ebook not found." }, status: :not_found and return
  end

  def ebook_params
    params.require(:ebook).permit(:title, :author, :description, :published_at, :file)
  end

  def ebook_json(ebook)
    {
        id: ebook.id,
        created_at: ebook.created_at,
        title: ebook.title,
        author: ebook.author,
        description: ebook.description,
        file_name: ebook.file.attached? ? ebook.file.filename.to_s : nil,
        file_size: ebook.file.attached? ? ebook.file.byte_size : nil,
        file_type: ebook.file.attached? ? ebook.file.content_type : nil,
        download_url: ebook.file.attached? ? rails_blob_url(ebook.file, disposition: "attachment") : nil
    }
    end
end
