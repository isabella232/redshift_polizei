class IncreaseRetentionPeriod < ActiveRecord::Migration
  NEW_RETENTION_PERIOD = 90 * 86400 # 90 days
  OLD_RETENTION_PERIOD = 30 * 86400 # 30 days

  def up
    execute <<~SQL
      UPDATE audit_log_config SET retention_period = #{NEW_RETENTION_PERIOD}
    SQL
  end

  def down
    execute <<~SQL
      UPDATE audit_log_config SET retention_period = #{OLD_RETENTION_PERIOD}
    SQL
  end
end
