module CommandLineInterface
  class Main

    def main
      external_id = 'c55fabc5-963d-4255-a3ac-6106af020f17'

      plan_service = ::Plans::Services::PlanService.new
      pp plan_service.find_by_external_id(external_id)
    end
  end
end

