class MainController < ApplicationController

  def index
    @slide_show = [
      {
        name: 'Mỹ Phẩm Li-pans',
        slide: 'Nhiều dòng sản phẩm',
        des: 'Hãy để Li-pans',
        content: 'giúp bạn có một làn da như ý',
        image_url: 'slideshow/1.jpg'
      },
      {
        name: 'Kem trị mụn',
        slide: 'khác nhau',
        des: 'Hiệu quả nhanh chóng',
        content: 'và an toàn cho da',
        image_url: 'slideshow/2.jpg'
      },
      {
        name: 'Dưỡng toàn thân',
        slide: 'phù hợp',
        des: 'Không gây kích ứng cho da',
        content: 'làm trắng toàn thân',
        image_url: 'slideshow/3.jpg'
      },
      {
        name: 'Làm giảm',
        slide: 'cho nhiều độ tuổi',
        des: 'lão hóa da',
        content: 'xóa mờ các vết thâm',
        image_url: 'slideshow/4.jpg'
      }
    ]
    @best_products = Product.where(is_best: true)
    @random_products = Product.limit(4).order("RAND()")
  end

  def product
    @product = Product.find_by(id: params[:id])
    @similar_products = Product.where(type_id: @product.type_id).where.not(id: @product.id).limit(3).order("RAND()")
    @random_products = Product.limit(3).order("RAND()")
    @best_products = Product.where(is_best: true)
  end

  def all
    @page = params[:page].present? ? params[:page].to_i : 1
    if params[:id].present?
      @id = params[:id].to_i
      @type = Type.find_by(id: @id)
      @total = (@type.products.length.to_f/6).ceil
      @products = @type.products.page(@page).per(6)
    elsif params[:keyword].present?
      @keyword = params[:keyword].to_s
      @products = Product.search(@keyword).order(id: :desc)
      @total = 1  
    else
      @total = Product.all.length/6
      @products = Product.page(@page).per(6)
    end
    @best_products = Product.where(is_best: true)
  end

end
