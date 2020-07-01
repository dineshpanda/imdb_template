class Api::V1::DirectorsController < Api::V1::GraphitiController
  def index
    directors = DirectorResource.all(params)
    respond_with(directors)
  end

  def show
    base_scope = params[:id].blank? ? Director.where(id: current_resource_owner) : Director.all
    director = DirectorResource.find(params, base_scope)
    respond_with(director)
  end

  def create
    director = DirectorResource.build(params)

    if director.save
      render jsonapi: director, status: :created
    else
      render jsonapi_errors: director
    end
  end

  def update
    director = DirectorResource.find(params)

    if director.update
      render jsonapi: director
    else
      render jsonapi_errors: director
    end
  end

  def destroy
    director = DirectorResource.find(params)

    if director.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: director
    end
  end
end
