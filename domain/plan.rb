class Plan < Entity
  attr_accessor :id, :name, :external_id, :created_at, :updated_at

  def initialize(id: nil, name:, external_id:)
    super(id: id)
    @name = name
    @external_id = external_id
  end
end
