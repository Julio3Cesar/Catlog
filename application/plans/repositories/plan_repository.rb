require 'redis'

module Plans
  module Repositories
    class PlanRepository

      def initialize
        @redis_conn = Redis.new(url: ENV['REDIS_URL'])
      end

      def find_by_external_id(external_id)
        selected_key = redis_conn.keys('plan*').find do |plan_key|
          YAML.load(redis_conn.get(plan_key)).external_id.eql?(external_id)
        end

        YAML.load(redis_conn.get(selected_key)) if selected_key
      end

      private

      attr_reader :redis_conn
    end
  end
end
