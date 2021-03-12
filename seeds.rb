require 'redis'

pp 'Populate database'

external_id = 'c55fabc5-963d-4255-a3ac-6106af020f17'
plan1 = Plan.new(name: 'VPS', external_id: SecureRandom.uuid)
plan2 = Plan.new(name: 'Hospedagem', external_id: external_id)
redis_conn = Redis.new(url: ENV['REDIS_URL'])
pp redis_conn.set("plan:#{plan1.id}", plan1.to_yaml)
pp redis_conn.set("plan:#{plan2.id}", plan2.to_yaml)
pp redis_conn.keys('*')
