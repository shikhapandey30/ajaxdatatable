# class PostDatatable < AjaxDatatablesRails::Base

#   def view_columns
#     @view_columns ||= {
#       id: { source: "Post.id"},
#       name: { source: "Post.name" },
#       custom_column: { source: "custom_column", cond: filter_custom_column_condition },
#       first_name: { source: "Post.first_name" },
#       last_name: { source: "Post.last_name", cond: filter_country_condition },
#     }
#   end

#   private
#   def data
#     records.map do |post|
#       {
#         id: post.id,
#         name: post.name,
#         first_name: post.first_name,
#         last_name: post.last_name,
#         custom_column: post[:custom_column]
#       }
#     end
#   end

#   def get_raw_records
#     Post.select('posts.*, timezone AS custom_column').includes(:country)
#   end

#   def filter_country_condition
#     ->(column) { column.table[column.field].eq(column.search.value.to_i + 1) }
#   end

#   def filter_custom_column_condition
#     ->(column) { ::Arel::Nodes::SqlLiteral.new(column.field.to_s).matches("#{ column.search.value }%") }
#   end
# end


class PostDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      # id: { source: "User.id", cond: :eq },
      # name: { source: "User.name", cond: :like }
      id:          { source: "Post.id" },
      name:       { source: "Post.name" },
      desc: { source: "Post.desc" },
      first_name:    { source: "Post.first_name"},
      last_name:         { source: "Post.last_name" },
    }
  end

  def data
    records.map do |post|
      {
          id:          post.id,
          name:        post.name,
          desc:        post.desc,
          first_name:  post.first_name,
          last_name:   post.last_name,
          # DT_RowId:    post.id,
      }
    end
  end



  def get_raw_records
    Post.all
  end

end