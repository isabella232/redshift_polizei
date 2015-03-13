require 'aws'

module Reports
  #
  # Report retireving the disk space usage from CloudWatch
  #
  class DiskSpaceCloudwatch < Base

    #
    # retrieves disk usage and capacity for RedShift from CloudWatch Metric
    #
    def run
      cluster_identifier = GlobalConfig.aws('cluster_identifier')
      clusters = AWS::Redshift::Client.new.describe_clusters(cluster_identifier: cluster_identifier)
      cluster = clusters[:clusters][0]
      cloudwatch = AWS::CloudWatch::Client.new
      i = 0
      cluster[:cluster_nodes].select { |node| node[:node_role] != 'LEADER' }.map do |node|
        dimensions = [{
          name: "ClusterIdentifier",
          value: cluster_identifier
        },{
          name: "NodeID",
          value: "Compute-#{i}"
        }]
        i += 1
        req = {namespace: "AWS/Redshift",
          metric_name: "PercentageDiskSpaceUsed",
          start_time: (Time.now - 86400).iso8601,
          end_time: (Time.now - 1).iso8601,
          period: 86400,
          statistics: ["Average"],
          dimensions: dimensions}
        # query results from CloudWatch
        result = cloudwatch.get_metric_statistics(req)
        # transform result for frontend
        if result[:datapoints].empty?
          { 'node' => node[:node_role],
            'pct' => 0,
          }
        else
          { 'node' => node[:node_role],
            'pct' => result[:datapoints][0][:average]
          }
        end
      end
    end
  end
end
