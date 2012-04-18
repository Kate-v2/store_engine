class OrdersController < ApplicationController
  before_filter :lookup_order, :only => [:show, :edit, :destroy, :update]
  before_filter :current_user, only: [:show]
  # before_filter :require_order_or_admin, :only => [:index, :show, :edit, :update]
  before_filter :require_user_or_admin, only: [:show]
  before_filter :require_admin, :only => [:destroy]

  def index
    if params[:status] == "all"
      @orders = Order.all
    elsif params[:status]
      @orders = Order.where(:status => params[:status])
    else
      @orders = Order.all
    end
  end

  def show
    if @order.user_name != "Guest"
      @user = @order.user
    end
  end

  def destroy
    session[:return_to] = request.referrer
    @order.update_attribute(:status, "cancelled")
    notice = "Order Cancelled"
    redirect_to session[:return_to], notice: notice
  end

  def edit
  end

  def update
    if @order.status == "pending" && @order.transition
      notice = "Thank you for purchasing.
                An email confirmation is on its way.".squish
      session[:order_id] = nil
      redirect_to root_url, notice: notice
    elsif @order.status != "pending" && @order.transition
      session[:return_to] = request.referrer
      notice = "Transition successful"
      redirect_to session[:return_to], notice: notice
    else
      notice = "Please input valid billing and shipping information."
      redirect_to order_path(@order), notice: notice
    end
  end

  private

  def lookup_order
    @order = Order.find(params[:id])
  end

end
