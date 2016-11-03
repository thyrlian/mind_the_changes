module MindTheChanges
  class Git
    class << self
      def get_tags_sort_by_date_asc
        cmd = `git for-each-ref --sort=taggerdate --format '%(refname) %(taggerdate)' refs/tags`
        tags = cmd.split("\n")
        tags.map! do |tag|
          tag.gsub(/.*?\/tags\//, '')
        end
        tags
      end
      
      def get_commit_hash(tag)
        cmd = `git rev-list -n 1 #{tag}`
      end
      
      def get_commit_hash_of_head
        cmd = `git rev-parse HEAD`
      end
    end
    
    private_class_method :new
  end
end