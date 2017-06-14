class IncreaseRetentionPeriod < ActiveRecord::Migration
  NEW_RETENTION_PERIOD = 120 * 86400 # 120 days
  OLD_RETENTION_PERIOD =  90 * 86400 #  90 days

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
