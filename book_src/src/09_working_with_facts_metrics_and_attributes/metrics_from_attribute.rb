# encoding: UTF-8

require 'gooddata'

# Connect to GoodData platform
GoodData.with_connection do |c|
  GoodData.with_project('project_id') do |project|
    attribute = project.attributes('attr.devs.dev_id')
    metric = attribute.create_metric(:title => "Count of [#{attribute.identifier}]")
    metric.save
    metric.execute
  end
end
