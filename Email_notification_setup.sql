EXECUTE msdb.dbo.sysmail_update_account_sp
@account_name = 'champions_bank',
@description = 'Champions Bank Notification System',
@email_address = 'example@example.com',
@display_name = 'Champions Bank',
@username='example@example.com',
@password='xxxxxxxx',
@mailserver_name = 'smtp.gmail.com',
@port=587,
@enable_ssl=1

EXECUTE msdb.dbo.sysmail_add_profile_sp
@profile_name = 'champions_bank',
@description = 'Champions Bank Email System'

EXECUTE msdb.dbo.sysmail_add_profileaccount_sp
@profile_name = 'champions_bank',
@account_name = 'champions_bank',
@sequence_number = 1

EXECUTE msdb.dbo.sysmail_add_principalprofile_sp
@profile_name = 'champions_bank',
@principal_name = 'public',
@is_default = 1 ;

-- SELECT *FROM msdb.dbo.sysmail_account
-- SELECT *FROM msdb.dbo.sysmail_configuration
-- SELECT *FROM msdb.dbo.sysmail_principalprofile
-- SELECT *FROM msdb.dbo.sysmail_profile
-- SELECT *FROM msdb.dbo.sysmail_profileaccount
-- SELECT *FROM msdb.dbo.sysmail_profileaccount



exec msdb.dbo.sp_send_dbmail 
@profile_name = 'champions_bank', 
@recipients = 'example_rec@example.com', 
@subject = 'Payment Reminder From Champions Bank', 
@body = 'Payment Reminder From Champions Bank',
@body_format = 'text'


SELECT * FROM msdb.dbo.sysmail_log