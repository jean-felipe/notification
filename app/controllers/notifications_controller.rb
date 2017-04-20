class NotificationsController < ApplicationController
  before_action :set_notification, only: [:show, :edit, :update, :destroy]

  #
  def index
    @notifications = Notification.all
  end

  def show
  end

  def new
    @notification = Notification.new
  end

  def edit
  end 

  def create
    @notification = Notification.new(notification_params)
    @notification.user = current_user
    respond_to do |format|
      if @notification.save
        format.html { redirect_to root_path, notice: 'Notification was successfully created.' }
        format.json { render :show, status: :created, location: @notification }
        push_notification
      else
        format.html { render root_path }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @notification.update(notification_params)
        format.html { redirect_to @notification, notice: 'Notification was successfully updated.' }
        format.json { render :show, status: :ok, location: @notification }
      else
        format.html { render :edit }
        format.json { render json: @notification.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_url, notice: 'Notification was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_notification
      @notification = Notification.find(params[:id])
    end

    def notification_params
      params.require(:notification).permit(:content, :notification_type)
    end

    def push_notification
      Pusher.trigger('notification_channel', 'my-event', {
         message: 'Hey test!'
        })
    end
end
