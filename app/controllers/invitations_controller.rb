class InvitationsController < ApplicationController
  before_action :authenticate_user!
  def index
  
    @user = current_user
    
    @pending = @user.pending_invitations
    # end
    @friends = Invitation.all.select{ |m| m.confirmed == true || (m.user_id == @user.id || m.friend_id == @user.id)}

   
  end

  def new
  end

  def create

    # debugger
    @invitation = current_user.invitations.create(invite_params)
    if @invitation.save
      redirect_to root_path
    else
      render all_user_path
    end
  end

  def accept
    
    @invitation = Invitation.find(params[:id])
    accept = @invitation.update(invite_params)
    redirect_to root_path
  end

  def destroy
    
    @invitation = Invitation.find(params[:id])
    @invitation.destroy
    redirect_to root_path


  end

  private

  def invite_params
    params.permit(:friend_id,:confirmed)
  end
      
    
end
