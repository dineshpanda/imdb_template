class Api::V1::RolesController < Api::V1::GraphitiController
  def index
    roles = RoleResource.all(params)
    respond_with(roles)
  end

  def show
    role = RoleResource.find(params)
    respond_with(role)
  end

  def create
    role = RoleResource.build(params)

    if role.save
      render jsonapi: role, status: :created
    else
      render jsonapi_errors: role
    end
  end

  def update
    role = RoleResource.find(params)

    if role.update_attributes
      render jsonapi: role
    else
      render jsonapi_errors: role
    end
  end

  def destroy
    role = RoleResource.find(params)

    if role.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: role
    end
  end
end
