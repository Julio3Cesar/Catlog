require 'redis'

module CommandLineInterface
  class Main

    def main
      external_id = 'c55fabc5-963d-4255-a3ac-6106af020f17'
=begin
      plan1 = Plan.new(name: 'VPS', external_id: SecureRandom.uuid)
      plan2 = Plan.new(name: 'Hospedagem', external_id: external_id)
      redis_conn = Redis.new(:host => 'localhost', :port => '6379')
      redis_conn.set("plan:#{plan1.id}", plan1.to_yaml)
      redis_conn.set("plan:#{plan2.id}", plan2.to_yaml)
=end

      plan_service = ::Plans::Services::PlanService.new
      pp plan_service.find_by_external_id(external_id)
    end
  end
end

