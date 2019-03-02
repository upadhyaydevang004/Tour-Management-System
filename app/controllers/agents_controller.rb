class AgentsController < ApplicationController
  before_action :set_agent, only: [:show, :edit, :update, :destroy]

  # GET /agents
  # GET /agents.json
  def index
    @agent = Agent.all
  end

  # GET /agents/1
  # GET /agents/1.json
  def show
    if logged_in?
      @agent = Agent.find_by(email: current_user.email)
    end
  end

  # GET /agents/new
  def new
    @agent = Agent.new
  end

  # GET /agents/1/edit
  def edit
  end

  # POST /agents
  # POST /agents.json
  def create
    @agent = Agent.new(agent_params)

    respond_to do |format|
      if @agent.save
        unless logged_in?
          log_in @agent,'Agent'
          flash[:notice] = "Welcome #{@agent.name}"
        end
        format.html { redirect_to '/login', notice: 'Agent was successfully created. Please login to continue!!' }
        format.json { render :show, status: :created, location: @agent }
      else
        format.html { render :new }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agents/1
  # PATCH/PUT /agents/1.json
  def update
    respond_to do |format|
      if @agent.update(agent_params)
        format.html { redirect_to @agent, notice: 'Agent was successfully updated.' }
        format.json { render :show, status: :ok, location: @agent }
      else
        format.html { render :edit }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agents/1
  # DELETE /agents/1.json
  def destroy
    @agent.destroy
    respond_to do |format|
      if (session[:role] == 'Admin')
        format.html { redirect_to @agent, notice: 'Agent was successfully destroyed.'}
        format.json { head :no_content }
      else
        format.html { redirect_to '/home', notice: 'Agent was successfully destroyed.'}
        format.json { head :no_content }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_agent
    @agent = Agent.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def agent_params
    params.require(:agent).permit(:email, :password, :name, :password_confirmation)
  end
end
