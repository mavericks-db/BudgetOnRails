class BudgetsController < ApplicationController
  def index
    @budgets = Budget.all
  end

  def show
    @budget = Budget.find(params[:id])
  end

  def new
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params)
    @group_budget = GroupBudget.new(group_id: params[:group_id], budget_id: @budget.id)
    if @budget.save
      flash[:notice] = 'Successfully created budget.'
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def budget_params
    params.permit(:name, :amount, :user_id)
  end
end
