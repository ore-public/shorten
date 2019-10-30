class RedirectsController < ApplicationController
  def show
    @url = Url.find_by(slug: params[:slug], from_domain: params[:d])
    not_found if @url.nil?

    redirect_to @url.url
  end
end
