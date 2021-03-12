set :bind, '0.0.0.0'

# PlansController
get '/plans/:external_id' do
  plan = Plans::Services::PlanService.new.find_by_external_id(params[:external_id])
  if plan
    plan.to_h.to_json
  else
    status 404
    'Not found!'
  end
end
