module Plans
  module Services
    class PlanService

      def initialize()
        @plan_repository = Plans::Repositories::PlanRepository.new
      end

      def find_by_external_id(external_id)
        plan = plan_repository.find_by_external_id(external_id)
        to_struct(plan) if plan
      end

      private

      attr_reader :periodicity, :customer_id, :plan_external_id
      attr_reader :plan_repository

      def to_struct(plan)
        PlanStruct.new(plan.name, plan.external_id)
      end
    end
  end
end

PlanStruct = Struct.new(:name, :external_id)
