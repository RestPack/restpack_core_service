module RestPack::Core::Service
  class Tasks
    def self.load_tasks
      load "restpack_core_service/tasks/db.rake"
    end
  end
end
