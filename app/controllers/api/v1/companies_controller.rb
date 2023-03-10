# frozen_string_literal: true

class Api::V1::CompaniesController < Api::V1::BaseController
  before_action :set_company, only: [:show, :update, :destroy]

  def index
    @companies = current_administrator.companies

    render json: { data: @companies.map { |company| CompanySerializer.new(company).serializable_hash }, status: :ok }
  end

  def show
    render json: { data: CompanySerializer.new(@company).serializable_hash, status: :ok }
  end

  def create
    @company = current_administrator.companies.new(company_params)

    if @company.save
      render json: { data: CompanySerializer.new(@company).serializable_hash, status: :ok }
    else
      render json: { data: @company.errors.full_messages, status: :unprocessable_entity }
    end
  end

  def update
    if @company.update(company_params)
      render json: { data: CompanySerializer.new(@company).serializable_hash, status: :ok }
    else
      render json: { data: @company.errors.full_messages, status: :unprocessable_entity }
    end
  end

  def destroy
    if @company.destroy
      render json: { data: "Company deleted successfully", stattus: "failed" }, status: :ok
    else
      render json: { data: "Somthing went wrong", stattus: "failed" }
    end
  end

  private

  def set_company
    @company = current_administrator.companies.find params[:id]
  rescue ActiveRecord::RecordNotFound => e
    render json: e.message, stattus: :unauthorized
  end

  def company_params
    params.require(:company).permit(:name, :address, :established_year, :administrator_id)
  end
end
